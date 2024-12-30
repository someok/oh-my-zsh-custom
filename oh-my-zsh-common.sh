###################################
#
# 通用配置
#
# start-warp.sh、start-oh-my-zsh-custom.sh 共用
#
###################################

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
    aliases
    extract
    history
    colored-man-pages
    rsync
    man

    # 类似 cd，不过可以记录历史，使用 scd -v 可方便切换
    scd

    # 提供 cpv 命令，作为 rsync 的缩写
    cp

    # colors 是 material-colors 的依赖，没有会报错
    colors
    dircolors-neutral

    # cht.sh
    cheatsh

    # ls 或 lsd 的 alias
    ls-lsd

    # 通过 ccat、cless 高亮显示文件，需预先安装 pip install Pygments
    # colorize
)

if [[ "$(command -v zoxide)" ]]; then
    plugins=($plugins zoxide)
else
    plugins=($plugins z)
fi

if (( $+commands[yazi] )); then
    plugins=($plugins yazi)
fi

if [ -n "$OS_MAC" ]; then
    # mac 上专用 plugin
    plugins=(
        $plugins

        git
        git-open
        sublime
        volta

        # 自动查找当前目录是否存在 gradlew 或是全局安装的 gradle
        # 支持自动完成
        gradle

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

    )
fi
