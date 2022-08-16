#!/bin/bash


COMMONDIR="${PWD}/common"



HOSTDIR="${PWD}/$1"


ln -sf $COMMONDIR/.zshrc $HOME/.zshrc
ln -sf $COMMONDIR/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $COMMONDIR/UltiSnips $HOME/.config
ln -sf $COMMONDIR/.tmux.conf $HOME/.tmux.conf

if [[ "$OSTYPE" != "darwin"* ]]; then
    ln -sf $HOSTDIR/bspwm $HOME/.config
    ln -sf $HOSTDIR/polybar $HOME/.config
    ln -sf $COMMONDIR/sxhkd $HOME/.config
fi
