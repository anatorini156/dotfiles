#!/usr/bin/env zsh


function ce(){
    DIRS="nixos\nnvim\nhypr\nwaybar\nhome-manager"
    DIR=$(echo "$DIRS" | fzf)
    nvim "$HOME/.config/$DIR/"
}
