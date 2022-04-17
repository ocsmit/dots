#!/bin/bash

DIR="${PWD}/config"

ln -s $DIR/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $DIR/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -s $DIR/UltiSnips $HOME/.config/UltiSnips
ln -s $DIR/.tmux.conf $HOME/.tmux.conf
