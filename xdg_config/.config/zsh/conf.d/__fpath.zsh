fpath=("$HOME/.config/zsh/functions" "${fpath[@]}")

for func in $(ls "$HOME/.config/zsh/functions"); do
  autoload -Uz "$func"
done
