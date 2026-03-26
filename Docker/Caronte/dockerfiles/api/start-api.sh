#!/bin/bash
mkdir -p /root/logs
LOG_FILE="/root/logs/informe-api.log"
echo "=== INICIANDO API NESTJS ===" > $LOG_FILE

# 1. Lanzamos la ciberseguridad heredada
/usr/local/bin/start.sh &

# 2. Entramos a la subcarpeta real de tu código
cd /app/poke-task
echo "Instalando dependencias de la API..." >> $LOG_FILE
npm install

# 3. Lanzamos la API
echo "Lanzando API..." >> $LOG_FILE
npm run dev -- -H 0.0.0.0 -p 3000 || npm start -- -H 0.0.0.0 -p 3000