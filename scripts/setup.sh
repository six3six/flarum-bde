#!/bin/bash

mkdir ../data
mkdir ../db

docker-compose up -d
if [[ -z "$(ls -A ../data)" ]]; then
   docker-compose exec web bash -c "cd /var/www/html && composer create-project flarum/flarum . --stability=beta && chmod 777 . -R"
fi

cp ./install_requirements.sh ../data/
chmod +x ../data/install_requirements.sh
docker-compose exec web bash -c "cd /var/www/html && ./install_requirements.sh"

