FROM php:7.0-fpm

MAINTAINER Cedric Michaux <cedric@he8us.be>

ENV PHP_PORT 9000

EXPOSE $PHP_PORT

COPY entrypoint.sh /app/entrypoint.sh
COPY confd/ /etc/confd

ENV CONFD_VERSION 0.11.0

RUN \
    curl -L -o /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 && \
    chmod +x /usr/local/bin/confd


RUN \
    apt-get update -qq && \
    apt-get install -yqq \
      --no-install-recommends \
        icu-devtools \
        libicu-dev \
        libmcrypt-dev \
        libmagickwand-dev \
        mysql-client \
        zlib1g-dev \
        unzip \
        libjpeg62-turbo-dev \
        libpng12-dev \
        libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install \
        pdo_mysql \
        exif \
        intl \
        mbstring \
        mcrypt \
        bcmath \
        gd \
        zip


RUN pecl install imagick \
    && docker-php-ext-enable imagick


RUN pecl install apcu \
    && docker-php-ext-enable apcu

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["php-fpm"]
