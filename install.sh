#!/bin/bash

# Install brew command
if ! command -v brew >/dev/null; then
  echo "Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  export PATH="/usr/local/bin:$PATH"
fi

if ! command -v stow >/dev/null; then
  echo 'Install stow'
  brew install stow
fi
echo 'Link dotfiles'
stow dev executables git tmux xdg_config terminfo

# Install apps & commands via brew
brew bundle install --global

# Install necessary python modules
pip3 install --user --requirement requirements.txt

# TODO: Install terminfo from Alacritty
curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info --output alacritty.info --silent
sudo tic -e alacritty,alacritty-direct alacritty.info
rm alacritty.info

# TODO: Install tpm as a git submodule
