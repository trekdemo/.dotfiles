# #fisher config
set -g fisher_path $HOME/.config/fish/fisher-pkg

# Install fisher automatically
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

for file in $fisher_path/conf.d/*.fish
  builtin source $file 2> /dev/null
end

# ENV variables
type -q open; and set -gx BROWSER open

if test -z "$NVIM_LISTEN_ADDRESS"
  set -gx VISUAL nvim
else
  set -gx VISUAL "nvr -cc split --remote-wait +'setlocal bufhidden=wipe'"
end
set -gx EDITOR $VISUAL

set -gx TZ '/usr/share/zoneinfo/Europe/Amsterdam'
set -gx LANG en_US.utf-8
set -gx LC_ALL en_US.utf-8

# PATH
test -d "$HOME/bin";        and set -gx PATH "$HOME/bin" $PATH
test -d "$HOME/.local/bin"; and set -gx PATH "$HOME/.local/bin" $PATH
test -d "$HOME/.cargo/bin"; and set -gx PATH "$HOME/.cargo/bin" $PATH
test -d "$HOME/go/bin";     and set -gx PATH "$HOME/go/bin" $PATH
test -d "$HOME/Library/Python/3.7/bin"; and set -gx PATH "$HOME/Library/Python/3.7/bin" $PATH

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

# Setup prompt
# https://starship.rs/config/
eval (starship init fish)
