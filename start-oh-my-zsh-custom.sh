# oh-my-zsh custom config

[[ "$(command -v starship)" ]] && USE_STARSHIP="yes"

export ZSH=${SOMEOK_ZSH}/oh-my-zsh

source ${SOMEOK_ZSH}/oh-my-zsh-common.sh

plugins=(
    $plugins
    sudo

    zsh-syntax-highlighting
    zsh-autosuggestions
    # history-search-multi-word

    # ssh 自动完成
    ssh
    # ssh_config # todo: 待删除

    fzf-tab
    fzf-tab-preview
)


# linux or mac os x
if [ -n "$OS_MAC" ]; then

    # mac 上专用 plugin
    plugins=(
        $plugins


        docker

        # `copypath` to copy the $PWD.
        copypath

        # `copyfile <filename>` to copy the file named `filename`
        copyfile

        # 使用 ctrl+o 拷贝当前命令
        copybuffer
    )

    MAC_OVERRIDE_FILE=$SOMEOK_ZSH/override/mac.sh
    if [ -f "$MAC_OVERRIDE_FILE" ]; then
        source $MAC_OVERRIDE_FILE
    fi
else
    # linux
    # ZSH_THEME="someok-linux"

    if [ -z "$USE_STARSHIP" ]; then
        ZSH_THEME="someok-linux"
    fi

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
# 此快捷键目前出现问题,不起作用,暂时不知是被谁占用了
bindkey '^ ' autosuggest-accept
# [ctrl + j]
bindkey '^j' autosuggest-accept

# 引入常用 aliases
source ${SOMEOK_ZSH}/aliases.zsh

# starship
if [ -n "$USE_STARSHIP" ]; then
    # ignore oh-my-zsh theme
    unset ZSH_THEME

    eval "$(starship init zsh)"
fi
