if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    xinit 2>&1 ~/.log/xinit.log
    logout
fi
