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
HISTSIZE=9000
HISTCONTROL=ignoreboth

# enable color support of ls
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ls='ls --color=auto'

export VISUAL=vim
export EDITOR="$VISUAL"

export GOPATH=~/work/goroot
if [ -e $GOPATH/bin ]; then
  export PATH=$PATH:$GOPATH/bin
fi

backred="\e[41m"
arrow=$'\xe2\x86\x92'

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  PS1="${backred}\W${arrow} \[\033[m\]"
else
  PS1='\[\033[0;32m\]\W${arrow} \[\033[m\]'
fi
