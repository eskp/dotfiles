if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi

if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    xinit -- /usr/bin/X -nolisten tcp > ~/.log/xinit.log 2>&1
    logout
fi
