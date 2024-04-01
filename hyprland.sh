#!/bin/bash

# Install the Hypr apps
sudo pacman -S --needed --noconfirm hyprland hyprpaper hypridle hyprlock xdg-desktop-portal-hyprland

# Install other apps
sudo pacman -S --needed --noconfirm waybar polkit-kde-agent qt5-wayland qt6-wayland wofi cliphist kitty thunar grim slurp spotify-launcher bottom

sudo pacman -S --needed --noconfirm sddm
sudo systemctl enbale sddm

git clone https://github.com/jadarius/arch-configs 
mv arch-configs/* ~/.config/
