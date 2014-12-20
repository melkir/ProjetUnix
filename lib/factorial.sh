#!/bin/sh
# factorial.sh

# Verification du nombre d'arguments
[ $# -ne 1 ] && { echo "Usage: $0 <number>"; exit 1; }

counter=$1 #first argument
factorial=1
while [ $counter -gt 0 ] #while counter > 0
do
   factorial=$(( $factorial * $counter ))
   counter=$(( $counter - 1 ))
done

echo "factorial($1) = $factorial"
