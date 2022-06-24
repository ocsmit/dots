#!/bin/bash

# Install requirements
apt-get update
apt install -y \
    tmux \
    ripgrep \
    zsh

# Get latest nvim 0.7.0 + plugins
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb -O nvim.deb

sudo dpkg -i --force-overwrite nvim.deb

pip install black

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

python3 -m pip install --user --upgrade pynvim

chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# symlink config files
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim

echo 'alias vi="nvim"' >> ~/.zshrc
source ~/.zshrc

./install.sh
