# mac 上预览块如果有 border 设置，边框会显示不全，所以这里设置为 0
export RUNEWIDTH_EASTASIAN=0

export FZF_COMPLETION_TRIGGER='**'
export FZF_DEFAULT_COMMAND="fd --type file --color=always"

# 使得 fzf 默认支持颜色
export FZF_DEFAULT_OPTS="--ansi"

# export FZF_COMPLETION_OPTS='--border --info=inline'
# export FZF_ALT_C_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || tree -C -L 3 {} | head -100) 2> /dev/null'"

export FZF_CTRL_T_OPTS="
    --preview '(highlight -O ansi -l {} 2> /dev/null || bat -f --line-range :40 {} || tree -C -L 3 {} | head -100) 2> /dev/null'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"


# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'

# 增加 tmux 支持
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' popup-min-size 80 12

# kill 结束进程时时提供预览
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,command -w -w"
# command= 表示不显示 header
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps -p $word -o command= -w -w'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags '--preview-window=down:3:wrap'

# 预览 cd 命令对应的目录内容
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -l -F --group-directories-first --color always --header --icon always --blocks permission,name  --size short $realpath | head -100'

# environment variable
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-flags '--preview-window=wrap'

# zstyle ':fzf-tab:complete:(-command-:|command:option-alias-rest):*' fzf-preview 'echo ${(P)word}'
# zstyle ':fzf-tab:complete:(-command-:|command:option-alias-rest):*' fzf-flags '--preview-window=wrap'
zstyle ':fzf-tab:complete:-command-:*' fzf-preview 'alias "${word}"'
# zstyle ':fzf-tab:complete:-command-:*' fzf-preview 'echo $(command -v "$word")'

# Homebrew
zstyle ':fzf-tab:complete:brew-(install|uninstall|search|info):*-argument-rest' fzf-preview 'brew info $word'

# systemctl
zstyle ':fzf-tab:complete:systemctl-(status|(re|)start|(dis|en)able):*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

_fzf_compgen_path() {
  fd --hidden --follow --color=always --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --color=always --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200'  --preview-window right:50%,wrap ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}"  --preview-window right:50%,wrap ;;
    ssh)          fzf "$@" --preview 'dig {}' --preview-window right:50%,wrap ;;
    *)            fzf "$@" ;;
  esac
}
