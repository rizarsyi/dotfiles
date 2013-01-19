from fabric.api import local
from os import path as op
from os import getenv, listdir


_src_dir = op.abspath(op.dirname(__file__))
_dst_dir = getenv('HOME')


def install():
    src = [f for f in listdir(_src_dir) if f.startswith('_')]
    for df in src:
        source = op.join(_src_dir, df)
        target = op.join(_dst_dir, df.replace('_', '.', 1))
        if op.exists(target):
            local('rm -rf %s' % target)
        local('cp -R %s %s' % (source, target))


def remove():
    src = [f for f in listdir(_src_dir) if f.startswith('_')]
    for df in src:
        target = op.join(_dst_dir, df.replace('_', '.', 1))
        if op.exists(target):
            local('rm -rf %s' % target)
