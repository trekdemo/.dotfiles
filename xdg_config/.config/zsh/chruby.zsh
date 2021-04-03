if ! (( $+commands[brew] )); then
  return
fi

export RUBIES=($HOME/.rubies/)
source "$(brew --prefix chruby)/share/chruby/chruby.sh"
source "$(brew --prefix chruby)/share/chruby/auto.sh"

_ruby-build() { compadd $(ruby-build --definitions) }
compdef _ruby-build ruby-build

# complete on installed rubies
_chruby() {
  compadd $(chruby | tr -d '* ')
  local default_path='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
  if PATH=${default_path} type ruby &> /dev/null; then
      compadd system
  fi
}
compdef _chruby chruby
