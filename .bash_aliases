#alias for editing aliases
alias va='vim ~/.bash_aliases; source ~/.bash_aliases && echo ":: aliases sourced"'

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh' 
alias la='ll -a'
alias cr='rsync -rPh'
#vim's less macro
alias less='/usr/share/vim/vim73/macros/less.sh'

alias words="shuf -n3 /usr/share/dict/cracklib-small | tr '\n' ' '"

alias o='popd'
alias 1="pushd"
alias 2="pushd +2"

alias ..='cd ..'
alias ...='cd ../../'

#top 10 memory consuming process
alias topmem="ps axo pid,pcpu,pmem,comm --sort=-rss | head -20"
#top 10 CPU consuming process
alias topcpu="ps axo pid,pcpu,pmem,comm --sort=-pcpu| head -20"

alias S="pac"
alias I="sudo pacman -Sy"
alias U="sudo pacman -Syu"
alias Q="sudo pacman -Qi"

alias t='todo.sh -+ -@'
alias th="t ls home"
alias tw='t ls work'
alias tmus='t ls music'
alias tmov='t ls movies'
alias tv='t ls tv'

alias log="$HOME/git/eskp.net/log.py -d $HOME/git/eskp.net/log/logs"

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
#colour pacman search output
function pac() {
        local CL='\\e['
        local RS='\\e[0;0m'

        echo -e "$(pacman -Ss "$@" | sed "
            /^core/     s,.*,${CL}1;31m&${RS},
            /^extra/    s,.*,${CL}0;32m&${RS},
            /^community/    s,.*,${CL}0;34m&${RS},
            /^[^[:space:]]/ s,.*,${CL}0;36m&${RS},
        ")"
}
