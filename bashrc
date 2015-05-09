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

export GREP_OPTIONS='--color=auto'
export HISTSIZE=9000

# enable color support of ls
export CLICOLOR=1

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
PS1="\[\033[0;32m\]\W\$\[\033[m\]"
