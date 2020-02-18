# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT='%F %T '
HISTCONTROL=ignoreboth
shopt -s histappend histverify autocd checkwinsize

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v --interactive=once'
alias less='less -qR'
alias ls='ls -F --color --show-control-chars'
alias ll='ls -alF --color --time-style=long-iso --show-control-chars'
alias dotfiles='git --git-dir="$HOME"/dotfiles --work-tree="$HOME"'
alias gitignore='[[ ! -e .gitignore ]] && curl -o.gitignore https://www.gitignore.io/api/git,vim,node,visualstudiocode,dotenv'
alias npminit="[[ ! -e package.json ]] && echo '{\"private\": true}' >package.json"

complete -d cd

case "$TERM" in
xterm*)
  if [ -x "`which winpty`" ]; then
    # The following programs are known to require a Win32 Console
    # for interactive usage, therefore let's launch them through winpty
    # when run inside `mintty`.
    for name in node npx npm ipython php php5 psql python2.7 python3 python2 python py perl pip pip3 b2
    do
      case "$(type -p "$name".exe 2>/dev/null)" in
      ''|/usr/bin/*) continue;;
      esac
      alias $name="winpty $name.exe"
    done
  fi
  ;;
esac

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=""
GIT_PS1_SHOWUPSTREAM='verbose name'
GIT_PS1_SHOWCOLORHINTS=1

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

PS1='\[\033]0;`basename "$SHELL"`: \w\007\]' # set window title
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\[\033[32m\]'       # green
PS1="$PS1"'\u@\h '             # user@host<space>
PS1="$PS1"'\[\033[33m\]'       # brownish yellow
PS1="$PS1"'\w'                 # current working directory
if test -f ~/.git-prompt.sh
then
  source ~/.git-prompt.sh
  PS1="$PS1"'\[\033[36m\]'  # cyan
  PS1="$PS1"'`__git_ps1`'   # bash function
fi
PS1="$PS1"'\[\033[0m\]'        # reset color
PS1="$PS1"'\n'                 # new line
PS1="$PS1"'\$ '                # prompt ($ or #)

PROMPT_COMMAND="__git_ps1 '\[\033]0;`basename \"\$SHELL\"`: \w\007\]\n\[\033[36m\]\u@\h \[\033[33m\]\w\[\033[35m\] ' '\[\033[0m\]\n\\\$ '"
