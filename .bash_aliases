#alias for editing aliases
alias va='vim ~/.bash_aliases; source ~/.bash_aliases && echo ":: aliases sourced"'

alias ls='ls -CF --color=auto'
alias ll='ls -alh --group-directories-first'
alias la='ls -A --group-directories-first'

alias v='vim'

function cd() {
        if [ "$#" == 0 ]; then
                builtin cd ~
                ls
        else
                builtin cd "$1"
                status=$?
                [ $status -eq 0 ] && ls || (exit 1)
        fi
}

alias p='pushd'
alias o='popd'
alias 1="pushd"
alias 2="pushd +2"
alias 3="pushd +3"
alias 4="pushd +4"
alias 5="pushd +5"
alias 6="pushd +6"

alias diskspace='du -S | sort -n -r | more'

alias ..='cd ..'
alias ...='cd ../../'

#top 10 memory consuming process
alias topmem="ps axo pid,pcpu,pmem,comm --sort=-rss | head -20"
#top 10 CPU consuming process
alias topcpu="ps axo pid,pcpu,pmem,comm --sort=-pcpu| head -20"

alias S="sudo pacman -Ss"
alias I="sudo pacman -Sy"
alias U="sudo pacman -Syu"

alias t='task'
alias th='task project:home'
alias tw='task project:work'
alias tmus='task project:music'
alias tmov='task project:movies'
alias tv='task project:tv'
alias log='python2 ~/.scripts/log.py -d ~/Dropbox/logs/ -l work'
alias post='python2 ~/.scripts/post.py -d ~/site/eskp/entries/'

# awk arithmetic
function c() { awk "BEGIN{ print $* }" ;}
