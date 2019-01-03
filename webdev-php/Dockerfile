FROM debian:9-slim

WORKDIR /opt/project

# install basics
RUN groupadd --gid 1000 owl \
    && useradd --uid 1000 --gid owl --shell /bin/bash --create-home owl \
    && apt-get -qq update && apt-get install -qqy --no-install-recommends \
    ca-certificates curl unzip nano

# install Nodejs
RUN apt-get install -y gnupg \
    && curl -sL https://deb.nodesource.com/setup_11.x | bash && apt-get install -y nodejs

# install nginx and php
ENV PHP_VERSION='7.2'
RUN curl -sL https://packages.sury.org/php/apt.gpg | apt-key add - \
    && echo "deb https://packages.sury.org/php/ stretch main" | tee /etc/apt/sources.list.d/php.list \
    && apt-get update \
    && apt-get install -y \
    nginx \
    php$PHP_VERSION-dev php$PHP_VERSION-fpm php$PHP_VERSION-mysql php$PHP_VERSION-mbstring php$PHP_VERSION-curl php$PHP_VERSION-xml php$PHP_VERSION-zip \
    php-xdebug \
    && mkdir -p /run/php-fpm && touch /run/php-fpm/php-fpm.sock && chown www-data:www-data /run/php-fpm/php-fpm.sock \
    && curl -sL https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer \
    && mkdir /var/www/.composer && chown owl:owl /var/www/.composer && chmod 750 /var/www/.composer \
    && sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/$PHP_VERSION/fpm/php.ini \
    && sed -i 's/error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php/$PHP_VERSION/fpm/php.ini \
    && sed -i 's/display_errors = Off/display_errors = On/' /etc/php/$PHP_VERSION/fpm/php.ini \
    && sed -i 's/listen = \/run\/php\/php7.2-fpm.sock/listen = \/run\/php-fpm\/php-fpm.sock/' /etc/php/$PHP_VERSION/fpm/pool.d/www.conf

# clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ln -sf /dev/stdout /var/log/nginx/default_access.log \
    && ln -sf /dev/stderr /var/log/nginx/default_error.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && ln -sf /dev/stderr /var/log/php${PHP_VERSION}-fpm.log

CMD chown 1000:1000 -R /opt/project/ \
    && service php$PHP_VERSION-fpm start \
    && nginx -g "daemon off;"
