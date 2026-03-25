#!/bin/bash
# Creamos la carpeta de logs para que no falle
mkdir -p /root/logs
LOG_FILE="/root/logs/informe-api.log"
echo "=== INICIANDO API NESTJS ===" > $LOG_FILE

# 1. Lanzamos la ciberseguridad heredada
/usr/local/bin/start.sh &

# 2. Entramos al código y preparamos Node
cd /app
echo "Instalando dependencias de la API..." >> $LOG_FILE
npm install

# 3. Lanzamos la API (Plan A, Plan B y Plan C)
echo "Lanzando API..." >> $LOG_FILE
npm run start:dev || npm run dev || npm start