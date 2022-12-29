#!/usr/bin/env zsh

if (( $+commands[dircolors] )); then
  eval $(dircolors ${${(%):-%x}:a:h}/material.dircolors )
else
  if (( $+commands[gdircolors] )); then
    eval $(gdircolors ${${(%):-%x}:a:h}/material.dircolors )
  fi

fi

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
