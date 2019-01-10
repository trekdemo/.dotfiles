# ENV variables
set -gx LANG en_US.utf-8
set -gx LC_ALL en_US.utf-8

set -gx PATH "/usr/local/bin" $PATH
test -d "$HOME/.cargo/bin"; and set -gx PATH "$HOME/.cargo/bin" $PATH
test -d "$HOME/bin"; and set -gx PATH "$HOME/bin" $PATH
test -d "$HOME/.local/bin"; and set -gx PATH "$HOME/.local/bin" $PATH
set -gx PATH ".git/safe/../../bin" $PATH
set -gx PATH ".git/safe/../../node_modules/.bin/" $PATH

set -gx FZF_DEFAULT_COMMAND 'ag --hidden -g ""'
set -gx FZF_DEFAULT_OPTS "--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

test -q open; and set BROWSER open
set -gx EDITOR nvim
set -gx RUBYOPT rubygems
set -gx NODE_PATH "/usr/local/lib/node_modules"
test -d ~/projects; and set -gx CDPATH ./ ~/projects $CDPATH

test -f ~/.local/env_vars.fish; and source ~/.local/env_vars.fish

eval (ssh-agent -c | grep -v echo)
type -q rbenv; and eval (rbenv init -)
