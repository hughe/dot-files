#
# This script is desgined to be sourced from either .bashrc or
# .bash_profile.  It configures NVM to run in this shell.
#
# Note that the rules for sourcing .bashrc and .bash_profile are:
#
# * If the shell is a login shell then source .bash_profile.
#
# * If the shell is an interactive non-login shell the source .bashrc.
#
# On OS/X then anytime you start a Terminal or iTerm2 it seems to be a
# login shell, which means that .bashrc is not sourced, even though it
# is interactive.
#
# On Linux, if you ssh into an a machine that will be a login shell.
# If you launch a Xterm or gnome-terminal then that will most likely
# just be an interactive shell.

# Prevent this being executing twice
if [ -z "${HUGH_CONFIGURE_NVM_SOURCED}" ]; then

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


    export HUGH_CONFIGURE_NVM_SOURCED=Y
fi 

# Load the bash_completion stuff only if this is an interactive shell.
if [[ $- == *i* ]]; then
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

