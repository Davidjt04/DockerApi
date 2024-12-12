# Usar la imagen base de PHP
FROM nginx:alpine 

# Crear el directorio donde se almacenarán los archivos estáticos
WORKDIR /var/www/html

# Copiar el código de la aplicación
COPY ./js.js .

# Asegúrate de que Nginx se ejecute en primer plano y, si falla, mantener el contenedor activo
CMD ["sh", "-c", "nginx -g 'daemon off;' || tail -f /dev/null"]
