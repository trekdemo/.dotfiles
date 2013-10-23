# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# export ZSH_THEME="robbyrussell"
export ZSH_THEME="trekd"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx git ruby rails brew pow powder github)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all
unsetopt auto_name_dirs
setopt auto_cd                   # automatically enter directories without cd
cdpath=($HOME/dev)

export PATH=/usr/local/bin:$HOME/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=".git/safe/../../bin:$PATH"
export PATH="~/.cabal/bin:$PATH"
export FLEX_HOME=/usr/local/Cellar/flex_sdk/4.6.0.23201
export ANDROID_SDK=$HOME/Applications/eclipse/android-sdk-macosx/
export PATH=$FLEX_HOME/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH
export EDITOR=vim

# aliases
if [ -e "$HOME/.dotfiles/zsh/.aliases" ]; then
  source "$HOME/.dotfiles/zsh/.aliases"
fi

function psg() {
  ps auxww | grep --color=always $* | grep -v grep | collapse | cuts -f 2,11-
}

# Define Vim wrappers which unsets GEM_HOME and GEM_PATH before
# invoking vim and all known aliases
#
# @author Wael Nasreddine <wael.nasreddine@gmail.com>
function define_vim_wrappers() {
  vim_commands=(
    eview evim gview gvim gvimdiff gvimtutor rgv
    rgvim rview rvim vimdiff vimtutor xxd mvim vim
  )

  for cmd in ${vim_commands[@]}; do
    cmd_path=`/usr/bin/env which -a "${cmd}" 2>/dev/null | grep '^/'`
    if [ -x "${cmd_path}" ]; then
      eval "function ${cmd} () { (unset GEM_HOME; unset GEM_PATH; $cmd_path \$@) }"
    fi
  done
}
define_vim_wrappers

# Use vim style keybinding
bindkey -v

bindkey '^R' history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export LANG=en_US.UTF-8

# Tmuxifier
[[ -s "$HOME/.dotfiles/.tmuxifier/init.sh" ]] && source "$HOME/.dotfiles/.tmuxifier/init.sh"

