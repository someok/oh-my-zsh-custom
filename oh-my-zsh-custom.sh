# oh-my-zsh config
export SOMEOK_ZSH=${0:A:h}

export ZSH=${SOMEOK_ZSH}/oh-my-zsh

# linux or mac os x
if [ "$(uname -s)" = "Darwin" ]; then
	# theme: https://github.com/eendroroy/alien
    export ALIEN_THEME="gruvbox"
    export ALIEN_DATE_TIME_FORMAT=%H:%M:%S # default is %r
    export USE_NERD_FONT=1
    source ${SOMEOK_ZSH}/modules/alien/alien.zsh
else
    ZSH_THEME="someok-linux"
fi

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${SOMEOK_ZSH}/custom

plugins=(
    autojump
    gnu-utils
    sudo
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# [ctrl + space]
bindkey '^ ' autosuggest-accept
