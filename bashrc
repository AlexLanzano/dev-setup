#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias em='emacsclient -nw'
alias pm='sudo pacman -Sy'
alias grep='grep --color=always '
PS1='[\u@\h \W]\$ '
