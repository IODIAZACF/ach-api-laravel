FROM php:7.3-fpm

# Copy composer.lock and composer.json composer.lock
COPY composer.json /var/www/

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    libzip-dev\
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    lsb-release \
    libncurses5 \
    gnupg \
    gnupg2 \
    gnupg1 \
    wget \ 
    postgresql \
    postgresql-contrib \
    php-zip \
    php7.3-mbstring

    
RUN apt-get install -y firebird-dev && \
    docker-php-ext-install pdo_firebird && \
    docker-php-ext-enable pdo_firebird

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*


# Install extensions
RUN docker-php-ext-install pdo_firebird mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN alias composer='php composer.phar'

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Install firebird
RUN curl -L https://sourceforge.net/projects/firebird/files/firebird-linux-amd64/2.5.2-Release/FirebirdSS-2.5.2.26540-0.amd64.tar.gz/download | tar -zxC /tmp
#RUN /tmp/FIREBIRD_folder/
#fuente: https://sourceforge.net/projects/firebird/files/firebird-linux-amd64/2.5.2-Release/
#https://ib-aid.com/en/articles/how-to-install-firebird-3-0-and-4-0-on-linux
RUN /tmp/FirebirdSS-2.5.2.26540-0.amd64/install.sh

# Copy existing application directory contents
COPY . /var/www

# Copy existing application directory permissions
COPY --chown=www:www . /var/www

# Change current user to www
USER www

# postgresql pemissions
COPY --chown=www:www . /var/www


#RUN mkdir -p "$PGDATA"
#	mkdir -p "$PGDATA"
#	chown -R postgres "$PGDATA"
#	chmod 700 "$PGDATA"

#	mkdir -p /var/run/postgresql
#	chown -R postgres /var/run/postgresql
#	chmod 775 /var/run/postgresql

# edit php ini 

#RUN { \
#  echo 'upload_max_filesize = 100M';\
#  echo 'post_max_size = 108M';\
#  echo 'short_open_tag = On';\
#  echo 'fastcgi.logging = 1';\
#  echo 'opcache.enable=1';\
#  echo 'opcache.optimization_level=0x7FFFBBFF';\
#  echo 'opcache.revalidate_freq=0';\
#  echo 'opcache.validate_timestamps=1';\
#  echo 'opcache.memory_consumption=128';\
#  echo 'opcache.interned_strings_buffer=8';\
#  echo 'opcache.max_accelerated_files=4000';\
#  echo 'opcache.revalidate_freq=60';\
#  echo 'opcache.fast_shutdown=1';\
#  echo 'xdebug.remote_enable=1';\
#  echo 'extension=php_pdo_firebird.dll';\
#  echo 'extension=pdo_firebird';\
#  echo 'extension=pdo_firebird.so';\
#} > /usr/local/etc/php/conf.d/local.ini

#falta editar en las lineas de 
#http{...
#    client_max_body_size 20M; 
#    server_names_hash_bucket_size 64;

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]