#alias for editing aliases
alias va='vim ~/.bash_aliases; source ~/.bash_aliases && echo ":: aliases sourced"'

alias ls='ls -CF --color=auto --group-directories-first'
alias ll='ls -alh --group-directories-first'
alias la='ls -A --group-directories-first'
alias cr='rsync -rPh'
#vim's less macro
alias less='/usr/share/vim/vim73/macros/less.sh'

alias words="shuf -n3 /usr/share/dict/cracklib-small | tr -d '\n'"

alias o='popd'
alias 1="pushd"
alias 2="pushd +2"
alias 3="pushd +3"
alias 4="pushd +4"
alias 5="pushd +5"
alias 6="pushd +6"

alias ..='cd ..'
alias ...='cd ../../'

#top 10 memory consuming process
alias topmem="ps axo pid,pcpu,pmem,comm --sort=-rss | head -20"
#top 10 CPU consuming process
alias topcpu="ps axo pid,pcpu,pmem,comm --sort=-pcpu| head -20"

alias S="sudo pacman -Ss"
alias I="sudo pacman -Sy"
alias U="sudo pacman -Syu"

alias t='todo.sh -+ -@'
alias th="t ls home"
alias tw='t ls work'
alias tmus='t ls music'
alias tmov='t ls movies'
alias tv='t ls tv'

# SCRIPTS
alias log='python2 ~/.scripts/log.py -d ~/sync/log/ -l work'
alias post='python2 ~/.scripts/post.py -r ~/git/eskp/ -e entries/'

# go to new directory
function md() { mkdir -p "$1" && cd "$1"; }

# awk arithmetic
function c() { awk "BEGIN{ print $* }" ;}

# push directory and list
function p() {
        pushd "$1"
        status=$?
        [ $status -eq 0 ] && ls || (exit 1)
}
# change directory and list
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
