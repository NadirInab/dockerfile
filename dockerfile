
FROM php:7.4-apache


RUN apt-get update \
    && apt-get install -y \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql


WORKDIR /var/www/html


COPY . /var/www/html/

RUN a2enmod rewrite


EXPOSE 80

CMD ["apache2-foreground"]
