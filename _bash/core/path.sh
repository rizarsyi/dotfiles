#!/usr/bin/env bash

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# remove directory and its contents recursively
alias purge_dir='rm -rf'

# create directory and go the newly created directory
function mkcd() {
    : ${1:?"A non-empty argument is required"}
    mkdir -p "$1" && cd "$1"
}

# print working file
function pwf() {
    if [[ -n "$1" ]]; then
        echo "$PWD/$1"
    else
        echo "$PWD"
    fi
}

# go to upper directory
function up() {
    num=$1

    if [[ ! -n $num ]]; then
        num=1
    elif [[ ! "$num" =~ ^[0-9]+$ ]]; then
        echo "error: a positive number is required" && return 0
    fi

    if [[ "$num" -lt 2 ]]; then
        cd ../ && return 0
    fi

    while [[ "$num" -ne 0 ]]; do
        if [[ "$PWD" == "/" ]]; then
            break
        fi
        cd ../
        num=$(( $num - 1 ))
    done
}

# go to previous directory
function back() {
    cd $OLDPWD
}
