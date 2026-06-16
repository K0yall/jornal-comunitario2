#!/bin/bash
# Publicador de Páginas do Jornal Comunitário

LOG_FILE="/app/logs/deploy.log"
DESTINO="/var/www/html"

executar_deploy() {
    echo "Iniciando a publicação do site do Jornal..." | tee -a "$LOG_FILE"
    
    # Limpando o diretório web padrão
    rm -rf "$DESTINO"/*
    
    # Copiando novos arquivos do portal
    cp -r /app/source/* "$DESTINO"/
    
    # Validações obrigatórias
    if [ -f "$DESTINO/index.html" ]; then
        echo "[OK] index.html publicado com sucesso!" | tee -a "$LOG_FILE"
        echo "Arquivos atualmente online no servidor:"
        ls -la "$DESTINO"
    else
        echo "[ERRO] index.html não foi encontrado no destino!" | tee -a "$LOG_FILE"
    fi
}

executar_deploy