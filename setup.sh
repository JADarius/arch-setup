#!/bin/sh

# update the packages
sudo pacman -Syu --noconfirm
# install the sound server
sudo pacman -S --needed --noconfirm - < audio.txt
# install the good drivers
# amd
sudo pacman -S --needed --noconfirm - < amd.txt
# install other packages
sudo pacman -S --needed --noconfirm - < pkglist.txt
# create basic home folders
sudo pacman --needed --noconfirm -S xdg-user-dirs
xdg-user-dirs-update
# turn on NTP
sudo timedatectl set-ntp true
# move config files
mv .bashrc .bash_profile ~
mv picom.conf ~/.config/
# mpd setup
mkdir ~/.config/mpd
mv mpd.conf ~/.config/mpd
mkdir ~/.config/mpd/playlists
systemctl enable mpd --user
# rust install
sudo pacman --needed --noconfirm -S rustup
rustup default stable
# setup zsh
echo "Do you want to install zsh? [y/n]"
read ZSH
if [[ $ZSH == "y" ]]; then
	sudo pacman --needed --noconfirm -S zsh zsh-completions
	mv .zshrc .zprofile ~
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
	echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
fi
# paru setup
git clone https://aur.archlinux.org/paru.git ~/paru
cd ~/paru
makepkg -sirc --noconfirm
# neovim setup
git clone https://github.com/nvim-lua/kickstart.nvim.git ~/.config/nvim
echo "What window manager/desktop environment do you want?"
echo "Possible options: dwm, xfce4"
read GUI
if [[ $GUI == "dwm" ]]; then
	./dwm.sh
elif [[ $GUI == "xfce4" ]]; then
	./xfce4.sh
elif [[ $GUI == "hyprland" ]]; then
	./hyprland.sh
fi
# finish
cd ~
rm -rf arch-setup
reboot
