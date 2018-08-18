#!/bin/bash

function setColorVariable {
    local -r red="${2:0:2}"
    local -r green="${2:2:2}"
    local -r blue="${2:4:2}"
    
    readonly $1="#$red$red$green$green$blue$blue"
}

function setStringKey {
    local -r KEY_ROOT="/apps/gnome-terminal/profiles"
    local -r PROFILE="Default"
    local -r KEY="$KEY_ROOT/$PROFILE/$1"
    local -r VALUE=$2
    
    gconftool-2 --set "$KEY" --type string "$VALUE"
}

setColorVariable TEXT_COLOR "9BA2B1"
setColorVariable BACKGROUND_COLOR "1F2127"
setColorVariable BOLD_COLOR "FFFFFF"

setStringKey "background_color" "$BACKGROUND_COLOR"
setStringKey "foreground_color" "$TEXT_COLOR"
setStringKey "bold_color" "$BOLD_COLOR"

setColorVariable BLACK "000000"
setColorVariable RED "D93D2B"
setColorVariable GREEN "40C82B"
setColorVariable YELLOW "B1B12A"
setColorVariable BLUE "642CFE"
setColorVariable MAGENTA "E732E5"
setColorVariable CYAN "3EC0CD"
setColorVariable LIGHT_GRAY "CBCBCB"
setColorVariable DARK_GRAY "000000"
setColorVariable LIGHT_RED "D93D2B"
setColorVariable LIGHT_GREEN "40C82B"
setColorVariable LIGHT_YELLOW "B1B12A"
setColorVariable LIGHT_BLUE "642CFE"
setColorVariable LIGHT_MAGENTA "E732E5"
setColorVariable LIGHT_CYAN "3EC0CD"
setColorVariable WHITE "CBCBCB"

readonly PALETTE="$BLACK:$RED:$GREEN:$YELLOW:$BLUE:$MAGENTA:$CYAN:$LIGHT_GRAY"
readonly LIGHT_PALETTE="$DARK_GRAY:$LIGHT_RED:$LIGHT_GREEN:$LIGHT_YELLOW:$LIGHT_BLUE:$LIGHT_MAGENTA:$LIGHT_CYAN:$WHITE"

setStringKey "palette" "$PALETTE:$LIGHT_PALETTE"
