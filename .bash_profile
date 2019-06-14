test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc

alias dotfiles='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias gitignore='[[ ! -e .gitignore ]] && curl -o.gitignore https://www.gitignore.io/api/git,vim,node,visualstudiocode'
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -al'
alias npminit="[[ ! -e package.json ]] && echo '{\"private\": true}' >package.json"

complete -d cd


case "$TERM" in
xterm*)
  if [ -x "`which winpty`" ]; then
        # The following programs are known to require a Win32 Console
        # for interactive usage, therefore let's launch them through winpty
        # when run inside `mintty`.
        for name in node ipython php php5 psql python2.7 python3 python2 python py perl
        do
                case "$(type -p "$name".exe 2>/dev/null)" in
                ''|/usr/bin/*) continue;;
                esac
                alias $name="winpty $name.exe"
        done
  fi
  ;;
esac

