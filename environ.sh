# -*- mode: shell-script; -*-
#
# Environment variables
#
#echo In .environ:
#echo "Path: " $PATH

# Where the newer functions live
FUNDIR="$HOME/.functions"; export FUNDIR

# Set up *PATH variables
#. "$FUNDIR/pathfuncs"
. "$HOME/.path"

ALIASFILE="$HOME/.alias"	# file where Alias info is kept
CDPATH=".:~"
HISTSIZE=500
export ALIASFILE CDPATH HISTSIZE

# application-specific
EXINIT='set autoindent autowrite ignorecase redraw'
LESS='--dumb'
#MANPAGER uses PAGER if set, /usr/bin/less -is otherwise
export EXINIT LESS

# miscellaneous
dots=".[a-zA-Z0-9]*"			# quick way to get at the dot files
TRUE="y"; FALSE=""
export NAME dots TRUE FALSE
export PWD

#  Source local profile if it exists
[ -r "$HOME/.environ.local" ] && . "$HOME/.environ.local"

# common commands
#. "$FUNDIR/first_choice"
#DIFFER=diff
#EDITOR=vim
#GREPPER=egrep
#PAGER=less
# have to use long path because we're not using the Homebrew Emacs
#[ "$INSIDE_EMACS" ] && EDITOR=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
#DIFFER=`first_choice gnudiff diff cmp`
#EDITOR=`first_choice quick_emacs emacs vi ex ed`
#GREPPER=`first_choice egrep grep`
#PAGER=`first_choice less more pg cat`
#export DIFFER EDITOR GREPPER PAGER

# Initialize the umask (deny write to others)
umask 022

# $ENV_DEFINED
ENV_DEFINED=$TRUE
export ENV_DEFINED
