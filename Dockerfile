FROM php:5.6-fpm-alpine

WORKDIR /var/www

RUN apk update && apk add \
    build-base \ 
    vim

RUN set -ex \
  && apk --no-cache add \
    postgresql-dev

RUN docker-php-ext-install pdo pdo_pgsql

# RUN docker-php-ext-install pdo_mysql
# Install Magerun

RUN wget https://files.magerun.net/n98-magerun.phar --no-check-certificate \
    && chmod +x ./n98-magerun.phar \
    && mv ./n98-magerun.phar /usr/local/bin/


# Install Modman

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer


RUN addgroup -g 1000 -S www && \
    adduser -u 1000 -S www -G www

USER www

COPY --chown=www:www . /var/www

# COPY ./angular /var/www/angular

EXPOSE 9000 