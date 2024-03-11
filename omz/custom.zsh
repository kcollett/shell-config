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

# vi-mode customizations (some need to occur after plugin is loaded)
VI_MODE_SET_CURSOR=true
MODE_INDICATOR=""
# keep blinking cursor
# see https://www.baeldung.com/linux/console-cursor-features
VI_MODE_CURSOR_NORMAL=1
VI_MODE_CURSOR_VISUAL=5
VI_MODE_CURSOR_INSERT=5
