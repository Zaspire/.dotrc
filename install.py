#!/usr/bin/python
import os

PARENT = os.path.abspath(os.path.dirname(__file__))

def install_file(name):
    dest = os.path.expanduser('~/.' + name)
    if os.path.exists(dest):
        os.unlink(dest)
    os.symlink(os.path.join(PARENT, name), dest)

install_file('gitconfig')
install_file('bash_profile')
