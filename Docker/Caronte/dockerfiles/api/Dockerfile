# 1. Heredamos de tu capa intermedia de Node (que ya tiene ciberseguridad)
FROM alioune/ubnodebase

# 2. Directorio de trabajo
WORKDIR /app

# 3. Exponemos el puerto de NestJS (3001) y el SSH (22)
EXPOSE 3001 22

# 4. Copiamos el entrypoint
COPY start-api.sh /usr/local/bin/start-api.sh
RUN chmod +x /usr/local/bin/start-api.sh

# 5. Ejecutamos
ENTRYPOINT ["/usr/local/bin/start-api.sh"]