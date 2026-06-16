#!/bin/bash
# Gerador Automatizado do Boletim Técnico de Operações do Jornal

RELATORIO="/app/logs/relatorio_execucao.txt"

gerar_relatorio() {
    {
        echo "========================================================="
        echo "RELATÓRIO OPERACIONAL AUTOMATIZADO - INFRAESTRUTURA CLOUD"
        echo "Data/Hora: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "Projeto: Portal de Notícias Comunitárias"
        echo "========================================================="
        echo ""
        echo "--- Espaço em Disco ---"
        df -h /
        echo ""
        echo "--- Últimos Backups Gerados ---"
        ls -lh /app/backups/ | tail -n 5
        echo ""
        echo "--- Status Atual do Apache ---"
        service apache2 status | grep "Active:" || echo "Instale ou ligue o Apache."
        echo ""
        echo "========================================================="
    } > "$RELATORIO"
    
    echo "Relatório gerado com total sucesso em $RELATORIO"
}

gerar_relatorio