#!/bin/sh

# update the packages
sudo pacman -Syu --noconfirm
# install the sound server
sudo pacman --needed --noconfirm -S pipewire lib32-pipewire pipewire-docs \
	wireplumber pipewire-audio pipewire-pulse pulsemixer
# install the good drivers
# amd
sudo pacman --needed --noconfirm -S xf86-video-amdgpu mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon
# install other packages
sudo pacman --needed --noconfirm -S base-devel xorg-server xorg-xinit zip unzip mpc mpd neovim git xorg-apps \ 
	firefox discord steam yt-dlp mpv ffmpeg acpilight dmenu ttf-hack-nerd ttf-meslo-nerd noto-fonts \
	noto-fonts-cjk noto-fonts-emoji picom slock xclip ncmpcpp dunst maim lf ranger clang sxiv \
	zathura zathura-pdf-mupdf p7zip hsetroot python-pywal
# create basic home folders
sudo pacman --needed --noconfirm -S xdg-user-dirs
xdg-user-dirs-update
# move config files
mv .bashrc .bash_profile .xinitrc ~
mv picom.conf ~/.config/
# move the scripts
mv *.sh ~
# init the wallpapers folder
mv Wallpapers ~
curl -o ~/Wallpapers/1.jpg 'https://pbs.twimg.com/media/F19PMQSaMAEVGjS?format=jpg&name=4096x4096'
wal -i ~/Wallpapers/1.jpg
# mpd setup
mkdir ~/.config/mpd
mv mpd.conf ~/.config/mpd
mkdir ~/.config/mpd/playlists
systemctl enable mpd --user
# rust install
sudo pacman --needed --noconfirm -S rustup
rustup default stable
# setup zsh
sudo pacman --needed --noconfirm -S zsh zsh-completions
mv .zshrc .zprofile ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
# paru setup
git clone https://aur.archlinux.org/paru.git ~/paru
cd ~/paru
makepkg -sirc --noconfirm
# neovim setup
git clone https://github.com/JADarius/kickstart.nvim.git ~/.config/nvim
# clone the dwm build
git clone https://github.com/jadarius/dwm.git ~/dwm
cd ~/dwm
rm config.h config.def.h
mv backupconf config.def.h
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
# setup ranger (lf soon?)
ranger --copy-config=all
# finish
reboot
