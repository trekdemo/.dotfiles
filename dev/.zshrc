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
BROWSER=open
if [ -z "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL=nvim
else
  export VISUAL="nvr -cc split --remote-wait +'setlocal bufhidden=wipe'"
fi
export EDITOR="$VISUAL"

[ -d "$HOME/bin" ]        && export PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"
[ -d "$HOME/go/bin" ]     && export PATH="$HOME/go/bin:$PATH"
for version in $(ls "$HOME/Library/Python"); do
  if [ -d "$HOME//Library/Python/$version/bin" ]; then
    export PATH="$HOME//Library/Python/$version/bin:$PATH"
  fi
done
export PATH=".git/safe/../../node_modules/.bin/:$PATH"
export PATH=".git/safe/../../bin:$PATH"

# Load config files
for rc in $(ls "$HOME/.config/zsh/"); do
  if [ -f "$HOME/.config/zsh/$rc" ]; then
    source "$HOME/.config/zsh/$rc"
  fi
done

chruby 3

# Setup prompt
# https://starship.rs/config/
eval "$(starship init zsh)"
