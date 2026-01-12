#!/usr/bin/env zsh

DIRS=$(cat <<'EOF'
nixos
nvim
hypr
waybar
home-manager
dupa
EOF
)

DIR=$(echo $DIRS | fzf)

nvim $(echo "$HOME/.config/$DIR/")
