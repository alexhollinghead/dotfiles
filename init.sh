#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

mkdir -p "$CONFIG_DIR"

for dir in "$DOTFILES_DIR"/*/; do
    name="$(basename "$dir")"
    target="$CONFIG_DIR/$name"

    if [ -L "$target" ]; then
        echo "already linked: $target"
    elif [ -e "$target" ]; then
        echo "skipping $target — exists and is not a symlink (move or remove it manually)"
    else
        ln -s "$dir" "$target"
        echo "linked: $target -> $dir"
    fi
done
