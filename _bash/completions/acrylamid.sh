function _acrylamid() {
    local cur prev opts args
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    args="autocompile check compile deploy import info init new ping view"
    opts="-h --help -C --no-color -q --quiet -v --verbose --version"

    COMPREPLY=($(compgen -W "${args}" -- ${cur}))
}
complete -F _acrylamid acrylamid
