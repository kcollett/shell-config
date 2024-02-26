# -*- mode: shell-script; -*-
#
#  Common aliases
#
#echo In aliases:

# job control
#NB: I barely use job control these days
# for jobnum in 1 2 3 4 5 6 7 8 9
# do
#     alias %${jobnum}="fg %${jobnum}"
# done
# unset jobnum
alias j='jobs -l'

# directory stack management
alias d='dirs -v'
# alias pu=pushd
# alias po=popd
alias pu=pushd
alias po=popd
for dirnum in 1 2 3 4 5 6 7 8 9; do
    alias ${dirnum}="pushd +${dirnum}"
done
unset dirnum

# ls
#NB: omz/lib/theme-and-appearance aliases ls to ls -G to support color display
alias l=ls
alias la='ls -Ca'
alias lf='ls -CF'

alias ll='ls -lh'
alias ltr='ll -tr'
alias lld='ll -d'
alias lla='ll -a'
alias lut='ll -ut'
alias lct='ll -ct'

# git
alias gi='git init'
alias ga='git add'
alias gd='git diff'
alias gc='git commit'
alias gph='git push'
alias gpl='git pull'
alias gs='git status'
alias gss='git status -s'
alias gl='git log'
# be mindful of github command-line 'gh'
alias ghe='git help'

# vim
#alias v=vim
#alias vi=vim
#alias view='vim -R'
alias v=nvim
alias vi=nvim
alias view='nvim -R'

# miscellaneous
#alias bigprocs='ps -ael | sort -nr +9 -10'
#alias diff='$DIFFER'
#alias e='$EDITOR'
alias g='grep -E '
alias h=history
alias m=less
alias mcs='mcfly search'
#alias r=rsh
alias xa='xargs '
alias z=suspend

# python
alias mkvenv='python3 -m venv venv'
alias acvenv="source venv/bin/activate"
# install package in current directory into venv
# NB: called "editable mode" (pip) / "develop mode" (setuptools)
alias venvinst='python3 -m pip install --editable .'
# manual upgrade of pip; mainly used for venvs
# Should be fixed in new version of pip;
# see https://github.com/pypa/pip/issues/11155
# python upgraded to 3.10; comment this out for now
#alias pipupg='python3 -m pip install --upgrade pip'
