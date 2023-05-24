#!/bin/bash

if [ "$2" == "+" ]; then
    result=$(($1 + $3))
elif [ "$2" == "-" ]; then
    result=$(($1 - $3))
elif [ "$2" == "x" ]; then
    result=$(($1 * $3))
elif [ "$2" == "÷" ]; then
    result=$(($1 / $3))
else
    echo "Opération invalide"
    exit 1
fi

echo "Résultat : $result"
