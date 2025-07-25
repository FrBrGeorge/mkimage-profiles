WALLPAPER_GREETING='/usr/share/backgrounds/wallpaper_greeting_impact.png'
WALLPAPER_DESKTOP='/usr/share/backgrounds/wallpaper_skel.jpg'
echo "background=$WALLPAPER_GREETING" >> /etc/lightdm/lightdm-gtk-greeter.conf
DEFAULT='/usr/share/backgrounds/xfce/default-background'

rm -f "$DEFAULT"
ln -s "$WALLPAPER_DESKTOP" "$DEFAULT"
