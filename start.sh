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

[ $TERM_PROGRAM ] && [ $TERM_PROGRAM = "WarpTerminal" ] && IS_WRAP_LIKE="yes"
# [ $TERMINAL_EMULATOR ] && [ $TERMINAL_EMULATOR = "JetBrains-JediTerm" ] && IS_WRAP_LIKE="yes"

# root path
SOMEOK_ZSH=${0:A:h}

if [ -n "$IS_WRAP_LIKE" ]; then
    # echo "warp like"
    source ${SOMEOK_ZSH}/start-warp.sh
else
    source ${SOMEOK_ZSH}/start-oh-my-zsh-custom.sh
fi
