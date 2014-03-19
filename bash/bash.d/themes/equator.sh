#!/usr/bin/env bash

# ANSI code
RESET_ATTR="[0m"    # Reset
TXT_BOLD="[1m"      # Bold
CLR_BLACK="[30m"    # Black
CLR_RED="[31m"      # Red
CLR_GREEN="[32m"    # Green
CLR_YELLOW="[33m"   # Yellow
CLR_BLUE="[34m"     # Blue
CLR_MAGENTA="[35m"  # Magenta
CLR_CYAN="[36m"     # Cyan
CLR_WHITE="[37m"    # White

# VCS prompt color
function __equator.vcprompt() {
    if [[ ! -z `which vcprompt` ]]; then
        `which vcprompt` -f $'\e[37m(\e[35m%n\e[37m:\e[33m%b\e[32m%m%u\e[37m)'
    fi
}

EQ_PROMPT='\e${TXT_BOLD}\e${CLR_MAGENTA}\u\
\e${CLR_WHITE}@\e${CLR_YELLOW}\h\
\e${CLR_WHITE}:\e${CLR_GREEN}\w \
`__equator.vcprompt` \e${RESET_ATTR}'

# Set the title
case "$TERM" in
    xterm*|rxvt*)
        TITLEBAR="\[\e]0;\u@\h:\w\a\]"
    ;;
    *)
    ;;
esac

PS1="${TITLEBAR}${EQ_PROMPT}
» "
