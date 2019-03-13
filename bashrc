#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias em='emacsclient -nw'
alias pm='sudo pacman -Sy'
PS1='[\u@\h \W]\$ '

