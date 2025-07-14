WALLPAPER_GREETING='/usr/share/backgrounds/vladstudio_celestial_cat_light_2048x1152.jpg'
WALLPAPER_DESKTOP='/usr/share/backgrounds/vladstudio_emotions_2048x1152.jpg'
echo "background=$WALLPAPER_GREETING" >> /etc/lightdm/lightdm-gtk-greeter.conf
xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorVirtual-1/workspace0/last-image -s "$WALLPAPER_DESKTOP" --create -t string
