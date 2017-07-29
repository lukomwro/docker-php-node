FROM php:7.1.7-cli

RUN apt-get update \
    && apt-get install -y \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libpng12-dev \
      libpng-dev \
      libjpeg-dev \
      libmemcached-dev \
      libmcrypt-dev\
      libxml2-dev \
      libpcre3-dev \
      curl \
      git \
      vim \
      nano \
      bzip2 \
      ssmtp \
      mc \
      sudo \
      silversearcher-ag \
      apt-utils \
    && apt-get clean

RUN pecl install \
    igbinary \
    oauth \
    redis

RUN docker-php-ext-enable \
    igbinary \
    redis \
    oauth

RUN docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
    mcrypt \
    mysqli \
    pdo \
    pdo_mysql \
    gd \
    xml \
    mbstring \
    soap \
    xmlrpc \
    opcache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs