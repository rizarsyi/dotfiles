#!/usr/bin/env bash

alias kernel_name='uname -s'
alias kernel_release='uname -r'
alias kernel_version='uname -v'

# get architecture name
function arch_name() {
    [[ `uname -m` == 'x86_64' ]] && echo 'x64' || echo 'x86'
}

# get OS release name
function os_name() {
    echo "`kernel_name` `head -1 /etc/issue`" | sed 's/\\.//g'
}
