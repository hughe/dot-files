# -*- mode: shell-script; -*-

PS1='\h:\W \u\$ '

# Make bash check its window size after a process completes
shopt -s checkwinsize

alias pd=pushd
alias pp=popd
alias ll="ls -l"

alias ec="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"
alias cdsr="cd $HOME/Development/storreduce/src/code.storreduce.com/"

alias gofuse="ssh -A fuse"


if [ "$TERM" == "screen" -a -n "$TMUX" ]; then
    # We are running in TMUX
    which tic >/dev/null  # Do we have ther terminfo stuff.
    if [ $? -eq 0 ]; then
	~/.hugh_profile.d/tmux-terminfo.sh
	export TERM=tmux
    fi
fi

if [ "$TERM" == "xterm-256color" -o "$TERM" == "tmux" -o "$TERM" == "tmux-256color" ]; then
    export LANG=en_US.utf8
fi

# Env variables for interactive use.  Dont use these in scripts.
export PURITY=$HOME/Development/purity
export OPO=$PURITY/go/src/purity.purestorage.com
export PURGO=$PURITY/go

export SR=$HOME/Development/storreduce/src/code.storreduce.com/

# END OF FILE - anything after this is probably added by some script or package.

[[ -s "/home/hemberson/.gvm/scripts/gvm" ]] && source "/home/hemberson/.gvm/scripts/gvm"
