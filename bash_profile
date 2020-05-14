# -*- mode: shell-script; -*-
# Add /usr/local/sbin to path, Brew puts some stuff in there
export PATH=$PATH:/usr/local/sbin

# Add my bin directory to path
export PATH=$PATH:$HOME/bin

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -z "${PKG_CONFIG_PATH}" ]; then 
    export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/opt/openssl/lib/pkgconfig
else
    export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig
fi

export PATH=$PATH:$HOME/Development/phtest/phtest

#source $HOME/.hugh_profile.d/configure-gvm.sh

# Probably don't need this anymore
#source $HOME/.hugh_profile.d/configure-nvm.sh

# On OS/X terminals usually open a login shell for each terminal
# window or tab.
#
# The rule for sourcing the dot files in bash is:
#
# * if the shell is a login shell then .bash_profile is loaded,
#
# * if the shell is interactive and not a login shell then .bashrc is
#   loaded.
#
# So if the shell is interactive and is a login shell (which it is for
# terminal windows in OS/X) then .bashrc will not be loaded.  So we do
# it here.  This means we need to load .bashrc manually from here,
# because bash won't do it.
#
if [[ $- == *i* ]]; then
    # This is an iteractive shell
    if shopt -q login_shell; then
	# This is a login shell

	source $HOME/.bashrc
    fi
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

if [ -z "$SSH_AUTH_SOCK" ]; then
    eval $(ssh-agent) > /dev/null
fi

# END OF FILE - anything after this is probably added by some script or package.
