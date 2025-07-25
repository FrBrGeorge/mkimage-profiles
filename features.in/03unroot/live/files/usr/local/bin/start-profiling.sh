#!/bin/bash
BACKUP_DIR="$HOME/NET/.BACKUP"

DEFAULT_FILES=(
	".vimrc"
	".ssh/"
	".gitconfig"
)

for file in "${DEFAULT_FILES[@]}"; do
	if [ ! -e "$BACKUP_DIR/$file" ]; then
		if [ "$file" == ".ssh/" ]; then
			mkdir -p "$BACKUP_DIR/$file"
			chmod 700 "$BACKUP_DIR/$file"
		else
			touch "$BACKUP_DIR/$file"
		fi
	fi
done

find "$BACKUP_DIR" -maxdepth 1 | while read -r item; do
	file=$(basename $item)
	if [ -d "$item" ]; then
		rm -rf "$HOME/$file"
		ln -s "$item" "$HOME"
	fi
	if [ -f "$item" ]; then
		rm -rf "$HOME/$file"
		ln -s "$item" "$HOME/$file"
		echo "dir $item $file"
	fi
done
exit 0
