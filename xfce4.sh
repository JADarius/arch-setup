#/bin/sh

sudo pacman -S --needed --noconfirm xfce4 xfce4-goodies gvfs
sed -i '/wal -R/d; /picom &/d; /dwmblocks/d' .xinitrc
echo "Do you want to use a display manager? [y/n]"
read DISPLAY_MANAGER
if [[ $DISPLAY_MANAGER == "y" ]]; then
	sudo pacman -S --needed --noconfirm sddm
	sudo systemctl enable sddm
	sed -i '/exec dwm/d' .xinitrc
else
	sed -i 's/exec dwm/exec startxfce4/g' .xinitrc
fi
cp .xinitrc ~
