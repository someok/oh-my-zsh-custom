#
# theme: https://github.com/bhilburn/powerlevel9k
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 由于 material-colors.plugin.zsh 会在初始报错：
# /Users/wjx/MyFolder/Develop/MyWorkspace/_config/oh-my-zsh-custom/custom/plugins/material-colors/material-colors.plugin.zsh:44: substring expression: -1 < 2
# 导致 powerlevel10k 会出现一堆提示，下面这个用来屏蔽提示
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status root_indicator background_jobs time)

# 左侧前缀

## 默认前缀的基础上加了三个提示箭头
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\u256D\U2500"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\U2500\uF460\uF460\uF460 "    # ╰─

## 无前缀模式
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\uF460\uF460\uF460 "    # ╰─

# 圆角分隔符
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B4"
# POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
# POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"

# colors

## 目录背景色
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='033'
POWERLEVEL9K_DIR_HOME_BACKGROUND='045'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='045'
POWERLEVEL9K_DIR_ETC_BACKGROUND='202'
# POWERLEVEL9K_DIR_PATH_HIGHLIGHT_FOREGROUND='144'

## 右侧提示内容背景色
POWERLEVEL9K_STATUS_OK_BACKGROUND='240'
POWERLEVEL9K_TIME_BACKGROUND='152'

# source $SOMEOK_ZSH/modules/powerlevel9k/powerlevel9k.zsh-theme
source $SOMEOK_ZSH/modules/powerlevel10k/powerlevel10k.zsh-theme
