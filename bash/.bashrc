# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
if [[ -n "$PS1" ]]; then
    export BASH_HOME=~/.bash.d
    export EDITOR='vim'
    export IMAGE_VIEWER='gthumb'
    export BASH_THEME='equator'
    export TERM="xterm-256color"

    export PATH=$PATH:$BASH_HOME/bin

    # Pythons!
    export IPYTHONDIR=$HOME/.ipython
    export WORKON_HOME=$HOME/.virtualenv

    if [[ -s $HOME/.pyenv/bin/pyenv ]]; then
        export PATH=$PATH:$HOME/.pyenv/bin
        eval "$(pyenv init -)"
        pyenv virtualenvwrapper >&/dev/null
    fi

    # Rubies!
    if [[ -s $HOME/.rbenv/bin/rbenv ]]; then
        export PATH=$PATH:$HOME/.rbenv/bin
        eval "$(rbenv init -)"
    fi

    # Erlang/OTPs!
    if [[ -s $HOME/.erlenv/bin/erlenv ]]; then
        export PATH=$PATH:$HOME/.erlenv/bin
        eval "$(erlenv init -)"
    fi

    # Go
    if [[ -s $HOME/.goenv/bin/goenv ]]; then
        export PATH=$PATH:$HOME/.goenv/bin
        eval "$(goenv init -)"
    fi

    if [[ -s $HOME/.genma/genma.sh ]]; then
        source $HOME/.genma/genma.sh
    fi

    source $BASH_HOME/init.sh
fi
