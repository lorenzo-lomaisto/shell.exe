#!/bin/bash

# Chemin complet du fichier CSV
csv_file="/root/CSV"

# Chemin du fichier de contrôle pour suivre les modifications du fichier CSV
control_file="/root/fichier"

# Fonction pour comparer les fichiers CSV
function compare_csv_files() {
    if cmp -s "$csv_file" "$control_file"; then
        echo "Le fichier CSV n'a pas été modifié."
        exit 0
    else
        echo "Le fichier CSV a été modifié. Traitement en cours..."
        cp "$csv_file" "$control_file"
        # Écrire ici le code pour traiter les modifications du fichier CSV
        # et mettre à jour les utilisateurs en conséquence
        # Utilisez les commandes appropriées pour lire le fichier CSV
        # et créer/modifier les utilisateurs en fonction des informations

        # Vérifier si un utilisateur est un admin et lui donner le rôle de super utilisateur
        while IFS=',' read -r username role
        do
            if [ "$role" == "admin" ]; then
                usermod -aG sudo "$username"
                echo "Le rôle de super utilisateur a été attribué à $username"
            fi
        done < "$csv_file"

        echo "Traitement terminé."
        exit 0
    fi
}

# Vérifier si le fichier de contrôle existe
if [ -f "$control_file" ]; then
    # Comparer les fichiers CSV
    compare_csv_files
else
    # Copier le fichier CSV pour créer le fichier de contrôle
    cp "$csv_file" "$control_file"
    echo "Fichier de contrôle créé."
    # Traitement initial du fichier CSV
    # Écrire ici le code pour lire le fichier CSV et créer les utilisateurs
    # en utilisant les commandes appropriées

    # Vérifier si un utilisateur est un admin et lui donner le rôle de super utilisateur
    while IFS=',' read -r username role
    do
        if [ "$role" == "admin" ]; then
            usermod -aG sudo "$username"
            echo "Le rôle de super utilisateur a été attribué à $username"
        fi
    done < "$csv_file"

    echo "Traitement initial terminé."
    exit 0
fi

