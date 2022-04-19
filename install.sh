#!/bin/bash

DIR="${PWD}/config"

ln -sf $DIR/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $DIR/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -sf $DIR/UltiSnips $HOME/.config/UltiSnips
ln -sf $DIR/.tmux.conf $HOME/.tmux.conf
