#!/bin/sh

# export NNN_OPTS="de"
alias ls="nnn -de"
export NNN_PLUG="g:gitroot;c:fzcd;p:preview-tui"
export NNN_FIFO=/tmp/nnn.fifo nnn
