#!/usr/bin/env bash

source ~/.git-prompt.sh
source ~/.bash-utils.sh
source ~/.bash-java.sh
source ~/.bash-completion.sh
source ~/.bash-fzf.sh

export GOPATH=~/.local/go

export EDITOR=nvim
export PS1='\[\033[36m\][$(shorten_path)]\[\e[31m\]$(__git_ps1)\n\[\033[36m\]$ \[\033[m\]'

export CLICOLOR=1
export LSCOLORS=ExBxhxDxfxhxhxhxhxcxcx

export PATH=${HOME}/.local/bin:/usr/local/opt/python/libexec/bin:$PATH

source ~/.bash-aliases.sh
source ~/.bashrc

eval $(thefuck --alias)

