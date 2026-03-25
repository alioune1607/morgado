#!/bin/bash
LOG_FILE="/root/logs/informe-front.log"
echo "=== INICIANDO FRONTEND NEXTJS ===" > $LOG_FILE

# 1. Lanzamos la ciberseguridad heredada
/usr/local/bin/start.sh &

# 2. Entramos al código y preparamos Node
cd /app
echo "Instalando dependencias del Frontend..." >> $LOG_FILE
npm install

# 3. Lanzamos el Front
echo "Lanzando NextJS..." >> $LOG_FILE
npm run dev