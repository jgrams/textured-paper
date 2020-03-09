FROM wordpress:latest
	COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
    RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
    RUN apt-get install -y nodejs
    WORKDIR /var/www/html/wp-content/themes/wprig-texturedpaper/ 
    COPY wprig-texturedpaper/package.json .
    COPY wprig-texturedpaper/composer.json .
    RUN npm install
    RUN composer install
    RUN npm install --global gulp-cli
    RUN npm update
    RUN composer update
    RUN npm run dev
    WORKDIR /var/www/html/