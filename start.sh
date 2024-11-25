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

# 目前 IDEA、WebStorm 的新终端效果尚未达到我愿意切换的程度，所以暂时不启用
[ -n "$OS_MAC" ] && [[ ($TERM_PROGRAM && $TERM_PROGRAM = "WarpTerminal") ]] && WRAP_STYLE="yes"
# [ -n "$OS_MAC" ] && [[ ($TERM_PROGRAM && $TERM_PROGRAM = "WarpTerminal") || ($TERMINAL_EMULATOR && $TERMINAL_EMULATOR="JetBrains-JediTerm") ]] && WRAP_STYLE="yes"
echo "WRAP_STYLE = $WRAP_STYLE"

# root path
SOMEOK_ZSH=${0:A:h}

if [ -n "$WRAP_STYLE" ]; then
    # echo "warp"
    source ${SOMEOK_ZSH}/start-warp.sh
else
    source ${SOMEOK_ZSH}/start-oh-my-zsh-custom.sh
fi
