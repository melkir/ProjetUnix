#!bin/bash
clear
echo "exemple de fichiers possible"
ls --color
read -p "Choisir un fichier ou dossier : " file

if [ -z "$file" ]; then
	echo "VAR: file is unset or set to the empty string"
	exit 1
fi

if [ ! -e "$file" ]; then
    echo "$file n'est pas un fichier ou n'existe pas"
    exit 1
fi

print() {
	stat $file
	if [ -d $file ]; then
		echo -e "\nContenu du répertoire:"
		ls -lRa $file
	elif [ -f $file ]; then
		echo
		awk -f ./lib/file_content.awk $file
	fi
}

print | less
