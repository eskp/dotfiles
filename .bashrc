# Check for an interactive session
[ -z "$PS1" ] && return

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

export PATH=$PATH:$HOME/scripts:/usr/local/bin
export CDPATH=.:~:/mnt:/etc:/var/log
export PS1='\n[\u@\h:\w]\$ '
export EDITOR=/usr/bin/vim
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth

#share history between terminal sessions
shopt -s histappend
PROMPT_COMMAND='history -a'
# correct minor typos in a cd command
shopt -s cdspell
# pattern matching (? * + @ !)
shopt -s extglob
# vi editing mode
set -o vi
# ^l clears screen
bind -m vi-insert "\C-l":clear-screen

eval `keychain -q --eval --nocolor --agents ssh $HOME/.ssh/id_rsa`
