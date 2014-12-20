showMenu() {
	clear
	echo "--- Operation sur des fichiers ou dossiers ---"
	echo "1) Effectuer un backup d'un fichier ou dossier"
	echo "2) Archiver un fichier ou dossier"
	echo -e "\n--- Operation sur des fichiers texte ---"
	echo "3) Chiffrer (algorithme de Caesar, decalage de 3)"
	echo "4) Comparer le contenu de 2 fichiers"
	echo "5) Rechercher un terme"
	echo "6) Supprimer les lignes blanches"
	echo "7) Supprimer un terme"
	echo "8) Remplacer un terme"
	echo -ne "\nChoisir une action (1-8 ou q pour quitter) : "
}

showMenu
while read -r; do
	clear
	case $REPLY in
		1)
			echo "Exemple:"
			ls --color
			read -p "Choisir un fichier ou dossier: " file
			bash ./lib/backup.sh $file
			;;
		2)
			echo "Exemple:"
			ls --color
			read -p "Choisir un fichier ou dossier: " file
			bash ./lib/compress.sh $file
			;;
		3)
			echo "Exemple:"
			ls --color
			read -p "Choisir un fichier texte: " file
			sed 'y/abcdefghijklmnopqrstuvwxyz/defghijklmnopqrstuvwxyzabc/' $file | less
			;;
		4)
			echo "Exemple:"
			ls --color
			read -p "Choisir deux fichiers: " file1 file2
			diff $file1 $file2 | less
			;;
		5)
			echo "Exemple:"
			ls --color
			read -p "Choisir un fichier: " file
			read -p "Choisir un terme: " terme
			grep $terme $file
			;;
		6)
			echo "Exemple:"
			ls --color
			read -p "Choisir un fichier: " file
			sed '/^$/d' $file | less
			;;
		7)
			echo "Exemple:"
			ls --color
			read -p "Choisir un fichier: " file
			read -p "Choisir un terme: " terme
			sed "/$terme/d" $file | less
			;;
		8)
			echo "Exemple:"
			ls --color
			read -p "Choisir un fichier: " file
			read -p "Recherche: " terme
			read -p "Remplace par: " replace
			sed "s/$terme/$replace/g" $file | less
			;;
		q)
			clear
			break
			;;
		*)
			echo "Bad argument"
	esac
	showMenu
done
