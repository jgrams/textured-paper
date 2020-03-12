FROM node:latest
    WORKDIR /usr/src/service
	COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
    COPY wprig-texturedpaper/ .