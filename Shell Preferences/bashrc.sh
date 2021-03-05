# -----------------------------------------------------------------------------#
# Author: Vraiment                                                             #
#                                                                              #
# Template for a "$HOME/.bashrc" file, to install:                             #
#     1. Backup any existing "$HOME/.bashrc"                                   #
#     2. Copy all files under the "Shell Preferences" folder to                #
#        "$HOME/.local/etc/vraishell"                                          #
#     3. Create an alias from "$HOME/.bashrc" that points to                   #
#        "$HOME/.local/etc/vraishell/bashrc.sh"                                #
# -----------------------------------------------------------------------------#

# Location of helper shell files
if [ -z "$VRAI_SHELL_DIR" ]; then
    VRAI_SHELL_DIR="$HOME/.local/etc/vraishell"
else
    CLEAR_VRAI_SHELL_DIR=true
fi

# commands to manipulate the path
source "$VRAI_SHELL_DIR/functions/env-variables.sh"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Common environment variables
for ALIAS_FILE in "${VRAI_SHELL_DIR}/aliases/"*.sh; do
    source "${ALIAS_FILE}"
done

# Custom prompt
source "$VRAI_SHELL_DIR/functions/prompt.sh"

if [ "$CLEAR_VRAI_SHELL_DIR" = true ]; then
    unset VRAI_SHELL_DIR
fi
