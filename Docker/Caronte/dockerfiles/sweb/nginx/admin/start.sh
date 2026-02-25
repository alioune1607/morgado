#!/bin/bash

echo "Iniciando Nginx en segundo plano..."
nginx &

echo "Lanzando configuraciones de seguridad de la imagen base..."
/usr/local/bin/start.sh