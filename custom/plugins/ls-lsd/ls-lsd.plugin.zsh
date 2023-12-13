# ls 或 lsd 的 alias
# 如果 lsd 不存在，则回退到 ls

if [[ "$(command -v lsd)" ]]; then
    # lsd
    alias ll="lsd -l -F --group-directories-first -g --header --date '+%y-%m-%d %H:%M' --size short"
    alias lla='ll -A'
    alias l='ll -a'

    alias ls='ls --color'
    alias lS='lsd -FSl --size short --total-size --blocks size,name'
    alias ldot='ll -d .*'

    # 覆盖 oh-my-zsh/lib/directories.zsh 中配置
    alias la='lla'
    alias lsa='l'
    # lsd end
else
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
fi
