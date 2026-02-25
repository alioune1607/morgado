#!/bin/bash

# --- FUNCIONES DE CIBERSEGURIDAD DE ALIOUNE KANE ---
akload_ciber() {
    LOG_DIR="/root/logs"
    mkdir -p "$LOG_DIR"
    LOG_FILE="$LOG_DIR/${CONTENEDOR}_ports"

    echo "=== PORT AUDITORIA ===" >> "$LOG_FILE"
    echo "Container: ${CONTENEDOR}" >> "$LOG_FILE"
    echo "Timestamp: $(date)" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    echo "--- Listening TCP/UDP ports ---" >> "$LOG_FILE"
    ss -tulnp >> "$LOG_FILE" 2>&1
    echo "" >> "$LOG_FILE"
    echo "--- Exposed environment ports ---" >> "$LOG_FILE"
    printenv | grep -i port >> "$LOG_FILE" 2>/dev/null || true
    echo "" >> "$LOG_FILE"
    echo "=== END AUDITORIA ===" >> "$LOG_FILE"
}

akscan() {
    while true; do
        akload_ciber
        sleep 30
    done
}

main() {
    # Iniciar SSH en segundo plano como pide el examen
    /usr/sbin/sshd -D &
    
    # Iniciar el escáner de ciberseguridad en segundo plano
    akscan &
    
    # Mantener el contenedor vivo
    tail -f /dev/null
}

main