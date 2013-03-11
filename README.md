# Dotfiles

One single repo to rule 'em all!

    git clone git://github.com/iromli/dotfiles.git

Install:

    cd /path/to/dotfiles
    fab install

Fixing the Powerline symbols:

    cp ~/.powerline/font/PowerlineSymbols.otf ~/.fonts/
    sudo cp ~/.powerline/font/10-powerline-symbols.conf /etc/fonts/conf.d

Using new fonts:

    fc-cache -vf ~/.fonts

Uninstall:

    cd /path/to/dotfiles
    fab remove

## Fork and Modify as You Want!

[http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked][holman-blog]

[holman-blog]: http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked
