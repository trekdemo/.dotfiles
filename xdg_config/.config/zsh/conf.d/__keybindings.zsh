autoload -Uz edit-command-line

bindkey -e

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char # C-?
bindkey '^h' backward-delete-char # C-h
bindkey '^w' backward-kill-word # C-w
bindkey '^[^?' backward-kill-word # Alt-Backspace

# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward

bindkey '^a' beginning-of-line # C-a
bindkey '^e' end-of-line # C-e
bindkey '^[[H' beginning-of-line # Home
bindkey '^[[F' end-of-line # End

# Word-wise movements
bindkey '^[[1;3C' .forward-word # Alt-Right
bindkey '^[[1;3D' .backward-word # Alt-Left


# Create a ZSH widget that can be bound to a key
# https://unix.stackexchange.com/questions/289883/binding-key-shortcuts-to-shell-functions-in-zsh

# Open In Neovim
open-vim-here() { nvim "+Telescop find_files" }
zle -N open-vim-here
bindkey '^[v' open-vim-here


# Jump to a project folder
jump-to-folder() {
  local dir="cd $(ls -rdt ~/{projects,src}/* | fzf --layout=reverse)"

  ${=dir}
  zle reset-prompt
}
zle -N jump-to-folder
bindkey '^[j' jump-to-folder
