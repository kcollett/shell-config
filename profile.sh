# -*- mode: shell-script; -*-
#
#echo In .profile:

# We don't have that many windows any more, and
# it's handy to preserve history across logouts.
#	rm -f $HOME/.sh_history

# define environment if it has not been done so already
[ -z "$ENV_DEFINED" ] && . "$HOME/.environ"

#
#  Source local profile if it exists
#
[ -r $HOME/.profile.local ] && . $HOME/.profile.local

#
# This is necessary because bash is brain-damaged in that it does not
# read its rc-file for login shells.
#
case $SHELL in
*bash)
	# comment out until I'm sure I need it
	source $HOME/.bashrc
	;;
esac

# added by rust setup
. "$HOME/.cargo/env"
