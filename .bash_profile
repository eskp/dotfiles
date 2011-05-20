if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    xinit > /dev/null 2>&1
    logout
fi
