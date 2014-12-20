# Usage : awk -f info.awk $1
BEGIN {
	FS="' '+|','+|';'+|':'+|'?'+|'!'+|'.'+";
}
{
	#lines++ # optionnel car NR contient le nombre de ligne a la fin du traitement
	chars += length($0) + 1
	words += NF
}
END {
	print "Le fichier contient : " words " mots, " NR " lignes, " chars " charactères."
}
