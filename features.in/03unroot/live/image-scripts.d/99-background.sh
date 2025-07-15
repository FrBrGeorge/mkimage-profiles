WALLPAPER_GREETING='/usr/share/backgrounds/vladstudio_celestial_cat_light_2048x1152.jpg'
WALLPAPER_DESKTOP='/usr/share/backgrounds/vladstudio_emotions_2048x1152.jpg'
echo "background=$WALLPAPER_GREETING" >> /etc/lightdm/lightdm-gtk-greeter.conf
DEFAULT='/usr/share/backgrounds/xfce/default-background'

rm -f "$DEFAULT"
ln -s "$WALLPAPER_DESKTOP" "$DEFAULT"
