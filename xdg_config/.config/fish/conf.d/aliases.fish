# Shortcuts
alias vim='nvim'
alias :q='exit'

alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir="mkdir -vp"

if status --is-interactive
  abbr --add --global b bundle
  abbr --add --global be bundle exec
  abbr --add --global bu bundle update
  abbr --add --global cc circleci
  abbr --add --global berc bundle exec rails console
  abbr --add --global o open
  abbr --add --global ts tig status
  abbr --add --global k kubectl
  abbr --add --global kp prod-kubectl
  abbr --add --global kd dev-kubectl
  abbr --add --global d docker
  abbr --add --global dc docker-compose
  abbr --add --global ds docker-sync
  abbr --add --global g git
  abbr --add --global gup 'git fetch --all --prune; git pull --rebase'
  abbr --add --global gfp 'git push --force-with-lease'

  # Quick edits
  abbr --add --global ea edit ~/.config/fish/conf.d/aliases.fish
  abbr --add --global ef edit ~/.config/fish/config.fish
  abbr --add --global ev edit ~/.config/nvim/init.vim
  abbr --add --global eg edit ~/.gitconfig
  abbr --add --global et edit ~/.tmux.conf
  abbr --add --global es edit ~/.ssh/config
  abbr --add --global eh sudo $VISUAL /etc/hosts
end
