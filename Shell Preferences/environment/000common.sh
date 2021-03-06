# -----------------------------------------------------------------------------#
# Author: Vraiment                                                             #
#                                                                              #
# Handy aliases for commands                                                   #
# -----------------------------------------------------------------------------#

# Forces things like git to use vim if vim is available
if type vim &> /dev/null; then
    export EDITOR=vim
fi

# Variables per operating system
case "$(uname -s)" in
    Darwin*)
        # Makes so "ls" output is colored
        export CLICOLOR=1
        export BASH_SILENCE_DEPRECATION_WARNING=1
        ;;
esac

# WSL specific environment variables
if uname -a | grep -i microsoft > /dev/null; then
    evarappend WIN_PATH "/mnt/c/Windows/System32"
    evarappend WIN_PATH "/mnt/c/Windows"
    export WIN_PATH
fi

# Set the colors for LS
export LS_COLORS="di=34:ln=35:so=31:pi=36:ex=32:bd=30;46:cd=30;46:su=32:sg=32:tw=34;46:ow=34"
