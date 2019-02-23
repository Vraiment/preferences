# Enable colors in terminal
export CLICOLOR=1

# Enable rbenv
if command -v rbenv > /dev/null; then
    pathprepend "$HOME/.rbenv/shims"
    export RBENV_SHELL=bash
    command rbenv rehash

    rbenv() {
        local command
        command="$1"
        if [ "$#" -gt 0 ]; then
            shift
        fi

        case "$command" in
            rehash|shell) eval "$(rbenv "sh-$command" "$@")";;
            *) command rbenv "$command" "$@";;
        esac
    }
fi
