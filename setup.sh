#!/usr/bin/env bash

# Checkout the dotfiles
git clone https://github.com/trekdemo/.dotfiles.git ˜/.dotfiles

if [ -L  ];
  echo "Symlink ˜/.config"
  ln -snf ˜/.dotfiles/xconfig ˜/.config
end

# Install http://brew.sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Setup fish
brew install fish
echo "/usr/local/bin/fish" >> /etc/shells
chsh -s /usr/local/bin/fish

brew install neovim/neovim/neovim
