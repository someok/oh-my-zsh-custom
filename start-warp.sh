# oh-my-zsh custom config
export ZSH=${SOMEOK_ZSH}/oh-my-zsh

source ${SOMEOK_ZSH}/oh-my-zsh-common.sh

# 此处开始正式载入 oh-my-zsh 配置
source $ZSH/oh-my-zsh.sh

# 引入常用 aliases
source ${SOMEOK_ZSH}/aliases.zsh
