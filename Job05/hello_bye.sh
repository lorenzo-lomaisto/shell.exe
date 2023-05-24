#!/bin/bash

# Vérification du nombre d'arguments
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <argument>"
  exit 1
fi

# Récupération de l'argument
argument=$1

# Vérification de la valeur de l'argument et affichage du message correspondant
if [ "$argument" = "Hello" ]; then
  echo "Bonjour, je suis un script !"
elif [ "$argument" = "Bye" ]; then
  echo "Au revoir et bonne journée."
else
  echo "Argument invalide. Utilisez 'Hello' ou 'Bye'."
fi

