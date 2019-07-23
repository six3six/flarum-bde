mkdir ../data
mkdir ../db

docker-compose up -d
docker-compose exec web bash -c "cd /var/www/html && composer create-project flarum/flarum . --stability=beta && chmod 777 . -R"
docker-compose exec web bash -c "cd /var/www/html && composer require milescellar/lang-french"

