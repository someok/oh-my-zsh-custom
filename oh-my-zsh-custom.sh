# oh-my-zsh custom config

# root path
SOMEOK_ZSH=${0:A:h}

export ZSH=${SOMEOK_ZSH}/oh-my-zsh

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${SOMEOK_ZSH}/custom

plugins=(
    autojump
    extract
    sudo
    history
    copydir
    copybuffer
    colored-man-pages
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# linux or mac os x
if [ "$(uname -s)" = "Darwin" ]; then
    # mac os x
	# theme: https://github.com/eendroroy/alien
    export ALIEN_THEME="gruvbox"
    export ALIEN_DATE_TIME_FORMAT=%H:%M:%S # default is %r
    export USE_NERD_FONT=1
    source ${SOMEOK_ZSH}/modules/alien/alien.zsh

    # mac 上专用 plugin
    plugins=(
        $plugins
        brew
        forklift
        fzf
        npm
        sublime
    )
else
    # linux
    ZSH_THEME="someok-linux"

    # 关闭 linux 下的安全监测
    ZSH_DISABLE_COMPFIX=true

fi

source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions
# [ctrl + space]
bindkey '^ ' autosuggest-accept

# 引入常用 aliases
source ${SOMEOK_ZSH}/aliases.sh
