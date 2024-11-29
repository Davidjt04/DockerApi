# Usar la imagen base de PHP
FROM nginx:alpine

# Crear el directorio donde se almacenarán los archivos estáticos
WORKDIR /var/www/html

# Copiar el código de la aplicación
COPY ./js.js .

# Cambiar el comando para ejecutar Apache en primer plano
CMD ["apache2-foreground"]
