#!/bin/bash
set -e

# Appliquer les migrationssss
echo "Appliquer les migrations..."
python manage.py makemigrations
python manage.py migrate
# create default user
python manage.py create_default_admin
python manage.py create_default_client
python manage.py create_default_prestataire
python manage.py create_default_support
python manage.py add_vehicule_equipments

# vehicule data
python manage.py seed_vehicule_data


# Démarrer le serveur Django
echo "Démarrer le serveur Django..."
exec "$@"
