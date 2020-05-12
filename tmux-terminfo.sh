#!/bin/bash

# See if tmux is already defined.
infocmp tmux > /dev/null
if [ $? -eq 0 ]; then
    # Nothing to do.
    exit 0
fi

# Define the tmux terminal type
# https://github.com/tmux/tmux/blob/2.1/FAQ#L355-L383
cat <<EOF|tic -x -
tmux|tmux terminal multiplexer,
	ritm=\E[23m, rmso=\E[27m, sitm=\E[3m, smso=\E[7m, Ms@,
	use=xterm+tmux, use=screen,

tmux-256color|tmux with 256 colors,
	use=xterm+256setaf, use=tmux,
EOF
