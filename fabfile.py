from os import path as op
from os import getenv as _getenv
from os import listdir as _listdir

from fabric.api import local


_src_dir = op.abspath(op.dirname(__file__))
_dst_dir = _getenv('HOME')


def install():
    """Installs dotfiles to $HOME directory.
    """
    src = [f for f in _listdir(_src_dir) if f.startswith('_')]
    for df in src:
        source = op.join(_src_dir, df)
        target = op.join(_dst_dir, df.replace('_', '.', 1))
        if op.exists(target):
            local('rm -rf %s' % target)
        local('cp -R %s %s' % (source, target))

    local("ln -s ~/.powerline/font/PowerlineSymbols.otf ~/.fonts/")
    local(
        "sudo ln -s ~/.powerline/font/10-powerline-symbols.conf "
        "/etc/fonts/conf.d -f")
    local("fc-cache -vf ~/.fonts")


def remove():
    """Uninstalls dotfiles from $HOME directory.
    """
    src = [f for f in _listdir(_src_dir) if f.startswith('_')]
    for df in src:
        target = op.join(_dst_dir, df.replace('_', '.', 1))
        if op.exists(target):
            local('rm -rf %s' % target)


def update_submodules():
    """Updates all registered submodules (requires git).
    """
    local("git submodule update --init")
    local('git submodule foreach "git pull"')
