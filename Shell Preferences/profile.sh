# -----------------------------------------------------------------------------#
# Author: Vraiment                                                             #
#                                                                              #
# Template for a "$HOME/.profile" file, to install:                            #
#     1. Backup any existing "$HOME/.profile"                                  #
#     2. Copy all files under the "Shell Preferences" folder to                #
#        "$HOME/.config/vraishell"                                             #
#     3. Create an alias from "$HOME/.profile" that points to                  #
#        "$HOME/.config/profile.sh"                                            #
# -----------------------------------------------------------------------------#

# Location of helper shell files
VRAI_SHELL_DIR="$HOME/.config/vraishell"

# commands to manipulate the path
source "$VRAI_SHELL_DIR/env-var-list.sh"

# Common environment variables
source "$VRAI_SHELL_DIR/env-variables.sh"

# If running bash source the bashrc
if [ -n "$BASH_VERSION" ]; then
	source "$HOME/.bashrc"
fi

# Configure "rbenv", for version 1.1.2
if [ -f "/usr/local/bin/rbenv" ]; then
    export PATH="$HOME/.rbenv/shims:${PATH}"
    export RBENV_SHELL=bash

    command rbenv rehash 2>/dev/null

    rbenv() {
        local command
        command="${1:-}"
        if [ "$#" -gt 0 ]; then
            shift
        fi

        case "$command" in
        rehash|shell)
            eval "$(rbenv "sh-$command" "$@")";;
        *)
            command rbenv "$command" "$@";;
        esac
    }
fi

# Adds user's personal bin directory
if [ -d "$HOME/bin" ] ; then
    pathprepend "$HOME/bin"
fi

# Add users's personal local bin directory
if [ -d "$HOME/.local/bin" ] ; then
    pathprepend "$HOME/.local/bin"
fi

unset VRAI_SHELL_DIR
