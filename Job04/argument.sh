#!/bin/bash

# Vérification du nombre d'arguments
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <nom_fichier_destination> <fichier_source>"
  exit 1
fi

# Récupération des arguments
nom_fichier_destination=$1
fichier_source=$2

# Création du fichier de destination et remplissage à partir du fichier source
cat "$fichier_source" > "$nom_fichier_destination"

# Affichage d'un message de confirmation
echo "Le fichier $nom_fichier_destination a été créé à partir du fichier $fichier_source."


