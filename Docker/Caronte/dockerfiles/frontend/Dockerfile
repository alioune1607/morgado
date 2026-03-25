# 1. Heredamos de tu capa intermedia de Node (que ya tiene ciberseguridad)
FROM alioune/ubnodebase

# 2. Directorio de trabajo
WORKDIR /app
COPY src/ /app/  
# 3. Exponemos el puerto de NextJS (3000) y el SSH (22)
EXPOSE 3000 22

# 4. Copiamos el entrypoint
COPY start-front.sh /usr/local/bin/start-front.sh
RUN chmod +x /usr/local/bin/start-front.sh

# 5. Ejecutamos
ENTRYPOINT ["/usr/local/bin/start-front.sh"]