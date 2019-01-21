# oh-my-zsh custom config

# root path
SOMEOK_ZSH=${0:A:h}

export ZSH=${SOMEOK_ZSH}/oh-my-zsh

# history 数量
export HISTFILESIZE=1000
export HISTSIZE=1000

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# 关闭自动更新
DISABLE_AUTO_UPDATE=true


# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${SOMEOK_ZSH}/custom

# 取消 oh-my-zsh 默认的 ls colors 处理
# 因为采用了 dircolors-material 这个第三方颜色库
DISABLE_LS_COLORS=true

plugins=(
    # oh-my-zsh 自带插件
    extract
    sudo
    history
    colored-man-pages
    zsh_reload
    # z

    # 启用这个，会导致上下按钮冲突
    # zsh-navigation-tools

    # git submodule 增加的 custom 插件
    dircolors-material
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# linux or mac os x
if [ "$(uname -s)" = "Darwin" ]; then

    # mac 上专用 plugin
    plugins=(
        $plugins
        brew
        copydir
        copybuffer
        forklift
        fzf
        git-open
        npm
        sublime
        vscode
        z
    )

    MAC_OVERRIDE_FILE=$SOMEOK_ZSH/override/mac.sh
    if [ -f "$MAC_OVERRIDE_FILE" ]; then
        source $MAC_OVERRIDE_FILE
    fi
else
    # linux
    ZSH_THEME="someok-linux"

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
source ${SOMEOK_ZSH}/aliases.zsh
