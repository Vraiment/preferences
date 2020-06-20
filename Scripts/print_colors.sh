#!/bin/bash

export BLACK='\033[0;30m'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export MAGENTA='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT_GRAY='\033[0;37m'
export DARK_GRAY='\033[1;30m'
export LIGHT_RED='\033[1;31m'
export LIGHT_GREEN='\033[1;32m'
export LIGHT_YELLOW='\033[1;33m'
export LIGHT_BLUE='\033[1;34m'
export LIGHT_MAGENTA='\033[1;35m'
export LIGHT_CYAN='\033[1;36m'
export WHITE='\033[1;37m'
export NO_COLOR='\033[0m'

function printColor() {
    local COLOR=$1

    printf "${!COLOR}%s${NO_COLOR}\n" "$COLOR"
}

printColor BLACK
printColor RED
printColor GREEN
printColor YELLOW
printColor BLUE
printColor MAGENTA
printColor CYAN
printColor LIGHT_GRAY
printColor DARK_GRAY
printColor LIGHT_RED
printColor LIGHT_GREEN
printColor LIGHT_YELLOW
printColor LIGHT_BLUE
printColor LIGHT_MAGENTA
printColor LIGHT_CYAN
printColor WHITE
