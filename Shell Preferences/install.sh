#!/bin/bash

# Location of helper shell files
RC_FILE="$HOME/.bashrc"
PROFILE_FILE="$HOME/.profile"
VRAI_SHELL_DIR="$HOME/.config/vraishell"

function backup_if_exists {
    if [ -e "$PROFILE_FILE" ] || [ -e "$RC_FILE" ] || [ -e "$VRAI_SHELL_DIR" ]; then
        local CONTINUE
        read -r -p "Shell preferences already setup, type 'Y' to backup existing files and continue: " CONTINUE
        case "$CONTINUE" in
            Y) ;;
            *) exit 0;;
        esac
        
        local EPOCH=$(date +%s)
        echo "Backups will be suffixed with '$EPOCH'"
        
        if [ -e "$RC_FILE" ]; then
            echo "Backing up $RC_FILE"
            mv "$RC_FILE" "${RC_FILE}_$EPOCH"
        fi
        
        if [ -e "$PROFILE_FILE" ]; then
            echo "Backing up $PROFILE_FILE"
            mv "$PROFILE_FILE" "${PROFILE_FILE}_$EPOCH"
        fi
        
        if [ -e "$VRAI_SHELL_DIR" ]; then
            echo "Backing up $VRAI_SHELL_DIR"
            mv "$VRAI_SHELL_DIR" "${VRAI_SHELL_DIR}_$EPOCH"
        fi
    fi
}

backup_if_exists

echo "Creating config dir"
mkdir $VRAI_SHELL_DIR

SHELL_FILES='aliases.sh env-var-list.sh env-variables.sh prompt.sh'
for SHELL_FILE in $SHELL_FILES; do
    echo "Installing $SHELL_FILE in config dir"
    cp $SHELL_FILE "$VRAI_SHELL_DIR/"
done

echo "Installing .bashrc in home dir"
cp "./bashrc.sh" "$HOME/.bashrc"

echo "Installing .profile in home dir"
cp "./profile.sh" "$HOME/.profile"
