#!/bin/sh
print() {
	echo -e "\t--- Information de base ---\n"
	echo -e "Nom de l'OS\t\t:" 		$(lsb_release -d | awk -F: '{print $2}')
	echo -e "Version de linux\t:" 	$(uname -o)
	echo -e "Version du noyau\t:" 	$(uname -mrs)
	echo -e "Heure locale\t\t:"  	$(date +%Y/%m/%d', '%Hh%Mm)
	echo -e "Utilisateur courant\t: $USER"
	echo -e "Repertoire courant\t:" $(pwd)
	echo -e "Terminal utilisé\t:" 	$(tty)
	echo -e "\n\n\t--- Activité de la machine ---\n"
	w -s
	echo -e "\n\n\t--- Information disque ---\n"
	df -H
	echo -e "\n\n\t--- Information sur la mémoire ---\n"
	free -m
	echo -e "\n\n\t--- Liste des utilisateurs ---\n"
	awk -F : '$3>=1000 {print "User:", $1, "- UID:", $3}' /etc/passwd
	echo -e "\n\n\t--- Liste des processus ---\n"
	ps -e -o pid,args --forest --cols $(tput cols)
	echo -e "\n\n\t--- Table de routage ---\n"
	route
	echo -e "\n\n\t--- Port en écoute ---\n"
	netstat -l
}
print | less
