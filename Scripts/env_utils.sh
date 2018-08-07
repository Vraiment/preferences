# List the entries in the $PATH variable
function lspath {
    tr ':' "\n" <<< $PATH
}

# Searchs for the first argument in the $PATH variable
function in_path {
    lspath | grep "^$1$"
}

# Adds the first argument in front of the path variable
function add_to_path_front {
    if [ $(in_path $1) ]; then
        return 1
    fi
    
    export PATH="$1:$PATH"
}

# Adds the first argument in the back of the path variable
function add_to_path_back {
    if [ $(in_path $1) ]; then
        return 1
    fi
    
    export PATH="$PATH:$1"
}