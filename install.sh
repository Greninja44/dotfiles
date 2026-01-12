#!/bin/bash

set -e

DOTFILES_DIR="$(pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d_%H%M%S)"

echo "Installing dotfiles from: $DOTFILES_DIR"
echo "Backup directory: $BACKUP_DIR"

mkdir -p "$BACKUP_DIR"

backup_if_exists() {
  if [ -e "$1" ]; then
    echo "Backing up $1"
    mkdir -p "$BACKUP_DIR$(dirname "$1")"
    mv "$1" "$BACKUP_DIR$1"
  fi
}

echo "Backing up existing configuration files..."

backup_if_exists "$HOME/.config/hypr"
backup_if_exists "$HOME/.config/waybar"
backup_if_exists "$HOME/.config/kitty"
backup_if_exists "$HOME/.config/rofi"
backup_if_exists "$HOME/.config/fastfetch"
backup_if_exists "$HOME/.config/swaylock"

backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.zprofile"
backup_if_exists "$HOME/.tmux.conf"

echo "Installing new configuration files..."

mkdir -p "$HOME/.config"

cp -r .config/* "$HOME/.config/"
cp .zshrc "$HOME/"
cp .zprofile "$HOME/"
cp .tmux.conf "$HOME/"

echo "Installation complete."
echo "Backups are stored in: $BACKUP_DIR"
echo "Restart your session or reload Hyprland to apply changes."

