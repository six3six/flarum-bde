#!/bin/bash

cd /var/www/html || exit

composer require milescellar/lang-french
composer require flagrow/bazaar
composer require flagrow/linguist
composer require flagrow/users-list
composer require ffrunkey/contact
composer require datitisev/flarum-ext-dashboard