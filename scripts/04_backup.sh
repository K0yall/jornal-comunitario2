#!/bin/bash
# Backup Automatizado do Acervo de Notícias do Jornal

ORIGEM="/app/jornal"
DESTINO="/app/backups"
DATA=$(date '+%Y-%m-%d_%H-%M')
NOME_ARQUIVO="backup_jornal_$DATA.tar.gz"
LOG_FILE="/app/logs/backup.log"

realizar_backup() {
    mkdir -p "$DESTINO"
    
    echo "Compactando arquivos do portal..."
    tar -czf "$DESTINO/$NOME_ARQUIVO" -C "$ORIGEM" . 2>> "$LOG_FILE"
    
    if [ -f "$DESTINO/$NOME_ARQUIVO" ]; then
        echo "[OK] Backup gerado com sucesso: $NOME_ARQUIVO" | tee -a "$LOG_FILE"
    else
        echo "[ERRO] Falha ao tentar gerar o backup." | tee -a "$LOG_FILE"
    fi
}

realizar_backup