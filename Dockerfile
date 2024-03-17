# Set the base image for subsequent instructions
FROM alpine:3.18.5

# Installing bash
RUN apk add bash
RUN sed -i 's/bin\/ash/bin\/bash/g' /etc/passwd

# Install PHP extensions and dependencies
RUN apk add --no-cache php82 \
    php82-ctype \
    php82-dom \
    php82-fileinfo \
    php82-openssl \
    php82-mbstring \
    php82-pdo \
    php82-pdo_mysql \
    php82-session \
    php82-tokenizer \
    php82-xml\
    php82-xmlwriter \
    php82-curl \
    php82-phar \
    php82-sqlite3 \
    php82-pdo_sqlite
RUN ln -sf /usr/bin/php82 /usr/bin/php

# Installing composer
RUN apk add curl
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# working directory
WORKDIR /home

## Install laravel
RUN composer create-project laravel/laravel:^11.0 belajar-laravel

# Running artisan serve
WORKDIR /home/belajar-laravel
RUN composer install
EXPOSE 8000
CMD php artisan serve --host=0.0.0.0 --port=8000
