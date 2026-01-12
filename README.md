#  Hyprland Dotfiles 

Personal **Arch Linux + Hyprland** dotfiles focused on a clean, minimal, and productive workflow.

These configs power my daily-driver Wayland setup.

---

## Features

- Hyprland (Wayland compositor)
- Waybar (status bar)
- Rofi (application launcher)
- Kitty (terminal emulator)
- Zsh configuration
- Minimal dark theme with smooth animations

---
## Preview

![preview](https://github.com/user-attachments/assets/209a7be7-90ca-4a52-bba8-c16bf2043632)

In addition to configuration files, this repository includes helper scripts to install the dotfiles and keep them updated automatically.

---

## Repository structure

dotfiles/
├── .config/
│   ├── hypr/
│   ├── waybar/
│   ├── kitty/
│   ├── rofi/
│   ├── fastfetch/
│   └── swaylock/
├── .zshrc
├── .zprofile
├── .tmux.conf
├── install.sh
├── push.sh
├── .gitignore
└── README.md

---

## Installation

An installation script is provided to safely apply the dotfiles on a new system.

Steps:

git clone https://github.com/Greninja44/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh

---

## What the install script does

- Creates backups of existing configuration files if they already exist
- Copies dotfiles to their correct locations:
  - ~/.config/*
  - ~/.zshrc
  - ~/.zprofile
  - ~/.tmux.conf
- Does not permanently delete any files

Backups are stored in:

~/.dotfiles-backup/<timestamp>/

After installation, restart your session or reload Hyprland to apply the changes.

---

## Updating dotfiles manually

cd ~/dotfiles
git add .
git commit -m "Update dotfiles"
git push origin main

---

## Automatic weekly updates

This repository includes a script called push.sh that automatically commits and pushes changes only when files have changed.
It can be run manually or scheduled using cron.

---

## Using the push script manually

cd ~/dotfiles
chmod +x push.sh
./push.sh

If no changes are detected, the script exits without creating a commit.

---

## Enable weekly auto-push using cron (Arch Linux)

### Requirements

sudo pacman -S cronie
sudo systemctl enable --now cronie.service

---

### Set default editor for crontab

export EDITOR=nano
echo 'export EDITOR=nano' >> ~/.zshrc
source ~/.zshrc

---

### Add the cron job

crontab -e

Add the following line:

0 18 * * 0 /usr/bin/zsh /home/batman/dotfiles/push.sh >> /home/batman/dotfiles/push.log 2>&1

Replace "batman" with your actual username.

This configuration:
- Runs every Sunday at 18:00
- Commits changes only if files changed
- Pushes updates to the main branch
- Writes logs to push.log for debugging

---

## Notes

- Machine-specific files such as crontab are intentionally not tracked
- Git authentication (SSH or HTTPS) must be configured correctly
- These dotfiles are tailored to my personal setup but can be forked or adapted

---

## License

MIT
