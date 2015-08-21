# Check for an interactive session
[ -z "$PS1" ] && return

if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PATH=$PATH:$HOME/.gem/ruby/1.9.1/bin:$HOME/.scripts:/usr/local/bin
export CDPATH=.:~:/mnt:/etc:/var/log:~/git:~/git/sysadmin
export -n PS1="\n\u@\h:\[\e[0;32m\]\w\[\e[m\]\$(parse_git_branch)\[\033[00m\] $ "
export EDITOR=/usr/bin/vim
export HISTSIZE=1000000
export HISTFILESIZE=1000000000
export HISTCONTROL=ignoredups:ignorespace
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'
export CLICOLOR=1
export LS_COLORS='di=1:ow=0;1:'
export LSCOLORS=HxfxcxdxbxexexabagacHx

#share history between terminal sessions
#append to the history file, don't overwrite it
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

#eval `keychain --quiet --eval --nocolor --agents ssh id_rsa`

#colored man pages
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan
