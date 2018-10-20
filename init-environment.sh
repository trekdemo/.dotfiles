#!/usr/bin/env bash

# Checkout the dotfiles
# git clone https://github.com/trekdemo/.dotfiles.git ~/.dotfiles

if ! [ -L ~/.config ]; then
  echo "Symlink ~/.config"
  ln -snf ~/.dotfiles/xconfig ~/.config
fi

echo "Linking common settings"
ln -snf ~/.dotfiles/.agignore       ~/.agignore
ln -snf ~/.dotfiles/.ctags          ~/.ctags
ln -snf ~/.dotfiles/.gitconfig      ~/.gitconfig
ln -snf ~/.dotfiles/.myclirc        ~/.myclirc
ln -snf ~/.dotfiles/.pryrc          ~/.pryrc
ln -snf ~/.dotfiles/.psqlrc         ~/.psqlrc
ln -snf ~/.dotfiles/.railsrc        ~/.railsrc
ln -snf ~/.dotfiles/.tigrc          ~/.tigrc
ln -snf ~/.dotfiles/.tmux.conf      ~/.tmux.conf

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  ~/.dotfiles/setup-linux.sh
elif [[ "$unamestr" == 'Darwin' ]]; then
  ~/.dotfiles/setup-macos.sh
fi
