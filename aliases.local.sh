# -*- mode: shell-script; -*-
#
# "Local" aliases. This mainly means OS-specific, but can also apply to aliases that
# seem to be short-lived.
#
#echo In aliases.local:
#alias aacg='aacgain -a -m 5 -p -c'
alias aacg='aacgain -r -p'
alias hwmod='sysctl hw.model'
# unhide directories like ~/Library under Lion (and later)
# e.g.: unhide ~/Library
alias unhide='chflags nohidden'
alias img_size='sips -g pixelWidth -g pixelHeight'
alias py=python3
alias vsc='code --wait'
#alias dk=docker
#alias dkc='docker container'
#alias dki='docker image'
