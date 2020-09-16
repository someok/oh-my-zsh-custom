alias cls='clear'

# ls
# ls 本身不做修改，否则可能导致部分 sh 脚本运行出错
alias ll='ls -lhF --color --group-directories-first --time-style=+%Y-%m-%d\ %H:%M'
alias lla='ll -A'
alias l='ll -a'

alias ls='ls --color'

# 覆盖 oh-my-zsh/lib/directories.zsh 中配置
alias la='lla'
alias lsa='l'
# ls end

alias grep="grep --color=auto"

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s bz2='tar -xjvf'

alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias t='tail -f'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

alias t2='txt-to'
alias qs='open -a QSpace'
