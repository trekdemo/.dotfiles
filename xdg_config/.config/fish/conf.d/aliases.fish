# Shortcuts
alias vim='nvim'
alias :q='exit'

if status --is-interactive
  abbr --add --global o open
  abbr --add --global mv mv -iv
  abbr --add --global cp cp -riv
  abbr --add --global mkdir mkdir -vp
  abbr --add --global cc circleci
  abbr --add --global t task
  abbr --add --global tsh tasksh
  # Ruby and friends
  abbr --add --global b bundle
  abbr --add --global be bundle exec
  abbr --add --global bu bundle update
  abbr --add --global berc bundle exec rails console
  # Docker, Kubernetes, ...
  abbr --add --global k kubectl
  abbr --add --global kx kubectx
  abbr --add --global kn kubens
  abbr --add --global d docker
  abbr --add --global dc docker-compose
  abbr --add --global ds docker-sync
  # Git and friends
  abbr --add --global g git
  abbr --add --global ts tig status
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
