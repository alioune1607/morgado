# 1. Heredamos la ciberseguridad y el SSH
FROM alioune/ubbase

# 2. Instalamos PostgreSQL
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y postgresql postgresql-contrib

# 3. Exponemos puertos
EXPOSE 5432 22

# 4. Copiamos script de inicio
COPY start-pg.sh /usr/local/bin/start-pg.sh
RUN chmod +x /usr/local/bin/start-pg.sh

# 5. Entrypoint
ENTRYPOINT ["/usr/local/bin/start-pg.sh"]