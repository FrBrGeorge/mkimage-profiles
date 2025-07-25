#!/bin/bash
BACKUP_DIR="$HOME/NET/.BACKUP"
LIST_FILE="$HOME/NET/.BACKUP/.save_file"

DEFAULT_FILES=(
    ".bashrc"
    ".bash_profile"
    ".xprofile"
    ".profile"
    ".ssh/"
    ".gitconfig"
)

if [ -f "$LIST_FILE" ]; then
    mapfile -t FILES_TO_BACKUP < "$LIST_FILE"
else
    FILES_TO_BACKUP=("${DEFAULT_FILES[@]}")
fi

for item in "${FILES_TO_BACKUP[@]}"; do
    TARGET_PATH="$BACKUP_DIR/$item"
    if [[ "$item" == */ ]]; then
	    if [ ! -d "$TARGET_PATH" ]; then
	    	mkdir -p "$TARGET_PATH"
		if [ "$item" == ".ssh/" ]; then
			chmod 700 "$TARGET_PATH"
		fi
	    fi
    	    rm -rf "$HOME/$item"
    	    ln -s "$TARGET_PATH" "$HOME"
    else
	    mkdir -p "$(dirname "$")"
	    if [ ! -f "$TARGET_PATH" ]; then
	    	cp -a "/etc/skel/$item" "$TARGET_PATH"
	    fi
    	    rm -rf "$HOME/$item"
       	    ln -s "$TARGET_PATH" "$HOME/$item"
    fi
done

exit 0
