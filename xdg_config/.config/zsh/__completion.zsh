# Basic auto/tab complete:
fpath=("$HOME/.config/zsh/completions" $fpath)

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

autoload -U +X bashcompinit
bashcompinit

_comp_options+=(globdots)		# Include hidden files.
