# oh-my-zsh custom config

# root path
export SOMEOK_ZSH=${0:A:h}

export ZSH=${SOMEOK_ZSH}/oh-my-zsh

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${SOMEOK_ZSH}/custom

plugins=(
    # oh-my-zsh 自带插件
    autojump
    extract
    sudo
    history
    copydir
    copybuffer
    colored-man-pages
    zsh_reload

    # 启用这个，会导致上下按钮冲突
    # zsh-navigation-tools

    # git submodule 增加的 custom 插件
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# linux or mac os x
if [ "$(uname -s)" = "Darwin" ]; then

    # mac 上专用 plugin
    plugins=(
        $plugins
        brew
        forklift
        fzf
        npm
        sublime
    )

    MAC_OVERRIDE_FILE=$SOMEOK_ZSH/override/mac.sh
    if [ -f "$MAC_OVERRIDE_FILE" ]; then
        source $MAC_OVERRIDE_FILE
    fi
else
    # linux
    ZSH_THEME="gruvbox"
    # ZSH_THEME="someok-linux"

    # 关闭 linux 下的安全监测
    ZSH_DISABLE_COMPFIX=true

    LINUX_OVERRIDE_FILE=$SOMEOK_ZSH/override/linux.sh
    if [ -f "$LINUX_OVERRIDE_FILE" ]; then
        source $LINUX_OVERRIDE_FILE
    fi
fi

# 自定义覆盖 oh-my-zsh 变量
OVERRIDE_FILE=$SOMEOK_ZSH/override/override.sh
if [ -f "$OVERRIDE_FILE" ]; then
    source $OVERRIDE_FILE
fi

# 此处开始正式载入 oh-my-zsh 配置
source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions
# [ctrl + space]
bindkey '^ ' autosuggest-accept

# 引入常用 aliases
source ${SOMEOK_ZSH}/aliases.sh
