# Usar la imagen base de PHP
FROM php:8.1-apache


# Exponer el puerto 81
EXPOSE 80

# Copiar el código de la aplicación
COPY ./ /var/www/html/

# Establecer los permisos correctos para el directorio de la aplicación
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

