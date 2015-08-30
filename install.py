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

def install_go_deps(name):
    os.system('go get -u ' + name)

install_file('gitconfig')
install_file('bash_profile')
install_file('bashrc')
install_file('emacs')
install_file('ipython.py', os.path.expanduser('~/.ipython/profile_default/startup/'), False)

install_go_deps('code.google.com/p/rog-go/exp/cmd/godef')
install_go_deps('github.com/nsf/gocode')

DEPENDENCIES = ['go', 'mercurial', 'emacs', 'editorconfig', 'cmake', 'autoconf',
                'automake', 'pkg-config', 'git', 'gdb', 'node', 'python']
PIP_DEPENDENCIES = ['virtualenv']

