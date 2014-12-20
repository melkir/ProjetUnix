showMenu() {
	clear
	echo "1. Calcul de factoriel"
	echo "2. Calcul des puissances de 2"
	echo "3. Calcul d'une somme et de sa variance"
	echo -ne "\nChoisir une action (1-3 ou q pour quitter) : "
}

showMenu
while read -r; do
	case $REPLY in
		1)
			read -p "Entrer un nombre : " nb
			bash ./lib/factorial.sh $nb | less
			;;
		2)
			read -p "Entrer un nombre : " nb
			bash ./lib/pow.sh $nb | less
			;;
		3)
			read -p "Entrer 3 nombres : " nb1 nb2 nb3
			bash ./lib/sumVar.sh $nb1 $nb2 $nb3 | less
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
