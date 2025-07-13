#!/bin/zsh

# https://github.com/junegunn/fzf?tab=readme-ov-file#fuzzy-completion-for-bash-and-zsh
source <(fzf --zsh)

# Add FZF completion for brew commands
# Type brew <command> **<Tab>
_fzf_complete_brew() {
  _fzf_complete --multi --reverse --prompt="brew packages> " -- "$@" < <(brew list)
}

# Switch to a prject directory
pj() {
  local projects_dir=~/projects
  local selected
  selected=$(find "$projects_dir" -mindepth 1 -maxdepth 1 -type d | sed "s|$projects_dir/||" | fzf) || return
  cd "$projects_dir/$selected"
}
