#!/bin/bash
BACKUP_DIR="$HOME/NET/.BACKUP"

DEFAULT_FILES=(
	".vimrc"
	".ssh/"
	".gitconfig"
)

# Создаём дефолтные файлы, если их нет, выставляем папке .ssh необходимые права
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

# заменяем файлы из домашней директории на ссылки на соответствующие файлы из $BACKUP_DIR
find $BACKUP_DIR -readable \( \! -perm /4 -printf '%P\n' -prune -o -type f,l -printf '%P\n' \) | while read -r item; do
	mkdir -p "$HOME/$(dirname $item)"
	rm -rf "$HOME/$item"
	ln -s "$BACKUP_DIR/$item" "$HOME/$item"
done
exit 0
