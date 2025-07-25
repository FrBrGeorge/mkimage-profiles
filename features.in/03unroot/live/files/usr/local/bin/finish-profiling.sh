#!/bin/bash
BACKUP_DIR="$HOME/NET/.BACKUP"
LIST_FILE="$HOME/NET/.save_file"

echo '' > "$LIST_FILE"
find $HOME -type l -maxdepth 1 | grep NET | while read -r link; do
	echo "$(basename "$link")" >> "$LIST_FILE"
done

exit 0
