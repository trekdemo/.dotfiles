#!/bin/zsh

# https://github.com/junegunn/fzf?tab=readme-ov-file#fuzzy-completion-for-bash-and-zsh
source <(fzf --zsh)

# Add FZF completion for brew commands
# Type brew <command> **<Tab>
_fzf_complete_brew() {
  _fzf_complete --multi --reverse --prompt="brew packages> " -- "$@" < <(brew list)
}
