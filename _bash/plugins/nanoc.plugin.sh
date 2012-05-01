function _nanoc() {
    local cur prev opts args
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    args="autocompile compile create_item create_layout create_site debug deploy
    help info prune update view watch"
    opts="-l --color -d --debug -C --no-color -V --verbose -v --version -w --warn"

    COMPREPLY=($(compgen -W "${args}" -- ${cur}))
}
complete -F _nanoc nanoc
