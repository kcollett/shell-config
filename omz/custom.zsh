# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#
source "$HOME/.aliases"
[ -r "$HOME/.aliases.local" ] && source "$HOME/.aliases.local"
bindkey -e
# vi-mode plugin
#bindkey -v
#VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
