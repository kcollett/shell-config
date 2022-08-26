# -*- mode: shell-script; -*-
#
#echo In zshrc:

: For emacs, define environment if it has not been done so already
[ -z "$ENV_DEFINED" ] && . "$HOME/.environ"

: read in local shell RC stuff
: NB: .zshrc.local has to do its own check for interactive-only stuff
[ -r "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

: BEGIN case-wrap for interactive shells
case $- in
*i*)

set -o emacs

# : we prefer per-shell history
# unset HISTFILE

: set some control variables

: Define common aliases
source "$HOME/.aliases"
alias h='history'

: define some functions
#source "$FUNDIR/first_choice"
#source "$FUNDIR/pathfuncs"
#source "$FUNDIR/xt_title"
#source "$FUNDIR/gx"

: Alias-of-the-Month setup
[ -r "$ALIASFILE" ] && . "$ALIASFILE"

: define to_tilde function
#source "$FUNDIR/to_tilde"

: prompt, emacs shell-mode support
##XXtypeset -x CURDIR
##XXdo_misc ()
##XX{
    #CURDIR=$(to_tilde "$PWD")
##XX    CURDIR="$PWD"
#    [ ! -z "$LEMACS" ] && echo "cwd: $CURDIR" || echo "$CURDIR"
##XX    CURDIR=$(echo "$CURDIR" | sed "s,..*\(/[^/]*/[^/]*\),...\1,")
##XX}
##XXdo_misc

: Directory stack setup
#source "$FUNDIR/dirstack.bash"
#alias cd=chdir
#cd				# to clean up automounted dreck

formatted_dirs ()
{
    declare    fd_tmp=`mktemp /tmp/dirs_XXX`
    declare -i num=0
 
    dirs -p |
    while read f
    do
        echo $num: $f
	echo "d$num='$f'" >>$fd_tmp
        let num++
    done

    source "$fd_tmp"
    rm "$fd_tmp"
}

push_dir ()
{
    [ "$@" ] && pushd "$@" >/dev/null || pushd >/dev/null
    formatted_dirs
}

pop_dir ()
{
    [ "$@" ] && popd  "$@" >/dev/null || popd  >/dev/null
    formatted_dirs
}

export CLICOLOR=YES
export LSCOLORS=fxGxcxdxBxegedabagacad


: Prompt setup
##XXsource "$HOME/.colors"
#PS1="\h:"'$CURDIR'"$_ids $_time"' $ '
#PS1="\[${IWhite}\]\h:\W \u\$\[${Color_Off}\] "
#PS1="\[${IWhite}\]\w\n\$\[${Color_Off}\] "
# see http://blog.taylormcgann.com/tag/prompt-color/
##XXexport PS1="\[\033[0;35m\]\W\[\033[0m\] \[\033[0;31m\]\u\\[\033[1;37m\]\$\[\033[0m\] "
#autoload -U colors && colors
PS1="%{%F{magenta}%B%}%2/%{%b%f%} %# "


#PS1="\h:\w \# \$ "
#PS1='\u@\h \w\n\$ '

: END case-wrap for interactive shells
;;
esac
