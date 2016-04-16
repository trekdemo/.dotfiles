# ENV variables
# prepend_to_path "/usr/local/bin"
# prepend_to_path "/usr/local/share/npm/bin"
# prepend_to_path "/usr/local/sbin"
# prepend_to_path "$HOME/.rbenv/shims"
# prepend_to_path "$HOME/bin"
  # TODO find out why
  # prepend_to_path ".git/safe/../../bin"
set -gx PATH "/usr/local/bin" $PATH
set -gx PATH "/usr/local/share/npm/bin" $PATH
set -gx PATH "/usr/local/sbin" $PATH
set -gx PATH "$HOME/.tmuxifier/bin" $PATH
set -gx PATH "$HOME/google-cloud-sdk/bin" $PATH
set -gx PATH "$HOME/.rbenv/shims" $PATH
set -gx PATH "$HOME/bin" $PATH
set -gx PATH ".git/safe/../../bin" $PATH

set BROWSER open
set -gx fish_greeting ''
set -gx EDITOR vim
# set -gx COMMAND_MODE unix2003
set -gx RUBYOPT rubygems
set -gx NODE_PATH "/usr/local/lib/node_modules"
set -gx VIM_BINARY "/usr/bin/vim"
set -gx MVIM_BINARY "/usr/local/bin/mvim"
set -gx CDPATH ./ ~/dev $CDPATH
# set -gx JAVA_HOME (/usr/libexec/java_home)

# Setup boot2docker
docker-machine env | source

# Tmuxifier
set -gx TMUXIFIER_LAYOUT_PATH "$HOME/.dotfiles/tmuxifier_layouts"
# tmuxifier init - | source

# Aliases
test -s ~/.config/fish/aliases.fish; and source ~/.config/fish/aliases.fish
make_completion g "git"
make_completion b "bundle"
make_completion dc "docker-compose"

# Rubby
test -s /usr/local/bin/rbenv; and /usr/local/bin/rbenv rehash 2>/dev/null

# virtual env wrappers for Python
eval (python -m virtualfish)

set -gx CW_LOGIN "g_sulymosi"
set -gx CW_NAME  "g_sulymosi"
set -gx CW_EMAIL "g.sulymosi@catawiki.nl"
