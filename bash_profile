# Inspired by:
# http://welinux.ru/post/7293/
# https://github.com/cowboy/dotfiles/
# https://github.com/miripiruni/dotfiles
# https://github.com/dreadatour/dotfiles


# Global Variables #
####################

# npm
if [ -d ~/.npm-global ]; then
    export PATH=~/.npm-global/bin:$PATH
    export NODE_PATH=$NODE_PATH:~/.npm-global/lib/node_modules
fi

# bash prompt
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-atelierforest.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL



# Path #
########

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi



# bash prompt
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi



# color in different utilitties by default
alias ls='ls --color=auto'
alias grep='grep --color=auto'
eval `dircolors -b`


# color in man
export LESS_TERMCAP_mb=$'\033[01;36m'
export LESS_TERMCAP_md=$'\033[01;32m'
export LESS_TERMCAP_me=$'\033[0m'
export LESS_TERMCAP_mu=$'\033[01;37m'
export LESS_TERMCAP_se=$'\033[0m'
export LESS_TERMCAP_so=$'\033[01;44;33m'
export LESS_TERMCAP_ue=$'\033[0m'
export LESS_TERMCAP_us=$'\033[01;36m'


# Variable to use colorful MC and VIM
# Deprecated: Used from `Xresources`
# export TERM=xterm-256color

export EDITOR=/usr/bin/vim

# big history
export HISTFILESIZE=20000
export HISTSIZE=20000

# append to the history file, don't overwrite it
shopt -s histappend

# Combine multiline commands into one in history
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE="&:ls:[bf]g:exit"

# Load extra (private) settings
[ -f ~/.bashlocal ] && source ~/.bashlocal
