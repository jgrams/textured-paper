FROM php:latest
	WORKDIR /var/www/html/
	COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
	RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
	RUN apt-get install -y nodejs 
	COPY wprig-texturedpaper/ .
	RUN npm install
	RUN composer install 
	CMD ["npm", "run", "dev"]