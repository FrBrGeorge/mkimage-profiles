WALLPAPER_GREETING='/usr/share/backgrounds/xfce/xfce-cp-dark.svg'
WALLPAPER_DESKTOP='/usr/share/backgrounds/xfce/xfce-leaves.svg'
echo "background=$WALLPAPER_GREETING" >> /etc/lightdm/lightdm-gtk-greeter.conf
DEFAULT='/usr/share/backgrounds/xfce/default-background'

rm -f "$DEFAULT"
ln -s "$WALLPAPER_DESKTOP" "$DEFAULT"
