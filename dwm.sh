#/bin/sh

# move the scripts
mv *.sh ~
# init the wallpapers folder
mv Wallpapers ~
echo "Do you want an anime wallpaper? [y/n]"
read ANIME
if [[ $ANIME == "y" ]]; then
	curl -o ~/Wallpapers/1.jpg 'https://pbs.twimg.com/media/F19PMQSaMAEVGjS?format=jpg&name=4096x4096'
else
	curl -o ~/Wallpapers/1.jpg 'https://cdn.pixabay.com/photo/2024/03/06/09/32/liverworts-8616125_960_720.jpg'
fi
wal -i ~/Wallpapers/1.jpg
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
# setup ranger (lf soon?)
ranger --copy-config=all
