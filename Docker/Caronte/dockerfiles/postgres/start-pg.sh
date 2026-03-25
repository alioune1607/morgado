#!/bin/bash

LOG_FILE="/root/logs/informe-pg.log"
mkdir -p /root/logs
echo "=== INICIANDO POSTGRES ALIOUNE ===" > $LOG_FILE

# 1. Lanzar la ciberseguridad
/usr/local/bin/start.sh &

# 2. Configurar Postgres para aceptar conexiones externas
echo "listen_addresses='*'" >> /etc/postgresql/*/main/postgresql.conf
echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/*/main/pg_hba.conf

# 3. Arrancar Postgres
service postgresql start

# 4. Crear BD y usuario (Requisito para nota)
su - postgres -c "psql -c \"CREATE USER alioune WITH PASSWORD 'alioune';\""
su - postgres -c "psql -c \"CREATE DATABASE nestdb OWNER alioune;\""
su - postgres -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE nestdb TO alioune;\""

echo "[OK] Base de datos 'nestdb' lista" >> $LOG_FILE

# 5. Mantener el contenedor vivo
tail -f /dev/null