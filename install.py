#!/usr/bin/python3
import os
import sys
import subprocess

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


def gsettings_set(path, key, value):
  subprocess.run(['gsettings', 'set', path, key, value], check=True)


def gsettings_get(path, key):
  p = subprocess.run(['gsettings', 'get', path, key], check=True, stdout=subprocess.PIPE)
  return p.stdout.decode().strip('\n\'')


def add_keybinding(n, name, command, binding):
  path = 'org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom%s/' % n
  gsettings_set(path, 'name', name)
  gsettings_set(path, 'command', command)
  gsettings_set(path, 'binding', binding)

  # TODO: support multiple custom key bindings
  gsettings_set('org.gnome.settings-daemon.plugins.media-keys',
                'custom-keybindings',
                "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']",
  )


install_file('gitconfig')
install_file('bash_profile')
install_file('bashrc')
install_file('emacs')
install_file('pdbrc')
install_file('ipython.py', os.path.expanduser('~/.ipython/profile_default/startup/'), False)

install_go_deps('github.com/bazelbuild/buildtools/buildifier')

if sys.platform == 'linux':
  gsettings_set(
    'org.gnome.settings-daemon.plugins.media-keys',
    'calculator', '<Primary>Calculator')
  gsettings_set(
    'org.gnome.settings-daemon.plugins.media-keys',
    'calculator', '<Primary>Calculator')
  add_keybinding(0, 'run emacs', 'emacs', 'Calculator')

  gsettings_set(
    'org.gnome.desktop.wm.keybindings', 'switch-windows', "['<Alt>Tab']")
  gsettings_set(
    'org.gnome.desktop.wm.keybindings', 'switch-applications', "['<Super>Tab']")

  terminal_profile = gsettings_get('org.gnome.Terminal.ProfilesList', 'default')
  gsettings_set(
    'org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:%s/' % terminal_profile,
    'use-theme-colors',
    'false')

  gsettings_set('org.gnome.nautilus.preferences', 'click-policy', 'single')

DEPENDENCIES = ['go', 'mercurial', 'emacs', 'editorconfig', 'cmake', 'autoconf',
                'automake', 'pkg-config', 'git', 'gdb', 'node', 'python']
PIP_DEPENDENCIES = ['virtualenv']
