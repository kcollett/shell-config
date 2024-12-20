#  -*- mode: shell-script; -*-
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#XXX: Not using P10K for now
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# I specifically need to do this for emacs shell-mode
ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# XXX: probably need to be more inclusive
[ "${TERM_PROGRAM}" = "iTerm.app" \
    -o "${TERM_PROGRAM}" = "tmux" \
    -o "${TERM}" = "alacritty" \
    -o "${TERM_PROGRAM}" = "Apple_Terminal" ] && 
    export IS_TERMINAL="true" ||
    export IS_TERMINAL="false"
#print IT: $IS_TERMINAL

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="minimal"
#ZSH_THEME="powerlevel10k/powerlevel10k"
# NB: picked "tango light" in iterm2 to make the blue for directory lighter
[ "${IS_TERMINAL}" = "true" ] && ZSH_THEME="agnoster" || ZSH_THEME="minimal"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#KC: Skip git plugin because it defines a ton of aliases; I prefer to make them as needed.
plugins=(aliases vi-mode)

source $ZSH/oh-my-zsh.sh

# undo some stupid crap that OMZ has done in omz/lib/directories.zsh
unsetopt auto_pushd
unsetopt pushdminus
unsetopt pushd_ignore_dups

# Add my custom functions to fpath
fpath=($fpath ~/.functions)
autoload man dirstack_vars

# add hook to save directory stack components into variables $d<number>
chpwd_functions+=('dirstack_vars')
# I tried "set -o magic_equal_subst" to get ~ expansion but that didn't work
dirstack_vars

# User configuration

# agnoster theme customization

# customize agnoster prompt_dir to limit current directory display
# to two components (usually that's enough)
prompt_dir() {
    prompt_segment blue $CURRENT_FG '%2~'
}

# suppress agnoster user@host display if logged in as "myself"
export DEFAULT_USER="karencollett"

# keep Python virtual environment from fussing with PS1 so agnoster will do its thing
export VIRTUAL_ENV_DISABLE_PROMPT=true


#
# PATH setup
#

# If we are in a homebrew environment, determine the path to the "brew"
# command and use it to initialize our shell environment
# NB: We have to work a bit because "brew" resides in a different
# directory on pre-Apple-Silicon machines.
old_brew="/usr/local/bin/brew"
new_brew="/opt/homebrew/bin/brew"
if [ -e "$new_brew" ]
then
    brew="$new_brew"
elif [ -e "$old_brew" ]
then
    brew="$old_brew"
fi
echo "brew: $brew"
[ -n "${brew+1}" ] && eval "$($brew shellenv)"

# NB: The important changes are established "brew shellenv" command above
# export MANPATH="/usr/local/man:$MANPATH"
# export INFOPATH="/usr/local/INFO:$INFOPATH"

# typeset -U snarfed from
# https://unix.stackexchange.com/questions/62579/is-there-a-way-to-add-a-directory-to-my-path-in-zsh-only-if-its-not-already-pre
typeset -U path PATH

# to prepend, use path=(newdir "$path[@]")
path+=("$HOME/sh")
path+=("$HOME/sh.local")
# prepend homebrew python bin directory
#path=($(brew --prefix python)/libexec/bin "$path[@]")
export PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

if [ "${IS_TERMINAL}" = "true" ]
then
    # Not sure if I want to bring in the whole environ/path stuff here,
    # so we'll take baby steps
    PAGER=less
    MANPAGER=less
    # -F: automatically exit if entire output can be displayed on one screen
    # -j: jump target offset (e.g. for positioning search results)
    # -M: more verbose prompt
    # -q: use visual bell instead of audio
    # -R: output ANSI color and OSC8 escape sequences in "raw" form
    # -X: disable termcap init/deinit strings
    # -z: size of screen to display;
    #     a negative value creates overlap between pages
    LESS="-FMR -j2 -z-2"
    CDPATH="~"
    #dots=".[a-zA-Z0-9]*" # quick way to get at the dot files
    HISTSIZE=500
    # Need to set both because I'm using the installed ls (on MacOS)
    # and the Homebrew zsh.
    # see https://geoff.greer.fm/lscolors/
    # and https://gist.github.com/thomd/7667642
    CLICOLOR=1
    LSCOLORS=Exfxcxdxbxegedabagacad
    LS_COLORS="di=1;34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
    export PAGER MANPAGER LESS CDPATH HISTSIZE CLICOLOR LSCOLORS LS_COLORS

    # mcfly config
    eval "$(mcfly init zsh)"

    # Set up fzf key bindings and fuzzy completion
    eval "$(fzf --zsh)"

    # -- Use fd instead of fzf --
    export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"

    # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
    # - The first argument to the function ($1) is the base path to start traversal
    # - See the source code (completion.{bash,zsh}) for the details.
    _fzf_compgen_path() {
        fd --hidden --exclude .git . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
        fd --type=d --hidden --exclude .git . "$1"
    }

    # theme for bat
    export BAT_THEME=DarkNeon

    # try out this funky ls
    alias e='eza -l'

    # zsh-autosuggestions config
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    bindkey '^ ' autosuggest-accept # use Ctrl-<space> to accept suggestion

    # zsh-syntax-highlighting
    # NB: According to the installation documentation, this needs to be
    #     at the end of the .zshrc file.
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#XXX: Not using P10K for now
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
