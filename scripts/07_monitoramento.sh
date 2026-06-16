#!/bin/bash
# Monitor de Recursos de Infraestrutura Cloud do Jornal

LOG_FILE="/app/logs/monitoramento.log"

verificar_recursos() {
    echo "--- Coleta realizada em: $(date '+%Y-%m-%d %H:%M:%S') ---" | tee -a "$LOG_FILE"
    
    # CPU
    U_CPU=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    echo "Uso de CPU: $U_CPU%" | tee -a "$LOG_FILE"
    
    # Memória
    U_RAM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    echo "Uso de RAM: $(printf "%.2f" "$U_RAM")%" | tee -a "$LOG_FILE"
    
    # Disco
    U_DISCO=$(df / | grep / | awk '{print $5}' | sed 's/%//')
    echo "Uso de Disco: $U_DISCO%" | tee -a "$LOG_FILE"
    
    # Validações e Alertas
    if service apache2 status >/dev/null 2>&1; then
        echo "[OK] Apache em execução" | tee -a "$LOG_FILE"
    else
        echo "[ALERTA] Apache está FORA DO AR!" | tee -a "$LOG_FILE"
    fi
    
    # Exemplo simples de gatilho de alerta
    if [ "$U_DISCO" -gt 80 ]; then
        echo "[ALERTA] Armazenamento de Fotos acima de 80%!" | tee -a "$LOG_FILE"
    fi
}

verificar_recursos