WALLPAPER_DESKTOP='/usr/share/backgrounds/xfce/xfce-leaves.svg'
DEFAULT='/usr/share/backgrounds/xfce/default-background'

rm -f "$DEFAULT"
ln -s "$WALLPAPER_DESKTOP" "$DEFAULT"
