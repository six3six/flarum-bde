#!/bin/bash
rm ../data
rm ../db
mkdir ../data
mkdir ../db

docker-compose up -d
docker-compose exec web bash -c "cd /var/www/html && composer create-project flarum/flarum . --stability=beta && chmod 777 . -R"
cp ./install_requirements.sh ../data/
docker-compose exec web bash -c "cd /var/www/html && ./install_requirements.sh"

