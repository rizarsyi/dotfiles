_fab_completion() {
    # Fab in the path?
    [[ ! -z `which fab` ]] || return 0

    # Fabfile in this folder?
    [[ -e fabfile.py ]] || return 0

    COMPREPLY=()

    local cur="${COMP_WORDS[COMP_CWORD]}"

    if [[ ${COMP_CWORD} -eq 1 ]]; then
        COMPREPLY=( $(compgen -W "$(fab --shortlist)" -- ${cur}) )
    fi
}

complete -F _fab_completion fab
