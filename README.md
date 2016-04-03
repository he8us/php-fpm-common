# php-fpm-common

Base php configuration. Meant to be extended like in my images [php-fpm-prod](https://hub.docker.com/r/he8us/php-fpm-prod/) and [php-fpm-dev](https://hub.docker.com/r/he8us/php-fpm-dev/)

## How to use this image

This image can be used as-is.

It runs PHP 5.6-fpm with pdo_mysql, intl, mbstring, mcrypt and bcmath. The base command to run it is:

    docker run --name php -d -p 9000:9000 he8us/php-fpm-common

It can be configured using environment variables:
 
 * `TIMEZONE` Default: `Europe\Brussels`

And there's my docker-compose sample:

    php:
        image: he8us/php-fpm-common
        expose:
            - 9000
        environment:
            APPLICATION_ENV: dev
            TIMEZONE: "Europe/Brussels"
    
        volumes_from:
            - application
