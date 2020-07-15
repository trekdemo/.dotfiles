source "/usr/local/opt/chruby/share/chruby/chruby.sh"
source "/usr/local/opt/chruby/share/chruby/auto.sh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
