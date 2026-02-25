#!/bin/bash

LOG_FILE="/root/logs/informe.log"
mkdir -p /root/logs

echo "=== INICIANDO CONFIGURACIÓN ALIOUNE REACT ===" >> $LOG_FILE

# ¡SÚPER IMPORTANTE! Lanzar Nginx y la seguridad base en segundo plano
/usr/local/bin/start-nginx.sh &

# Entramos en el proyecto /app
cd /app/src

# Si no existe node_modules, hacemos npm install
if [ ! -d "node_modules" ]; then
    echo "Instalando dependencias (npm install)..." >> $LOG_FILE
    npm install
    if [ $? -ne 0 ]; then
        echo "[ERROR] Falló npm install" >> $LOG_FILE
        exit 1
    fi
    echo "[OK] Dependencias instaladas" >> $LOG_FILE
fi

# Si no existe build, lanzamos npm run build
if [ ! -d "build" ]; then
    echo "Compilando proyecto (npm run build)..." >> $LOG_FILE
    npm run build
    if [ $? -ne 0 ]; then
        echo "[ERROR] Falló npm run build" >> $LOG_FILE
        exit 1
    fi
    echo "[OK] Build generado" >> $LOG_FILE
fi

# Después del build copiamos todo al Nginx
echo "Copiando contenido del build al /var/www/html..." >> $LOG_FILE
cp -r build/* /var/www/html/
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
echo "[OK] Archivos copiados y permisos asignados" >> $LOG_FILE

# Lanzar el proyecto en desarrollo en el puerto 3000
echo "Lanzando npm start..." >> $LOG_FILE
npm start