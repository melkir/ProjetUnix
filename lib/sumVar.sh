#!/bin/sh
# math2.sh

Usage(){
    echo "Usage : $0 <arg1><arg2>...<argn>" 1>&2
    exit 1
}

if (( $# == 0 )); then Usage; fi

som=0
for i in $*; do ((som+=$i)); done

echo "Somme : " $som
echo "Valeur moyenne :" $(( $som/$# ))
