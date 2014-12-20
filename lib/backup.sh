#!/bin/sh
# backup.sh

if [ -z "$1" ]; then
	echo "VAR: file is unset or set to the empty string"
	exit
fi

while [ ! -f "$1" ] && [ ! -d "$1" ]; do
	echo "Erreur: $1 doit être un dossier ou fichier"
	read -p "Selectionner un fichier ou dossier : " file
done

if [ -f "$1" ]; then
	cp "$1" "$1".bak
	ls "$1".bak | less
elif [ -d "$1" ]; then
	for file in "$1"/*; do cp "$file" "$file".bak; done
	ls "$1"/*.bak | less
fi

