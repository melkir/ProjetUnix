#!/bin/sh
# pow.sh

Usage() {
	echo "Usage: $0 <puissance>"
	exit 1
}

if [ $# -ne 1 ]; then Usage; fi

res=1
# Calcul de la valeur res = 2^n
for (( i = 0; i < $1; ++i )); do ((res*=2)); done

echo "2^$1=" $res
