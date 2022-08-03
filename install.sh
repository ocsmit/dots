#!/bin/bash


COMMONDIR="${PWD}/common"

contains() {
    [[ $1 =~ (^|[[:space:]])$2($|[[:space:]]) ]] && exit(0) || exit(1)
}

while getopts ":h" option; do
   case $option in
      h) # Host
	 HOST=$OPTARG
         exit;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

HOSTDIR="${PWD}/${HOST}"


ln -sf $COMMONDIR/.zshrc $HOME/.zshrc
ln -sf $COMMONDIR/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $COMMONDIR/UltiSnips $HOME/.config
ln -sf $COMMONDIR/.tmux.conf $HOME/.tmux.conf
ln -sf $COMMONDIR/sxhkd $HOME/.config

ln -sf $HOSTDIR/bspwm $HOME/.config
ln -sf $HOSTDIR/polybar $HOME/.config
