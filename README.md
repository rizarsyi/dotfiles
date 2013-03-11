# Dotfiles

One single repo to rule 'em all!

## Quickstart

Install:

    git clone git://github.com/iromli/dotfiles.git --recursive
    cd /path/to/dotfiles
    fab install
    cp ~/.powerline/font/PowerlineSymbols.otf ~/.fonts/
    [sudo] cp ~/.powerline/font/10-powerline-symbols.conf /etc/fonts/conf.d
    fc-cache -vf ~/.fonts

Uninstall:

    cd /path/to/dotfiles
    fab remove

## How Does It Work?

Basically, any files/directories prefixed with `_` will be copied to
`$HOME` directory as `.` files/directory.
Note, any existing `.` files/directories copied from this repo will be replaced,
so make sure you backup important files/directory manually.

Source:

    .
    ├── _bash
    ├── _bin
    ├── _fonts
    ├── _ipython
    ├── _powerline
    ├── _vim
    ├── _weechat
    ├── _ackrc
    ├── _bash_aliases
    ├── _bash_logout
    ├── _bash_profile
    ├── _bashrc
    ├── fabfile.py
    ├── _gemrc
    ├── _gitconfig
    ├── README.md
    ├── _tmux.conf
    └── _vimrc

Destination:

    .
    ├── .bash
    ├── .bin
    ├── .fonts
    ├── .ipython
    ├── .powerline
    ├── .vim
    ├── .weechat
    ├── .ackrc
    ├── .bash_aliases
    ├── .bash_logout
    ├── .bash_profile
    ├── .bashrc
    ├── .gemrc
    ├── .gitconfig
    ├── .tmux.conf
    └── .vimrc

## Fork and Modify!

I won't accept any PR, but ideas/hints/bugs reports are welcome though.
Why? Because [dotfiles are meant to be forked][holman-blog].

[holman-blog]: http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked
