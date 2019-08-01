#!/bin/bash

docker-compose down

if [[ -f "../data" ]]; then
    read -r -p "Wipe data ? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        rm ../data -rf
    fi
else
    mkdir ../data
fi

if [[ -f "../db" ]]; then
    read -r -p "Wipe db ? [y/N] " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
    then
        rm ../db -rf
    fi
else
    mkdir ../db
fi

docker-compose up -d
if [[ -z "$(ls -A ../data)" ]]; then
   docker-compose exec web bash -c "cd /var/www/html && composer create-project flarum/flarum . --stability=beta && chmod 777 . -R"
fi

cp ./install_requirements.sh ../data/ && chmod +x ../data/install_requirements.sh
docker-compose exec web bash -c "cd /var/www/html && ./install_requirements.sh"

