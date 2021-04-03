# Loading order - alphabetical
# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/
# +----------------+-----------+-----------+------+
# |                |Interactive|Interactive|Script|
# |                |login      |non-login  |      |
# +----------------+-----------+-----------+------+
# | /etc/zshenv    |    A      |    A      |  A   |
# +----------------+-----------+-----------+------+
# | ~/.zshenv      |    B      |    B      |  B   |
# +----------------+-----------+-----------+------+
# | /etc/zprofile  |    C      |           |      |
# +----------------+-----------+-----------+------+
# | ~/.zprofile    |    D      |           |      |
# +----------------+-----------+-----------+------+
# | /etc/zshrc     |    E      |    C      |      |
# +----------------+-----------+-----------+------+
# | ~/.zshrc       |    F      |    D      |      |
# +----------------+-----------+-----------+------+
# | /etc/zlogin    |    G      |           |      |
# +----------------+-----------+-----------+------+
# | ~/.zlogin      |    H      |           |      |
# +----------------+-----------+-----------+------+
# ~~~~~~~~~~~~~~~~~~~~~~~ 8< ~~~~~~~~~~~~~~~~~~~~~~
# +----------------+-----------+-----------+------+
# | ~/.zlogout     |    I      |           |      |
# +----------------+-----------+-----------+------+
# | /etc/zlogout   |    J      |           |      |
# +----------------+-----------+-----------+------+

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Load config files
for rc in $(ls "$HOME/.config/zsh/"); do
  if [ -f "$HOME/.config/zsh/$rc" ]; then
    source "$HOME/.config/zsh/$rc"
  fi
done

# Setup prompt
# https://starship.rs/config/
eval "$(starship init zsh)"
