#!/bin/bash
BACKUP_DIR="$HOME/NET"
LIST_FILE="$HOME/.save_files"

DEFAULT_FILES=(
    "$HOME/.bashrc"
    "$HOME/.bash_profile"
    "$HOME/.xprofile"
    "$HOME/.profile"
    "$HOME/.ssh/"
    "$HOME/.gnupg/"
    "$HOME/.gitconfig"
    LIST_FILE
)

if [ -f "$LIST_FILE" ]; then
    mapfile -t FILES_TO_BACKUP < "$LIST_FILE"
else
    FILES_TO_BACKUP=("${DEFAULT_FILES[@]}")
fi

for item in "${FILES_TO_BACKUP[@]}"; do
    if [ -e "$item" ]; then
            cp -a "$item" "$BACKUP_DIR/"
    fi
done

echo "Backup of $USER completed at $(date)" >> "$BACKUP_DIR/backup.log"
exit 0
