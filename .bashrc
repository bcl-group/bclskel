# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#stty -ixon

# unlimit stacksize for large aray in user mode
#ulimit -s unlimited

# set aliases
alias rm='del'
alias ..='cd ..'
alias cp='cp -aurv'
alias ls='ls -F --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -a --color=auto'
alias eng='LANG=C LANGUAGE=C LC_ALL=C'

# user file-creation mask
umask 022

# cvs
export CVSROOT=/home/venus/cvs
export CVSEDITOR="/usr/bin/ng"
