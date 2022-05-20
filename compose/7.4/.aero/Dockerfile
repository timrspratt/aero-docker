FROM ubuntu:21.04

ARG WWWGROUP
ARG NODE_VERSION=16

WORKDIR /var/www/html

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
    && apt-get install -y gnupg gosu curl ca-certificates zip unzip git vim supervisor cron sqlite3 libcap2-bin libpng-dev python2 nginx \
    && mkdir -p ~/.gnupg \
    && chmod 600 ~/.gnupg \
    && echo "disable-ipv6" >> ~/.gnupg/dirmngr.conf \
    && apt-key adv --homedir ~/.gnupg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x14AA40EC0831756756D7F66C4F4EA0AAE5267A6C \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu hirsute main" > /etc/apt/sources.list.d/ppa_ondrej_php.list \
    && apt-get update \
    && apt-get install -y php7.4-cli php7.4-dev php7.4-fpm \
       php7.4-pgsql php7.4-sqlite3 php7.4-gd \
       php7.4-curl php7.4-memcached \
       php7.4-imap php7.4-mysql php7.4-mbstring \
       php7.4-xml php7.4-zip php7.4-bcmath php7.4-soap \
       php7.4-intl php7.4-readline php7.4-pcov \
       php7.4-msgpack php7.4-igbinary php7.4-ldap \
       php7.4-redis \
    && php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn \
    && apt-get install -y mysql-client \
    && apt-get install -y postgresql-client \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/nginx/sites-enabled/default

RUN setcap "cap_net_bind_service=+ep" /usr/bin/php7.4

RUN groupadd --force -g $WWWGROUP user
RUN useradd -ms /bin/bash --no-user-group -g $WWWGROUP -u 1337 user
RUN echo 'export PATH="$PATH:$HOME/.composer/vendor/bin:$HOME/.config/composer/vendor/bin"' >> /home/user/.bashrc

COPY start /usr/local/bin/start
RUN chmod +x /usr/local/bin/start

ENTRYPOINT ["start"]