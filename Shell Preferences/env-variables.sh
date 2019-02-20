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
        CLICOLOR=1
        ;;
esac
