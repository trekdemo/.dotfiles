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
export TZ="/usr/share/zoneinfo/Europe/Amsterdam"
export LANG="en_US.utf-8"
export LC_ALL="en_US.utf-8"

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
# Add Python bin paths to the PATH
# $HOME/Library/Python/*/bin
export PATH="$HOME/Library/Python/*/bin:$PATH"
export PATH=".git/safe/../../node_modules/.bin/:$PATH"
export PATH=".git/safe/../../bin:$PATH"

# Load config files
for rc in $(ls "$HOME/.config/zsh/conf.d/"); do
  if [ -f "$HOME/.config/zsh/conf.d/$rc" ]; then
    source "$HOME/.config/zsh/conf.d/$rc"
  fi
done

chruby 3

# Setup prompt
# https://starship.rs/config/
eval "$(starship init zsh)"

# Load abbreviations plugin
[ -d "$(brew --prefix)/share/zsh-abbr" ] && source "$(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
