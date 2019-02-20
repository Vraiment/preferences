# -----------------------------------------------------------------------------#
# Author: Vraiment                                                             #
#                                                                              #
# Template for a "$HOME/.bashrc" file, to install:                             #
#     1. Backup any existing "$HOME/.bashrc"                                   #
#     2. Copy all files under the "Shell Preferences" folder to                #
#        "$HOME/.config/vraishell"                                             #
#     3. Create an alias from "$HOME/.bashrc" that points to                   #
#        "$HOME/.config/bashrc.sh"                                             #
# -----------------------------------------------------------------------------#

# Location of helper shell files
VRAI_SHELL_DIR="$HOME/.config/vraishell"

# commands to manipulate the path
source "$VRAI_SHELL_DIR/env-var-list.sh"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Common environment variables
source "$VRAI_SHELL_DIR/aliases.sh"

# Custom prompt
source "$VRAI_SHELL_DIR/prompt.sh"

unset VRAI_SHELL_DIR
