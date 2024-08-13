# Standarized $0 handling, following:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
_DIRNAME="${0:h}"

echo 'zpm-zsh/material-colors: This plugin is deprecated, please use zpm-zsh/dircolors-neutral instead.'

source "${_DIRNAME}/dircolors-neutral.plugin.zsh"
