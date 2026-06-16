#!/bin/bash
# Script de Atualização voltado ao Servidor do Jornal Comunitário

LOG_FILE="/app/logs/update.log"

atualizar_sistema() {
    echo "=== Iniciando Atualização do Servidor do Jornal ===" | tee -a "$LOG_FILE"
    apt-get update && apt-get upgrade -y
    
    if [ $? -eq 0 ]; then
        echo "[SUCCESS] $(date '+%Y-%m-%d %H:%M:%S') - Sistema atualizado com sucesso." | tee -a "$LOG_FILE"
    else
        echo "[ERROR] $(date '+%Y-%m-%d %H:%M:%S') - Falha na atualização do sistema." | tee -a "$LOG_FILE"
    fi
}

atualizar_sistema