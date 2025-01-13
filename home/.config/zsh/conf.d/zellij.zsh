#!/bin/zsh

if command -v zellij 2>&1 >/dev/null; then
  # https://zellij.dev/documentation/controlling-zellij-through-cli#completions
  eval $(zellij setup --generate-completion zsh)
fi
