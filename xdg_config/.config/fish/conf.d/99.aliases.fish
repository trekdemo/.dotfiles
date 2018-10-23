# Quick edits
function ef; nvim ~/.config/fish/conf.d; end
function ev; nvim ~/.config/nvim/init.vim; end
function eg; nvim ~/.gitconfig; end
function et; nvim ~/.tmux.conf; end
function es; nvim ~/.ssh/config; end
function eh; sudo $EDITOR /etc/hosts; end

# Shortcuts
alias g='git'
alias b='bundle'
alias dc='docker-compose'
alias dm='docker-machine'
alias o='open'
alias v='nvim'
alias vim='nvim'
alias :q='exit'

# Directories
balias .. 'cd ..'
balias ... 'cd ../..'
balias .... 'cd ../../..'

# Bundle
balias be 'bundle exec'
balias bi 'bundle install'
balias bl 'bundle list'
balias bp 'bundle package'
balias bu 'bundle update'
balias bo 'bundle open'
balias ts 'tig status'

balias l 'tree --dirsfirst -ChFL 1'
balias ll 'tree --dirsfirst -ChFupDaL 1'
balias md 'mkdir -p'

# Utilities
function currentwifi; networksetup -getairportnetwork en0; end
function week; date +%V; end

# Networking
function ip; dig +short myip.opendns.com @resolver1.opendns.com; end
function localip; ipconfig getifaddr en0; end

function gist
  set -l command (which gist)" --copy --open --shorten $argv"
  echo $command
  eval $command
end

