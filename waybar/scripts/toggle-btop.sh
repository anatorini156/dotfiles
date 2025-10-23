#!/usr/bin/env zsh

if [[ $(lsof -c btop) ]] then
  pkill btop
else
  btop
fi

