# completion
function _nvm() {
    COMPREPLY=()
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [[ ${COMP_CWORD} -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "help install uninstall use ls deactivate sync alias copy-packages" -- "${cur}") )
    fi
}

complete -F _nvm nvm
