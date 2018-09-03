#!/usr/bin/bash
if [ `uname` = "Darwin" ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

#FIXME
  export PATH=$PATH:~/bin:~/bin/android-sdk/tools:~/bin/android-sdk/platform-tools
  alias mclip=pbcopy
fi
if [ `uname` = "Linux" ]; then
  alias mclip="xclip -selection c "
fi

if [ -e /etc/bash_completion ]; then
  source /etc/bash_completion
fi

alias bb="bazel build --config=opt "
alias bt="bazel test --config=opt "
alias br="bazel run --config=opt "

_my_bazel_alias_autocompelete() {
  _bazel__complete_target_stdout "build"
}
complete -F _my_bazel_alias_autocompelete -o nospace br
complete -F _my_bazel_alias_autocompelete -o nospace bt
complete -F _my_bazel_alias_autocompelete -o nospace bb

export GREP_OPTIONS='--color=auto'
alias grep="`which grep` --color=auto"
unset GREP_OPTIONS

HISTSIZE=9000
HISTCONTROL=ignoreboth

# enable color support of ls
export CLICOLOR=1
ls --color=auto &> /dev/null && alias ls='ls --color=auto'

export ALTERNATE_EDITOR=""
if [[ -z "$MYEMACSSERVERNAME" ]]; then
  export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI with non-daemon as alternate
  export EDITOR="emacsclient -t"                  # $EDITOR should open in terminal
else
  export VISUAL="emacsclient -a emacs -s $MYEMACSSERVERNAME"
  export EDITOR="emacsclient -t -s $MYEMACSSERVERNAME"
fi
# fix ls colored output in emacs shell
if [[ "$TERM" = "dumb" ]]; then
    export TERM=ansi
fi


export GOPATH=~/work/goroot
if [ -e $GOPATH/bin ]; then
  export PATH=$PATH:$GOPATH/bin
fi

export PYTHONSTARTUP=~/.dotrc/pythonrc.py

# record execution time
function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  execution_time="$(($SECONDS - $timer))"
  unset timer
}

trap 'timer_start' DEBUG

function set_prompt() {
  # set Window title for UI terminal
  if [[ -z ${INSIDE_EMACS+x} ]]; then
    echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
  fi

  timer_stop

  backred='\e[41m'
  txtgrn='\e[0;32m'
  txtylw='\e[0;33m'
  arrow=$'\xe2\x86\x92'

  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PS1="${txtylw}${execution_time}s ${backred}\W\n${arrow} \[\033[m\]"
  else
    PS1="${txtylw}${execution_time}s ${txtgrn}\W\n${arrow} \[\033[m\]"
  fi
}

PROMPT_COMMAND='set_prompt'
export LC_ALL='en_US.UTF-8'
export TFHUB_CACHE_DIR=~/tmp/tfhub_modules/
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}:/usr/local/cuda/extras/CUPTI/lib64
