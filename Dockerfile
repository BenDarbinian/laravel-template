# Using the official PHP 8.3 image with FPM support
FROM php:8.3-fpm

# Installing necessary system packages and PHP extensions
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    libzip-dev \
    && docker-php-ext-install zip pdo pdo_mysql

# Installing Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Setting the working directory inside the container
WORKDIR /var/www/ws

# Create a script to change uid/gid and start PHP-FPM
RUN printf "#!/bin/bash\n\
usermod -u \${UID} www-data\n\
chown -R \${UID:?}:\${UID:?} /var/www/ws\n\
exec \$@" > /docker-entrypoint.sh \
    && chmod +x /docker-entrypoint.sh

# Exposing port 9000 where PHP-FPM runs
EXPOSE 9000

# Starting PHP-FPM through the entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["php-fpm"]
