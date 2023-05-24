#!/bin/bash

# Définition du répertoire de sauvegarde
backup_dir="Job08/Backup"

# Création du répertoire de sauvegarde s'il n'existe pas déjà
mkdir -p "$backup_dir"

# Format de la date au format jj-mm-aaaa-HH:MM
date_format=$(date +"%d-%m-%Y-%H-%M")


# Chemin complet du fichier de sortie
output_file="number_connection-$date_format"

# Extraction du nombre de connexions à partir des logs Linux
connection_count=$(grep -c 'session opened' /var/log/auth.log)

# Écriture du nombre de connexions dans le fichier de sortie
echo "$connection_count" > "$output_file"

# Archivage du fichier de sortie avec tar
tar -czf "$output_file.tar.gz" "$output_file"

# Vérifier si le fichier de sauvegarde existe déjà dans le dossier Backup
if [ -f "$backup_dir/$output_file.tar.gz" ]; then
    rm "$backup_dir/$output_file.tar.gz"
fi

# Déplacer le fichier de sauvegarde dans le dossier Backup
mv "$output_file.tar.gz" "$backup_dir/number_connection-$date_format.tar.gz"



