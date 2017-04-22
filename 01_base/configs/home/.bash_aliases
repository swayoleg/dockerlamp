#system
alias ls='ls -CFH --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -Alh'
alias la='ls -A'
alias l='ls'
alias cd..='cd ..'

alias ~='cd ~'

alias v='vim'
alias vm='vim'
alias vi='vim'

alias tailf='tail -f'

alias mysql='mysql --default-character-set=utf8'
alias export-langs='export LC_ALL=en_US.UTF-8; export LANG=en_US.UTF-8'



alias st='git status -sb'
alias gs='git status '
alias ga='git add '
alias gadd='git add .'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gch='git checkout '
alias gl="git log --pretty=format:'%h %ad | %s%d [%an]' --date=iso"
alias gh="git hist"
alias gchb='git checkout -b '
alias gk='gitk --all&'
alias gx='gitx --all'
alias gp='git pull '
alias gps='git push '
alias gm='git merge '

alias merge='git merge '
alias status='git status'
alias pull='git pull'
alias push='git push origin '
alias fetch='git fetch '
alias clone='git clone '
alias checkout='git checkout '
alias add='git add '
alias branch='git branch '
alias diff='git diff '

alias g='git'
source /usr/share/bash-completion/completions/git
complete -o default -o nospace -F _git g
alias got='git '
source /usr/share/bash-completion/completions/git
complete -o default -o nospace -F _git got
alias get='git '
source /usr/share/bash-completion/completions/git
complete -o default -o nospace -F _git get
alias gut='git '
source /usr/share/bash-completion/completions/git
complete -o default -o nospace -F _git gut

