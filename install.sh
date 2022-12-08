#!/bin/bash

# Install brew command
if ! command -v brew >/dev/null; then
  echo "Installing Homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
fi

if ! command -v stow >/dev/null; then
  echo 'Install stow'
  brew install stow
fi
echo 'Linking dotfiles'
make link

# Install apps & commands via brew
brew bundle install --global

# Install necessary python modules
pip3 install --user --requirement requirements.txt

# TODO: Install terminfo from Kitty
# curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info --output alacritty.info --silent
# echo "Enter password for \`sudo tic -e alacritty,alacritty-direct alacritty.info\`"
# sudo tic -e alacritty,alacritty-direct alacritty.info
# rm alacritty.info

# Install tmp the plugin manager for tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
