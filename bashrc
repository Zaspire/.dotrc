#!/usr/bin/bash
if [ `uname` = "Darwin" ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

#FIXME
  export PATH=$PATH:~/bin/android-sdk/tools:~/bin/android-sdk/platform-tools

fi

PS1="\[\033[0;32m\]\W\$\[\033[m\]"
