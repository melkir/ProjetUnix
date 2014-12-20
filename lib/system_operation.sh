showMenu() {
	clear
	echo "1. Eteindre"
	echo "2. Redemarrer"
	echo "3. Passer en mode root"
	echo "4. Ajouter un utilisateur"
	echo "5. Supprimer un utilisateur"
	echo "6. Ajouter un groupe"
	echo "7. Supprimer un groupe"
	echo -ne "\nChoisir une action (1-7 ou q pour quitter) : "
}

showMenu
while read -r; do
	clear
	case $REPLY in
		1)
			halt -p
			;;
		2)
			reboot
			;;
		3)
			echo "Après vous être connecté en tant que root taper exit pour revenir en mode normal"
			su
			;;
		4)
			read -p "Choisir un nom d'utilisateur: " name
			useradd $name
			;;
		5)
			cat /etc/passwd
			read -p "Choisir le nom d'utilisateur a supprimer: " name
			userdel $name
			;;
		6)
			read -p "Choisir un nom de groupe: " name
			groupadd $name
			;;
		7)
			cat /etc/group
			read -p "Choisir le nom du groupe a supprimer: " name
			groupdel $name
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
