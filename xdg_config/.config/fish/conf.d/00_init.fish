# ENV variables
# prepend_to_path "/usr/local/bin"
# prepend_to_path "/usr/local/share/npm/bin"
# prepend_to_path "/usr/local/sbin"
# prepend_to_path "$HOME/.rbenv/shims"
# prepend_to_path "$HOME/bin"
  # TODO find out why
  # prepend_to_path ".git/safe/../../bin"
set -gx PATH "/usr/local/bin" $PATH
set -gx PATH "$HOME/bin" $PATH
set -gx PATH ".git/safe/../../bin" $PATH
set -gx PATH "$HOME/.cargo/bin" $PATH
set -gx PATH "$GOROOT/bin" $PATH
set -gx PATH "$GOPATH/bin" $PATH
set -gx PATH "$HOME/.rbenv/bin" $PATH
set -gx GOPATH "$HOME/projects/go"
set -gx GOROOT "/usr/local/opt/go/libexec"
# set -gx TERM "xterm-256color"
set -gx LANG en_US.utf-8
set -gx LC_ALL en_US.utf-8

set BROWSER open
set -gx fish_greeting ''
set -gx EDITOR vim
set -gx RUBYOPT rubygems
set -gx NODE_PATH "/usr/local/lib/node_modules"
set -gx MVIM_BINARY "/usr/local/bin/mvim"
set -gx CDPATH ./ ~/projects $CDPATH

# virtual env wrappers for Python
# eval (python -m virtualfish)

# BEGIN ANSIBLE MANAGED BLOCK
test -e ~/.cw/env.sh; and source ~/.cw/env.sh
# END ANSIBLE MANAGED BLOCK
if status --is-interactive; and type -q rbenv
  source (rbenv init -| psub)
end
