_scrapy_completion() {
    local cmd cur commands spiders
    cmd=${COMP_WORDS[1]}
    cur=${COMP_WORDS[2]}
    case "$cmd" in
        crawl|edit|check)
            spiders=$(scrapy list 2>/dev/null) || spiders=""
            COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$spiders" -- "$cur"))
        ;;
        *)
            if [ $COMP_CWORD -eq 1 ]; then
                commands="check crawl deploy edit fetch genspider list parse runspider server settings shell startproject version view"
                COMPREPLY=(${COMPREPLY[@]:-} $(compgen -W "$commands" -- "$cmd"))
            fi
        ;;
    esac
}
complete -F _scrapy_completion -o default scrapy
