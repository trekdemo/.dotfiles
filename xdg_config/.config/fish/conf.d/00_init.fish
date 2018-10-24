# ENV variables
set -gx PATH "/usr/local/bin" $PATH
test -d "$HOME/bin"; and set -gx PATH "$HOME/bin" $PATH
test -d "$HOME/.cargo"; and set -gx PATH "$HOME/.cargo/bin" $PATH
test -d "$HOME/.rbenv"; and set -gx PATH "$HOME/.rbenv/bin" $PATH
set -gx PATH ".git/safe/../../bin" $PATH
set -gx LANG en_US.utf-8
set -gx LC_ALL en_US.utf-8
set -gx FZF_DEFAULT_COMMAND 'ag --hidden -g ""'

test -q open; and set BROWSER open
set -gx fish_greeting ''
set -gx EDITOR nvim
set -gx RUBYOPT rubygems
set -gx NODE_PATH "/usr/local/lib/node_modules"
set -gx MVIM_BINARY "/usr/local/bin/mvim"
set -gx CDPATH ./ ~/projects $CDPATH

# virtual env wrappers for Python
# eval (python -m virtualfish)
if type -q rbenv
  status --is-interactive; and source (rbenv init -|psub)
end

# BEGIN ANSIBLE MANAGED BLOCK
test -e ~/.cw/env.sh; and source ~/.cw/env.sh
# END ANSIBLE MANAGED BLOCK
