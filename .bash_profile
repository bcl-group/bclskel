# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

# addpath $HOME/bin
BASH_ENV=$HOME/.bashrc
#USERNAME=""

export USERNAME BASH_ENV PATH LESSOPEN
[ -f $HOME/.mozc/.session.ipc ] && rm -f $HOME/.mozc/.session.ipc 
[ -f $HOME/.mozc/.server.lock ] && rm -f $HOME/.mozc/.server.lock

