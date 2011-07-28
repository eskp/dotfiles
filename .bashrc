# Check for an interactive session
[ -z "$PS1" ] && return

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

export PATH=$PATH:$HOME/scripts:/usr/local/bin
export PS1='\n[\u@\h:\w]\$ '
export EDITOR=/usr/bin/vim
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth

#share history between terminal sessions
shopt -s histappend
PROMPT_COMMAND='history -a'

eval `keychain -q --eval --nocolor --agents ssh $HOME/.ssh/id_rsa`
