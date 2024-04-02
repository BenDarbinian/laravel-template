# Использование официального образа PHP 8.0 с поддержкой FPM
FROM php:8.3-fpm

# Установка основных расширений PHP, необходимых для Laravel
RUN docker-php-ext-install pdo pdo_mysql

# Получение последней версии Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Установка рабочего каталога внутри контейнера
WORKDIR /var/www

# Копирование приложения в контейнер
COPY . /var/www/

# Установка зависимостей с помощью Composer
RUN composer install --no-dev --optimize-autoloader --no-interaction --no-ansi --no-scripts

# Выставление прав на каталоги для Laravel
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Экспонирование порта 9000, на котором работает PHP-FPM
EXPOSE 9000

# Запуск PHP-FPM
CMD ["php-fpm"]
