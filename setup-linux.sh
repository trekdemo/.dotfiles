#!/bin/bash

sudo add-apt-repository ppa:fish-shell/release-2 -y
sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -yqqu \
  readline \
  git \
  build-essential \
  htop \
  fish \
  wget \
  tar \
  exuberant-ctags \
  cmake \
  silversearcher-ag \
  tig \
  python-dev python-pip python3-dev python3-pip \



current_user=`whoami`

# Install tmux from source
sudo apt-get -y remove tmux
sudo apt-get install libevent-dev libncurses-dev -yqqc
VERSION=2.8 && mkdir ~/tmux-src && wget -qO- https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz | tar xvz -C ~/tmux-src && cd ~/tmux-src/tmux*
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
./configure && make -j"$(nproc)" && sudo make install
cd && rm -rf ~/tmux-src

# Install rbenv
sudo apt-get install ruby-build -y
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
pushd ~/.rbenv
src/configure && make -C src
popd

# Install fish
sudo chsh -s /usr/bin/fish $current_user
curl -L https://get.oh-my.fish | fish

# Install NeoVim
sudo curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -o /usr/bin/nvim
sudo chmod +x /usr/bin/nvim
sudo apt-get install  -y
# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall -c quitall

sudo apt-get autoremove -y
