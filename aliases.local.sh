# -*- mode: shell-script; -*-
#
# "Local" aliases. This mainly means OS-specific, but can also apply to aliases that
# seem to be short-lived.
#
#echo In aliases.local:
#alias aacg='aacgain -a -m 5 -p -c'
#alias aacg='aacgain -r -p'
# rsgain preset .ini files are in ~/Library/rsgain/presets/
alias rsgain='~/Applications/rsgain easy'
# standard YT audio extract
alias ytxa='yt-dlp --extract-audio --audio-format flac --audio-quality 0'
# show the internal hardware mode indentifier for this machine
alias hwmod='sysctl hw.model'
# unhide directories like ~/Library under Lion (and later)
# e.g.: unhide ~/Library
alias unhide='chflags nohidden'
# turn off quarantine bit for the specified file
alias unquarantine='xattr -d com.apple.quarantine'
alias img_size='sips -g pixelWidth -g pixelHeight'
alias py=python3
alias vsc='code --wait'
alias lnv='NVIM_APPNAME="nvim-lazy" nvim'
alias knv='NVIM_APPNAME="nvim-kickstart" nvim'
alias flask_run='flask run -h localhost -p 8000'
#alias dk=docker
#alias dkc='docker container'
#alias dki='docker image'
