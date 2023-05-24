#!/bin/bash

# Vérifier que deux arguments ont été fournis
if [ $# -ne 2 ]; then
  echo "Usage: ./add.sh <nombre1> <nombre2>"
  exit 1
fi

# Récupérer les deux nombres en tant qu'arguments
nombre1=$1
nombre2=$2

# Effectuer l'addition
resultat=$((nombre1 + nombre2))

# Afficher le résultat
echo "Le résultat de l'addition de $nombre1 et $nombre2 est : $resultat"
