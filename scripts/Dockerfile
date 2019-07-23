FROM php:7.2-apache

# Setup environement
RUN apt-get update
RUN apt-get install -y libxml2-dev libpng-dev curl libcurl4 libcurl4-gnutls-dev unzip
RUN docker-php-ext-install gd pdo_mysql tokenizer curl zip

# Install composer
RUN mkdir /root/script
WORKDIR /root/script
ADD install_composer.sh ./
RUN ./install_composer.sh

# Install flarum
WORKDIR /var/www/html
RUN composer create-project flarum/flarum . --stability=beta
RUN php --ini
RUN chown www-data . -R

# Setup apache
RUN rm /etc/apache2/sites-available/*
RUN rm /etc/apache2/sites-enabled/*
ADD flarum.conf /etc/apache2/sites-available/
RUN a2ensite flarum
RUN a2enmod rewrite
RUN service apache2 restart

VOLUME /var/www/html
EXPOSE 80