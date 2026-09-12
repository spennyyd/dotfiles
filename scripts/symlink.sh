#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d%H%M%S)"

declare -A MAPPINGS=(
  [".zshrc"]=".zshrc"
  ["ghostty"]=".config/ghostty"
  #["gitconfig"]=".gitconfig"
  ["tmux"]=".config/tmux"
  ["nvim"]=".config/nvim"
)

for src in "${!MAPPINGS[@]}"; do
  target="$HOME/${MAPPINGS[$src]}"
  source_path="$DOTFILES_DIR/$src"

  if [ -L "$target" ]; then
    current_target="$(readlink "$target")"
    if [ "$current_target" = "$source_path" ]; then
      echo "[skip] $target already linked correctly"
      continue
    fi
  fi

  if [ -e "$target" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$target" "$BACKUP_DIR/"
    echo "[backup] $target moved to $BACKUP_DIR/"
  fi

  mkdir -p "$(dirname "$target")"
  ln -s "$source_path" "$target"
  echo "[linked] $source_path → $target"
done
