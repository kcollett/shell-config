# -*- mode: shell-script; -*-
#
#echo In .bashrc:

: For emacs, define environment if it has not been done so already
[ -z "$ENV_DEFINED" ] && . "$HOME/.environ"

# max out file size limit
#ulimit $(ulimit -H)

: read in local .bashrc stuff
: NB: .bashrc.local has to do its own check for interactive-only stuff
[ -r "$HOME/.bashrc.local" ] && source "$HOME/.bashrc.local"

: BEGIN case-wrap for interactive shells
case $- in
*i*)

    set -o emacs

    # : we prefer per-shell history
    # unset HISTFILE

    : set some control variables
    FIGNORE="~"
    HISTCONTROL="ignoredups" # ignore duplicate commands
    cdable_vars="yes"
    command_oriented_history="yes"
    # this includes . and .. -- no fun for rm *
    #glob_dot_filenames="yes"		# include dot files in '*' expansion
    unset MAILCHECK # don't check for mail

    : Define common aliases
    source "$HOME/.aliases"
    alias h='history'

    : marking directories
    mark() {
        eval $1=$PWD
    }

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
    typeset -x CURDIR
    do_misc() {
        #CURDIR=$(to_tilde "$PWD")
        CURDIR="$PWD"
        CURDIR=$(echo "$CURDIR" | sed "s,..*\(/[^/]*/[^/]*\),...\1,")
    }
    do_misc

    : Directory stack setup
    #source "$FUNDIR/dirstack.bash"
    #alias cd=chdir
    #cd				# to clean up automounted dreck

    formatted_dirs() {
        declare fd_tmp=$(mktemp /tmp/dirs_XXX)
        declare -i num=0

        dirs -p |
            while read f; do
                echo $num: $f
                echo "d$num='$f'" >>$fd_tmp
                let num++
            done

        source "$fd_tmp"
        rm "$fd_tmp"
    }

    push_dir() {
        [ "$@" ] && pushd "$@" >/dev/null || pushd >/dev/null
        formatted_dirs
    }

    pop_dir() {
        [ "$@" ] && popd "$@" >/dev/null || popd >/dev/null
        formatted_dirs
    }

    : Prompt setup
    source "$HOME/.colors"
    #PS1="\h:"'$CURDIR'"$_ids $_time"' $ '
    #PS1="\[${IWhite}\]\h:\W \u\$\[${Color_Off}\] "
    #PS1="\[${IWhite}\]\w\n\$\[${Color_Off}\] "
    # see http://blog.taylormcgann.com/tag/prompt-color/
    export PS1="\[\033[0;35m\]\W\[\033[0m\] \[\033[0;31m\]\u\\[\033[1;37m\]\$\[\033[0m\] "

    #PS1="\h:\w \# \$ "
    #PS1='\u@\h \w\n\$ '

    : END case-wrap for interactive shells
    ;;
esac

: rust setup
. "$HOME/.cargo/env"
