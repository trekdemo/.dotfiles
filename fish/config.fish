# ENV variables
prepend_to_path "/usr/local/share/npm/bin"
prepend_to_path "/usr/local/bin"
prepend_to_path "/usr/local/sbin"
prepend_to_path "$HOME/.rbenv/shims"
prepend_to_path "$HOME/bin"
prepend_to_path ".git/safe/../../bin"

set BROWSER open
set -gx fish_greeting ''
set -gx EDITOR vim
set -gx COMMAND_MODE unix2003
set -gx RUBYOPT rubygems
set -gx NODE_PATH "/usr/local/lib/node_modules"
set -gx VIM_BINARY "/usr/bin/vim"
set -gx MVIM_BINARY "/usr/local/bin/mvim"
set -gx CDPATH ~/dev $CDPATH
set -gx DOCKER_HOST 'tcp://localhost:4243'

# Tmuxifier
set -gx TMUXIFIER_LAYOUT_PATH "$HOME/.dotfiles/tmuxifier_layouts"
eval (tmuxifier init -)

# Aliases
test -s ~/.config/fish/aliases.fish; and source ~/.config/fish/aliases.fish
make_completion g "git"
make_completion b "bundle"


# Rubby
test -s /usr/local/bin/rbenv; and /usr/local/bin/rbenv rehash 2>/dev/null

