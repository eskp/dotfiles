#alias for editing aliases
alias va='vim ~/.bash_aliases; source ~/.bash_aliases && echo ":: aliases sourced"'

#alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh' 
alias la='ll -a'
alias cr='rsync -rPh'
#vim's less macro
alias less='/usr/share/vim/vim73/macros/less.sh'

alias words="shuf -n3 /usr/share/dict/cracklib-small | tr '\n' ' '"

alias o='popd'
alias 1="pushd"
alias 2="pushd +2"

#top 10 memory consuming process
alias topmem="ps axo pid,pcpu,pmem,comm --sort=-rss | head -20"
#top 10 CPU consuming process
alias topcpu="ps axo pid,pcpu,pmem,comm --sort=-pcpu| head -20"

alias log="$HOME/git/eskp.net/log.py $HOME/git/eskp.net/public/log.eskp.net/logs"

alias mirror="xrandr --auto --output VGA1 --mode 1360x768 --output LVDS1 --mode 1280x800"
alias vgaoff="xrandr --output LVDS1 --mode 1280x800 --output VGA1 --off"
alias rightof="xrandr --noprimary --output VGA1 --mode 1360x768 --right-of LVDS1"
#alias leftof="xrandr --noprimary --output VGA1 --mode 1360x768 --left-of LVDS1"
alias leftof="xrandr --noprimary --output VGA1 --mode 1680x1050 --left-of LVDS1"

alias psc='ps xawf -eo pid,user,cgroup,args'

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias go='git checkout '
alias gr='git remote'
alias gk='gitk --all&'
alias gx='gitx --all'

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
# colour pacman search output
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
# go up directories
function up() { local x='';for i in $(seq ${1:-1});do x="$x../"; done;cd $x; }

function clear_openstack() {
    unset $(env | grep EC2 | cut -d= -f1)
}
