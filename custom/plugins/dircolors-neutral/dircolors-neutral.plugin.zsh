#!/usr/bin/env zsh

ZSH_CACHE_DIR="${ZSH_CACHE_DIR:-${TMPDIR:-/tmp}/zsh-${UID:-user}}"
DIRCOLORS_CACHE_FILE="${ZSH_CACHE_DIR}/neutral-dircolors.zsh"

if (( $+functions[zpm] )); then
  zpm load zpm-zsh/colors
fi

# Dircolors
source "${DIRCOLORS_CACHE_FILE}" 2>/dev/null || {
  # Standarized $0 handling, following:
  # https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
  0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
  0="${${(M)0:#/*}:-$PWD/$0}"
  _DIRNAME="${0:h}"

  mkdir -p "${ZSH_CACHE_DIR}"

  local COMMAND
  if (( $+commands[dircolors] )); then
    COMMAND="dircolors"
  elif (( $+commands[gdircolors] )); then
    COMMAND="gdircolors"
  fi

  for file in "${_DIRNAME}/dircolors/"*.dircolors; do
    cat "$file"
  done | $COMMAND - > "${DIRCOLORS_CACHE_FILE}"

  source "${DIRCOLORS_CACHE_FILE}"
}
