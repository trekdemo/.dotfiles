# ENV variables
type -q open; and set -gx BROWSER open
type -q nvim; and set -gx VISUAL nvim
set -gx EDITOR $VISUAL
set -gx TZ '/usr/share/zoneinfo/Europe/Amsterdam'
set -gx LANG en_US.utf-8
set -gx LC_ALL en_US.utf-8

# PATH
test -d "$HOME/bin";        and set -gx PATH "$HOME/bin" $PATH
test -d "$HOME/.local/bin"; and set -gx PATH "$HOME/.local/bin" $PATH
test -d "$HOME/.cargo/bin"; and set -gx PATH "$HOME/.cargo/bin" $PATH
# Add project specific paths
set -gx PATH ".git/safe/../../bin" $PATH
set -gx PATH ".git/safe/../../node_modules/.bin/" $PATH

# CDPATH
test -d ~/projects; and set -gx CDPATH ./ ~/projects $CDPATH

# Load local variables
test -f ~/.local/env_vars.fish; and source ~/.local/env_vars.fish

# The next line updates PATH for the Google Cloud SDK.
test -f '/Users/gergosulymosi/Downloads/google-cloud-sdk/path.fish.inc'
  and source '/Users/gergosulymosi/Downloads/google-cloud-sdk/path.fish.inc'
