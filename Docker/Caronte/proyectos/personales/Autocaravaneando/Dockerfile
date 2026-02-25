# 1. Usamos tu imagen de Nginx como base (nivel 2)
FROM alioune/ubnginx

# 2. Instalación de Node.js 18.x y npm
RUN apt-get update && apt-get install -y curl gnupg software-properties-common
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN node --version && npm --version

# 3. Levantar el puerto 3000 donde actúa Node
EXPOSE 3000

# 4. Copiamos el código del proyecto al directorio /app
WORKDIR /app/src
COPY . /app/

# 5. Copiar su entrypoint (ruta exacta gracias a lo que me has dicho)
COPY admin/start.sh /usr/local/bin/start-react.sh
RUN chmod +x /usr/local/bin/start-react.sh

# 6. Ejecutar su EP
ENTRYPOINT ["/usr/local/bin/start-react.sh"]