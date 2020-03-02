FROM wordpress:latest

# install NPM and make Composer globally acessable
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
    && apt-get install -y nodejs
    && mv composer.phar /usr/local/bin/composer