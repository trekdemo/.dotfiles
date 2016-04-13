#!/usr/bin/env bash

# Checkout the dotfiles
# git clone https://github.com/trekdemo/.dotfiles.git ~/.dotfiles

if ! [ -L ~/.config ]; then
  echo "Symlink ~/.config"
  ln -snf ~/.dotfiles/xconfig ~/.config
fi

echo "Linking common settings"
ln -snf ~/.dotfiles/.pryrc            ~/.pryrc
ln -snf ~/.dotfiles/.tmux.conf        ~/.tmux.conf
ln -snf ~/.dotfiles/gitconfig         ~/.gitconfig
ln -snf ~/.dotfiles/.gitignore-global ~/.gitignore
ln -snf ~/.dotfiles/.agignore         ~/.agignore
ln -snf ~/.dotfiles/.ctags            ~/.ctags
ln -snf ~/.dotfiles/.tmuxifier        ~/.tmuxifier


# Install http://brew.sh
if ! [ -x /usr/local/bin/brew ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Setup fish
if ! [ -x /usr/local/bin/fish ]; then
  echo "Ïnstalling fish"
  brew install fish
  sudo echo "/usr/local/bin/fish" >> /etc/shells
  chsh -s /usr/local/bin/fish
fi

if ! [ -x /usr/local/bin/nvim ]; then
  brew install neovim/neovim/neovim
fi


