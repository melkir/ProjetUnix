#!/bin/bash

showMenu() {
	clear
	echo "ToolBox"
	echo "Copyright Pierre-Yves Machavoine"
	echo -e "\n[ Menu ]"
	echo "1) Informations sur le système"
	echo "2) Informations sur des fichiers et dossiers"
	echo "3) Opérations sur des fichiers et dossiers"
	echo "4) Opérations sur le système"
	echo "5) Calcul mathématiques"
	echo -ne "\nChoisir un theme (1-5 ou q pour quitter) : "
}

showMenu
while read -r; do
	case $REPLY in
		1)
			bash ./lib/system_info.sh
			;;
		2)
			bash ./lib/file_info.sh
			;;
		3)
			bash ./lib/file_operation.sh
			;;
		4)
			bash ./lib/system_operation.sh
			;;
		5)
			bash ./lib/math.sh
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
