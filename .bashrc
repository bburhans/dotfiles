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
alias ls='ls -F --color'
alias ll='ls -alF --color --time-style=long-iso'
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
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWUPSTREAM='auto'
GIT_PS1_SHOWCOLORHINTS=1

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
