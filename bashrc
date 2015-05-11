#!/usr/bin/bash
if [ `uname` = "Darwin" ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

#FIXME
  export PATH=$PATH:~/bin/android-sdk/tools:~/bin/android-sdk/platform-tools

fi

if [ -e /etc/bash_completion ]; then
    source /etc/bash_completion
fi

GREP_OPTIONS='--color=auto'
HISTSIZE=9000
HISTCONTROL=ignoreboth
# enable color support of ls
CLICOLOR=1
VISUAL=vim
EDITOR="$VISUAL"

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
PS1="\[\033[0;32m\]\W\$\[\033[m\]"
