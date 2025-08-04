#!/bin/bash

DOC_PATH="/usr/share/doc/FEATURES"
OUTPUT_FILE="$DOC_PATH/README.md"
SEPARATOR="--------------"

echo -e "\t== README ==

*Содержит краткое описание фич данного дистрибутива и руководство к ним* \n\n" > "$OUTPUT_FILE"

COUNTER=0
for file in $DOC_PATH/*.md; do
	if [[ "$file" == "$OUTPUT_FILE" ]]; then
		continue
	fi
	COUNTER=$((COUNTER + 1))
	echo -e "\n\n## $SEPARATOR Документ №$COUNTER: $file $SEPARATOR ##\n" >> "$OUTPUT_FILE"
	cat "$file" >> "$OUTPUT_FILE"
done

echo -e "\n## $SEPARATOR Конец $SEPARATOR ##" >> "$OUTPUT_FILE"
