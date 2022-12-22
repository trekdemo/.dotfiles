#!/bin/sh

alias n="nnn"
alias nn="nnn"

# -d detail mode
# -e text in $VISUAL/$EDITOR/vi
# -o open files only on Enter
# -U show user and group
export NNN_OPTS="deoU"
export NNN_PLUG="g:gitroot;c:fzcd;p:preview-tui"
export NNN_FIFO=/tmp/nnn.fifo nnn
export NNN_OPENER=~/.config/nnn/plugins/nuke
