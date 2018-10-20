#!/bin/bash

# sudo apt-get update
# sudo apt-get upgrade -y
# 
# sudo apt-get install -y git
# sudo apt-get install -y build-essential

current_user=`whoami`
sudo apt-get install ruby-build -y
# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
pushd ~/.rbenv 
src/configure && make -C src
popd

# Install fish
sudo apt-get install fish -y
sudo chsh -s /usr/bin/fish $current_user
curl -L https://get.oh-my.fish | fish

# Install NeoVim
sudo curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /usr/bin/nvim
sudo chmod +x /usr/bin/nvim
sudo apt-get install python-dev python-pip python3-dev python3-pip -y
# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall -c quitall

sudo apt-get autoremove -y
