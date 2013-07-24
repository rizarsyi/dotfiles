#!/usr/bin/env bash

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


#==============================================================================
# Completions
#==============================================================================

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Load plugin libraries
for lib in $BASH_HOME/completions/*.sh; do
    source $lib
done


#==============================================================================
# Prompts
#==============================================================================

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
    *)
    ;;
esac

# Load theme
[[ -f $BASH_HOME/themes/$BASH_THEME.sh ]] && \
    source $BASH_HOME/themes/$BASH_THEME.sh


#==============================================================================
# Aliases
#==============================================================================

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# A workaround to pass all aliases to sudo
# http://wiki.archlinux.org/index.php/Sudo#Passing_aliases
alias sudo='sudo '

# Hub is best aliased as Git
if [[ ! -z `which git` && ! -z `which ruby` && ! -z `which hub` ]]; then
    alias git=hub
fi

# Force `tmux` to assume the terminal supports 256 colours.
if [[ ! -z `which tmux` ]]; then
    alias="tmux -2"
fi

# Actually ack in Ubuntu is reserved as another command,
# but for convenience i'd like to use the ack namespace
alias ack=ack-grep

# Sometime the cursor freezes, so bring back the cursor alive
alias tpoff="synclient TouchPadOff=true"

# List of reserved ports, use `sudo ports` for more details
alias ports='netstat -napt | ack -i LISTEN'

alias remote-ip='curl ifconfig.me'

alias t='t --task-dir ~/.tasks --list tasks'

alias srv='python -m SimpleHTTPServer '

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# remove directory and its contents recursively
alias purge_dir='rm -rf'

alias kernel_name='uname -s'
alias kernel_release='uname -r'
alias kernel_version='uname -v'

alias dirsize='du -sh'


#==============================================================================
# Functions
#==============================================================================

# run editor to configure bashrc
function bashrc_configure() {
    if [[ ! $EDITOR ]]; then
        EDITOR='nano'
    fi
    $EDITOR ~/.bashrc
}

# reload bashrc
function bashrc_reload() {
    source ~/.bashrc
    echo "reloaded!"
}

# create directory and go the newly created directory
function mkcd() {
    : ${1:?"A non-empty argument is required"}
    mkdir -p "$1" && cd "$1"
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

# get architecture name
function arch_name() {
    [[ `uname -m` == 'x86_64' ]] && echo 'x64' || echo 'x86'
}

# get OS release name
function os_name() {
    echo "`kernel_name` `head -1 /etc/issue`" | sed 's/\\.//g'
}

# setup git config globally
function ggconf() {
    git config --global user.name "Isman Firmansyah"
    git config --global user.email "isman.firmansyah@gmail.com"
}
