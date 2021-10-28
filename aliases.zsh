alias cls='clear'

# ls
# ls 本身不做修改，否则可能导致部分 sh 脚本运行出错
alias ll='ls -lhF --color --group-directories-first --time-style=+%Y-%m-%d\ %H:%M'
alias lla='ll -A'
alias l='ll -a'

alias ls='ls --color'
alias lS='ls -1FSsh'
alias ldot='ls -ld .*'

# 覆盖 oh-my-zsh/lib/directories.zsh 中配置
alias la='lla'
alias lsa='l'
# ls end

alias zshrc='${=EDITOR:-vim} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

alias grep="grep --color=auto"

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s bz2='tar -xjvf'

alias dud='du -d 1 -h'
alias duf='du -sh *'
(($ + commands[fd])) || alias fd='find . -type d -name'
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

if [ -n "$OS_MAC" ]; then
    function free() {
        FREE_BLOCKS=$(vm_stat | grep free | awk '{ print $3 }' | sed 's/\.//')
        INACTIVE_BLOCKS=$(vm_stat | grep inactive | awk '{ print $3 }' | sed 's/\.//')
        SPECULATIVE_BLOCKS=$(vm_stat | grep speculative | awk '{ print $3 }' | sed 's/\.//')
        FREE=$((($FREE_BLOCKS + SPECULATIVE_BLOCKS) * 4096 / 1048576))
        INACTIVE=$(($INACTIVE_BLOCKS * 4096 / 1048576))
        TOTAL=$((($FREE + $INACTIVE)))
        echo "Free:       $FREE MB"
        echo "Inactive:   $INACTIVE MB"
        echo "Total free: $TOTAL MB"
    }
    alias free="free"
fi

# 返回给定文件或目录的绝对路径
function abspath() {
    if [ -d "$1" ]; then
        echo "$(
            cd $1
            pwd
        )"
    elif [ -f "$1" ]; then
        if [[ $1 == */* ]]; then
            echo "$(
                cd ${1%/*}
                pwd
            )/${1##*/}"
        else
            echo "$(pwd)/$1"
        fi
    fi
}
alias abspath="abspath "
