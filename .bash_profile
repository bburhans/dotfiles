test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc

alias dotfiles='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias gitignore='[[ ! -e .gitignore ]] && curl -o.gitignore https://www.gitignore.io/api/git,vim,node,visualstudiocode'
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -al'
alias npminit="[[ ! -e package.json ]] && echo '{\"private\": true}' >package.json"

complete -d cd

