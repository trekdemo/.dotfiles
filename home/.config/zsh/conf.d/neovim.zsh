#!/bin/sh

if [ -z "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL=nvim
else
  export VISUAL="nvr -cc split --remote-wait +'setlocal bufhidden=wipe'"
fi
export EDITOR="$VISUAL"
