#
# This script is desgined to be sourced from either .bashrc or
# .bash_profile.  It configures GVM to run in this shell.
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
if [ -z "${HUGH_CONFIGURE_GVM_SOURCED}" ]; then

    # Load gvm into the environment

    [[ -s "/Users/hemberson/.gvm/scripts/gvm" ]] && source "/Users/hemberson/.gvm/scripts/gvm"

    if [ -z "${HUGH_GVM_DEFAULT_GO}" ]; then 
	HUGH_GVM_DEFAULT_GO=go1.14
    fi

    if [ -z "${HUGH_GVM_DEFAULT_PKG}" ]; then 
	HUGH_GVM_DEFAULT_PKG=cascade
    fi


    # Configure the paths
    #
    if [ -z "${HUGH_GVM_DISPLAY_VERSIONS}" ]; then 
	# Note it is important to redirect stdout to /dev/null when
	# sourcing this from .bash_profile or .bashrc.  If we don't
	# tools like ssh to break.
	gvm use "${HUGH_GVM_DEFAULT_GO}" > /dev/null
	gvm pkgset use "${HUGH_GVM_DEFAULT_PKG}" > /dev/null
    else
	# Otherwise if we are sourcing this from an interactive
	# script, we might want to see this info.
	gvm use "${HUGH_GVM_DEFAULT_GO}"
	gvm pkgset use "${HUGH_GVM_DEFAULT_PKG}"
    fi

    export HUGH_CONFIGURE_GVM_SOURCED=Y
fi 
