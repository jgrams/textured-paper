FROM wordpress:latest
	WORKDIR /var/www/html/wp-content/themes/wprig/
	COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
	RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
	RUN apt-get install -y nodejs 
	COPY wprig/ .
	RUN npm install
	RUN composer install 
	WORKDIR /var/www/html 
	CMD ["apache2-foreground"]