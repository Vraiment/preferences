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

# Common environment variables
source "$VRAI_SHELL_DIR/env-variables.sh"

# commands to manipulate the path
source "$VRAI_SHELL_DIR/env-var-list.sh"

# If running bash source the bashrc
if [ -n "$BASH_VERSION" ]; then
	source "$HOME/.bashrc"
fi

# Adds user's personal bin directory
if [ -d "$HOME/bin" ] ; then
    pathprepend "$HOME/bin"
fi

# Add users's personal local bin directory
if [ -d "$HOME/.local/bin" ] ; then
    pathprepend "$HOME/.local/bin"
fi
