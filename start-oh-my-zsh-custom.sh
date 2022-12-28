# oh-my-zsh custom config

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
# 因为采用了 material-colors 这个第三方颜色库
DISABLE_LS_COLORS=true

plugins=(
    # oh-my-zsh 自带插件
    extract
    sudo
    history
    colored-man-pages
    z
    rsync
    man

    # 类似 cd，不过可以记录历史，使用 scd -v 可方便切换
    scd

    # 提供 cpv 命令，作为 rsync 的缩写
    cp

    # 启用这个，会导致上下按钮冲突
    # zsh-navigation-tools

    # git submodule 增加的 custom 插件 >>>>>

    # colors 是 material-colors 的依赖，没有会报错
    colors
    material-colors
    zsh-syntax-highlighting
    zsh-autosuggestions
    # history-search-multi-word
    # <<<<<<

    # cht.sh
    cheatsh

    # ssh 自动完成
    ssh_config
)

# linux or mac os x
if [ "$(uname -s)" = "Darwin" ]; then

    # mac 上专用 plugin
    plugins=(
        $plugins
        git-open
        sublime

        docker
        volta

        # 自动查找当前目录是否存在 gradlew 或是全局安装的 gradle
        # 支持自动完成
        gradle

        # 通过 ccat、cless 高亮显示文件，需预先安装 pip install Pygments
        colorize

        # SDKMAN 自动提示
        sdk

        # 可以通过一些命令打开或返回 finder 路径
        # 例如
        #   ofd: 通过 finder 打开当前目录
        #   pfd: 返回当前 finder 打开的路径
        #   pfs: 返回当前 finder 选择的路径或文件
        #   cdf: 进入当前 finder 所在路径
        #   quick-look: 指定文件
        #   man-preview: 使用预览打开 man page
        macos

        # `copypath` to copy the $PWD.
        copypath

        # `copyfile <filename>` to copy the file named `filename`
        copyfile

        # 使用 ctrl+o 拷贝当前命令
        copybuffer

        youtube-dl
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
# 此快捷键目前出现问题,不起作用,暂时不知是被谁占用了
bindkey '^ ' autosuggest-accept
# [ctrl + j]
bindkey '^j' autosuggest-accept

# 引入常用 aliases
source ${SOMEOK_ZSH}/aliases.zsh
