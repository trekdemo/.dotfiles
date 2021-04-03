alias vim="$VISUAL"
alias :q='exit'
alias tilt="$(brew --prefix)/bin/tilt"

alias o="open"
alias ls=lsd
alias ll='ls -l'      #long list
alias la='ls -laFh'   #long list,show all,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir="mkdir -vp"
alias grep='grep --color'

alias cc="circleci"
alias t="task"
alias tsh="tasksh"
# Ruby and friends
alias b="bundle"
alias be="bundle exec"
alias bu="bundle update"
alias berc="bundle exec rails console"
# Docker, Kubernetes, ...
alias k="kubectl"
alias kx="kubectx"
alias kn="kubens"
alias d="docker"
alias dc="docker-compose"
alias ds="docker-sync"
# Git and friends
alias g="git"
alias ts="tig status"
alias gup="'git fetch --all --prune; git pull --rebase'"
alias gfp="'git push --force-with-lease'"

# Quick edits
alias ea="edit ~/.config/fish/conf.d/aliases.fish"
alias ef="edit ~/.config/fish/config.fish"
alias ev="edit ~/.config/nvim/init.vim"
alias eg="edit ~/.gitconfig"
alias et="edit ~/.tmux.conf"
alias es="edit ~/.ssh/config"
alias eh="sudo $VISUAL /etc/hosts"


alias localip="ipconfig getifaddr en0"
alias week="date +%V"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias lost_commits="git fsck --full --no-reflogs --unreachable --lost-found | grep commit | cut -d\  -f3 | xargs -n 1 git log -n 1 --pretty=oneline | fzf --reverse --no-sort --preview 'git show -p (echo {} | grep -o \'[a-f0-9]\\{7\\}\' | head -1) | diff-highlight'"
