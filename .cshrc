# .cshrc

# User specific aliases and functions

# Source global definitions
if ( -f /etc/csh.login ) then
	source /etc/csh.login
endif

# path setting
#setenv PATH ${PATH}:${HOME}/bin
setenv USERNAME ""

# Emacs style key binding
bindkey -e

# enable search on prompt
bindkey "^R" i-search-back
bindkey "^S" i-search-fwd

# unlimit stacksize for large aray in user mode
#limit stacksize unlimited

# set aliases
alias ls	'ls -F --color=auto'
alias ll	'ls -la --color=auto'
alias la	'ls -a --color=auto'
alias rm        'rm -i'
alias cp        'cp -i'
alias eng	'env LANG=C LANGUAGE=C LC_ALL=C'
