#!/bin/bash

# update the packages
sudo pacman -Syu 
# install the good drivers
# amd
sudo pacman --needed -S xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon
# install other packages
sudo pacman --needed -S base-devel xorg-server xorg-xinit zip unzip mpc mpd neovim git
sudo pacman --needed -S firefox discord steam yt-dlp mpv ffmpeg acpilight dmenu ttf-hack-nerd ttf-meslo-nerd noto-fonts noto-fonts-cjk picom slock xclip ncmpcpp dunst maim lf ranger
# create basic home folders
sudo pacman --needed -S xdg-user-dirs
xdg-user-dirs-update
# move config files
mv .bashrc .bash_profile .xinitrc ~
mv picom.conf ~/.config/
# move the scripts
mv *.sh ~
# move the wallpapers
mv Wallpapers ~
# mpd setup
mkdir ~/.config/mpd
mv mpd.conf ~/.config/mpd
mkdir ~/.config/mpd/playlists
systemctl enable mpd --user
# neovim setup
git clone https://github.com/JADarius/kickstart.nvim.git ~/.config/nvim
# clone the dwm build
git clone https://github.com/jadarius/dwm.git ~/dwm
cd ~/dwm
make && sudo make install
# clone the st build
git clone https://github.com/jadarius/st.git ~/st
cd ~/st
make && sudo make install
# clone the status scripts
git clone https://github.com/jadarius/status-scripts.git ~/status-scripts
# clone dwmblocks
git clone https://github.com/jadarius/dwmblocks.git ~/dwmblocks
cd ~/dwmblocks
make && sudo make install
# finish
reboot
