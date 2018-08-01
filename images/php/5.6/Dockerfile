FROM php:5.6
MAINTAINER Dealerdirect <opensource@dealerdirect.nl>

ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSER_HOME /root/.composer
ENV PATH $PATH:$COMPOSER_HOME/vendor/bin
ENV INSTALL_APT_BUILD_DEPS "build-essential libssl-dev libmcrypt-dev libicu-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev libsodium-dev libxml2-dev"
ENV INSTALL_APT "sudo git unzip ssh parallel rsync curl openssl ca-certificates libicu57 libmcrypt4 mysql-client libjpeg62-turbo libfreetype6 libsodium18 libbz2-dev"
ENV INSTALL_PHP_EXT "bcmath mcrypt pcntl pdo pdo_mysql intl mbstring gd bz2 exif mysqli zip opcache soap"
ENV INSTALL_PHP_PECL "xdebug-2.5.5"

ADD files/shared/ssh/* /root/.ssh/
ADD files/shared/scripts/*.sh /tmp/shared/scripts/
ADD files/php/scripts/* /tmp/php/scripts/
ADD files/debian/stretch/sources.list /etc/apt/sources.list
ADD files/php/php.ini /usr/local/etc/php/php.ini

RUN \
  bash /tmp/shared/scripts/install-upgrade-apt-packages.sh && \
  bash /tmp/shared/scripts/install-git-crypt.sh && \
  bash /tmp/php/scripts/install-extensions.sh && \
  bash /tmp/shared/scripts/install-composer.sh && \
  bash /tmp/shared/scripts/install-qa-tools.sh && \
  bash /tmp/shared/scripts/cleanup.sh && \
  sed -i -e's@curl -sO https://gordalina.github.io/cachetool/downloads/cachetool.phar@curl -so cachetool.phar https://gordalina.github.io/cachetool/downloads/cachetool-3.2.1.phar@g' /root/.composer/vendor/deployer/recipes/cachetool.php
