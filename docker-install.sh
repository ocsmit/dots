#!/bin/bash

apt-get update

apt install -y \
    tmux \
    ripgrep 

wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb

sudo dpkg -i --force-overwrite nvim-linux64.deb

pip install black

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p $HOME/.config 
mkdir -p $HOME/.config/nvim

./install.sh


