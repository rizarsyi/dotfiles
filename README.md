# Dotfiles

One single repo to rule 'em all!

## Quickstart

Install:

    $ git clone git://github.com/iromli/dotfiles.git --recursive
    $ cd /path/to/dotfiles
    $ fab install

Uninstall:

    $ cd /path/to/dotfiles
    $ fab remove

## How Does It Work?

Basically, any files/directories prefixed with `_` will be copied to
`$HOME` directory as `.` files/directory.

**WARNING**: make sure you backup important files/directory manually.

Source (`/path/to/dotfiles`):

    .
    ├── _bin
    ├── _ipython
    ├── _weechat
    ├── _ackrc
    ├── fabfile.py
    ├── _gemrc
    ├── _gitconfig
    ├── README.md
    ├── _tmux.conf

Destination (`$HOME`):

    .
    ├── .bin
    ├── .ipython
    ├── .weechat
    ├── .ackrc
    ├── .gemrc
    ├── .gitconfig
    ├── .tmux.conf

## Fork and Modify!

I won't accept any PR, but ideas/hints/bugs reports are welcome though.
Why? Because [dotfiles are meant to be forked][holman-blog].

[holman-blog]: http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked
