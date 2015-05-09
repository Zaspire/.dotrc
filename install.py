#!/usr/bin/python
import os

PARENT = os.path.abspath(os.path.dirname(__file__))

def install_file(name):
    os.unlink(os.path.expanduser('~/.' + name))
    os.symlink(os.path.join(PARENT, name), os.path.expanduser('~/.' + name))

install_file('gitconfig')
