#!/bin/bash

DIR="${PWD}/config"

ln -sf $DIR/.zshrc $HOME/.zshrc
ln -sf $DIR/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $DIR/UltiSnips $HOME/.config/UltiSnips
ln -sf $DIR/.tmux.conf $HOME/.tmux.conf
