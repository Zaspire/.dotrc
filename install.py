#!/usr/bin/python
import os

PARENT = os.path.abspath(os.path.dirname(__file__))

def install_file(name, dest_dir = os.path.expanduser('~'), dot = True):
    if not os.path.isdir(dest_dir):
        os.makedirs(dest_dir)
    if dot:
      dest = os.path.join(dest_dir, '.' + name)
    else:
      dest = os.path.join(dest_dir, name)
    if os.path.exists(dest):
        os.unlink(dest)
    os.symlink(os.path.join(PARENT, name), dest)

install_file('gitconfig')
install_file('bash_profile')
install_file('bashrc')
install_file('emacs')
install_file('ipython.py', os.path.expanduser('~/.ipython/profile_default/startup/'), False)
