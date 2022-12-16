#!/bin/bash

# BACKEND
docker-compose run mcc id
docker-compose run --rm mcc composer install
docker-compose run --rm mcc php artisan key:generate
docker-compose run --rm mcc php artisan migrate:fresh
docker-compose run --rm mcc php artisan passport:install --force
docker-compose run --rm mcc php artisan db:seed


# FRONTEND
docker-compose run --rm npm install
docker-compose run --rm npm run serve -- --port 3000
docker-compose run --rm npm run build
#rm -rf www/mcc-fe/node_modules

#KEYCLOAK IMPORT
#docker-compose exec keycloak /opt/keycloak/bin/kc.sh import --dir /var/keycloakdata



