FROM php:5.4
MAINTAINER Dealerdirect <opensource@dealerdirect.nl>

ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSER_HOME /root/.composer
ENV PATH $PATH:$COMPOSER_HOME/vendor/bin
ENV INSTALL_APT_BUILD_DEPS "build-essential libssl-dev libmcrypt-dev libicu-dev"
ENV INSTALL_APT "sudo git unzip ssh parallel rsync curl openssl ca-certificates libicu52 libmcrypt4 mysql-client"
ENV INSTALL_PHP_EXT "bcmath mcrypt pcntl pdo pdo_mysql intl mbstring"

ADD files/shared/ssh/* /root/.ssh/
ADD files/shared/scripts/*.sh /tmp/shared/scripts/
ADD files/php/scripts/* /tmp/php/scripts/
ADD files/debian/jessie/sources.list /etc/apt/sources.list
ADD files/php/php.ini /usr/local/etc/php/php.ini

RUN \
  bash /tmp/shared/scripts/install-upgrade-apt-packages.sh && \
  bash /tmp/shared/scripts/install-git-crypt.sh && \
  bash /tmp/php/scripts/install-extensions.sh && \
  bash /tmp/shared/scripts/install-composer.sh && \
  bash /tmp/shared/scripts/cleanup.sh
