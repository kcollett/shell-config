# -*- mode: shell-script; -*-
#
# Setup various *PATH variables.  Many of these will not exist on a
# given machine, but are intended to be exported (via rXcmd) to other
# machines.
#

#echo In .path
#echo "Path: " $PATH

:
: '$PATH', '$GOPATH', '$MANPATH', and '$LD_LIBRARY_PATH' setup
:

# build updated PATH value off to side
tmppath="$PATH"

: GOPATH
export GOPATH="$HOME/go"
#[[ -d "$GOPATH/bin"      && "$tmppath" != *$GOPATH/bin* ]]      && tmppath="$GOPATH/bin:$tmppath"

: Rust
[[ -d "$HOME/.cargo/bin" && "$tmppath" != *$HOME/.cargo/bin* ]] && tmppath="$HOME/.cargo/bin:$tmppath"

: Python
[[ -d "$HOME/pbin" && "$tmppath" != *$HOME/pbin* ]] && tmppath="$HOME/pbin:$tmppath"

: Personal commands
# bash dependent code here
[[ -d "$HOME/bin" && "$tmppath" != *$HOME/bin* ]] && tmppath="$HOME/bin:$tmppath"
[[ -d "$HOME/sh" && "$tmppath" != *$HOME/sh* ]] && tmppath="$HOME/sh:$tmppath"
[[ -d "$HOME/sh.local" && "$tmppath" != *$HOME/sh.local* ]] && tmppath="$HOME/sh.local:$tmppath"
[[ "$tmppath" != *:. ]] && tmppath="$tmppath:."

export PATH="$tmppath"
#echo Path: $PATH

# Old/obsolete setup below

#MANPATH=/usr/share/man

#PERLLIB=/usr/local/lib/perl
#: personal PERL libraries
#if [ -d "$HOME/lib/perl" ]
#then
#	:
#	addpath PERLLIB "$HOME/lib/perl"
#fi

#: Java CLASSPATH
## why would we do this? CLASSPATH=.
#    pathadd      CLASSPATH ~/lib/java
#    pathadd      CLASSPATH ~/play/classes
#    pathadd      CLASSPATH ~/lib/java/bsh.jar ~/lib/java/jde.jar
#export CLASSPATH

# Source local path file if it exists
[ -r $HOME/.path.local ] && . $HOME/.path.local

#: export the paths
#[ "$MANPATH" ]	       && export MANPATH
#[ "$LD_LIBRARY_PATH" ] && export LD_LIBRARY_PATH
#[ "$PERLLIB" ]	       && export PERLLIB
