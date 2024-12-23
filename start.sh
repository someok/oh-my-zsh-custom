# 初始定义系统常量
# 调用示例：
# 1、 [ -n "$OS_MAC" ] && XXX
# 2、 if [ -n "$OS_MAC" ]; then
#       XXX
#     fi
OS=$(echo $(uname) | tr '[:upper:]' '[:lower:]')

[ "$OS" = "windowsnt" ] && OS_WIN="yes"
[ "$OS" = "darwin" ] && OS_MAC="yes"
[ "$OS" = "linux" ] && OS_LIN="yes"

# IDEA、WebStorm 的新终端类似 Warp 的效果，通过相关 env 中的参数进行判断
[[ ($TERM_PROGRAM && $TERM_PROGRAM = "WarpTerminal") ]] && WARP_STYLE="yes"
[ -n "$OS_MAC" ] && [[ ($TERM_PROGRAM && $TERM_PROGRAM = "WarpTerminal") || ($TERMINAL_EMULATOR && $TERMINAL_EMULATOR="JetBrains-JediTerm" && $FIG_TERM && $FIG_TERM="1") ]] && WARP_STYLE="yes"
# echo "WARP_STYLE = $WARP_STYLE"

# root path
SOMEOK_ZSH=${0:A:h}

if [ -n "$WARP_STYLE" ]; then
    # echo "warp"
    source ${SOMEOK_ZSH}/start-warp.sh
else
    source ${SOMEOK_ZSH}/start-oh-my-zsh-custom.sh
fi
