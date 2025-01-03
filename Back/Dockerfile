# Usar la imagen base de PHP
FROM php:8.1-apache

# Instalar extensiones necesarias
RUN docker-php-ext-install pdo pdo_mysql

# Crear el directorio donde se almacenarán los archivos estáticos
WORKDIR ./ /var/www/html

# Establecer permisos
# Garantiza que Apache tenga acceso a los archivos dentro del contenedor
# RUN chown -R www-data:www-data /var/www/html        
