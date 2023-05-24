#!/bin/bash

# Vérifier les privilèges de superutilisateur
if [[ $(id -u) -ne 0 ]]; then
    echo "Ce script doit être exécuté en tant que superutilisateur."
    exit 1
fi

# Mettre à jour le gestionnaire de paquets
apt-get update && apt-get upgrade -y

# Vérifier si la mise à jour a réussi
if [[ $? -eq 0 ]]; then
    echo "La mise à jour du gestionnaire de paquets a été effectuée avec succès."
else
    echo "Une erreur s'est produite lors de la mise à jour du gestionnaire de paquets."
fi
