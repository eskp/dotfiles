#SCRIPTS
alias t='python2 ~/.scripts/t.py --task-dir ~/.tasks --list tasks'
alias tmov='python2 ~/.scripts/t.py --task-dir ~/.tasks --list movies'
alias tmus='python2 ~/.scripts/t.py --task-dir ~/.tasks --list music'

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
alias topmem="ps auxf | sort -nr -k 4 | head -10"
#top 10 CPU consuming process
alias topcpu="ps auxf | sort -nr -k 3 | head -10"

alias S="sudo pacman -Ss"
alias I="sudo pacman -Sy"
alias U="sudo pacman -Syu"
