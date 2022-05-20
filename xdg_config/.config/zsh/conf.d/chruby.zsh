export RUBIES=($HOME/.rubies/)

if (( $+commands[brew] )); then
  source "$(brew --prefix chruby)/share/chruby/auto.sh"
  # The rest is lazy loaded from ../functions/chruby
fi
