# Adds lists the entries in the variable with the name of the first argument
# ex: lsevar PATH
function lsevar {
    if [[ $# -ne 1 || -z ${!1+x} ]]; then
        return $(false)
    fi
    
    tr ':' "\n" <<< ${!1}
}

# Verifies if the second argument is in the variable with the name of the first argument
# ex: grepevar PATH /bin
function grepevar {
    if [ $# -ne 2 ]; then
        return $(false)
    fi
    
    lsevar $1 | grep "^$2$"
}

# Adds a new entry in the environment variable at the beginning of the variable
# ex: evarprepend PATH $HOME/bin
function evarprepend {
    if [ $# -ne 2 ]; then
        return $(false)
    fi
    
    if [ -z ${!1} ]; then
        eval "$1=\$2"
    else
        eval "$1=\$2:\${!1}"
    fi
}

# Adds a new entry in the environment variable at the beginning of the variable
# ex: evarappend PATH $HOME/bin
function evarappend {
    if [ $# -ne 2 ]; then
        return $(false)
    fi
    
    if [ -z ${!1} ]; then
        eval "$1=\$2"
    else
        eval "$1=\${!1}:\$2"
    fi
}

# PATH related commands
alias lspath='lsevar PATH'
alias greppath='grepevar PATH'

# Adds the first argument to the front of PATH if is not present
# ex: pathprepend $HOME/bin
function pathprepend {
    if [[ $# -ne 1 || $(greppath $1) ]]; then
        return $(false)
    fi
    
    evarprepend PATH $1
}

# Adds the first argument to the back of PATH if is not present
# ex: pathappend /usr/local/bin
function pathappend {
    if [[ $# -ne 1 || $(greppath $1) ]]; then
        return $(false)
    fi
    
    evarappend PATH $1
}