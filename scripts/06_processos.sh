#!/bin/bash
# Gerenciamento de Processos críticos do Portal de Notícias

listar_processos() {
    echo "=== Listando Processos Ativos no Servidor ==="
    ps aux | head -n 15
}

buscar_processo() {
    local nome=$1
    if [ -z "$nome" ]; then
        echo "Por favor, digite o nome do processo a buscar (Ex: apache2)"
        return
    fi
    echo "Buscando por '$nome':"
    ps aux | grep -i "$nome" | grep -v grep
}

matar_processo() {
    local pid=$1
    if [ -z "$pid" ]; then
        echo "[ERRO SEGURANÇA] Código PID ausente! Não é possível encerrar sem o identificador."
        return
    fi
    echo "Encerrando processo com PID: $pid de forma segura..."
    kill -15 "$pid"
}

# Controle de fluxo via passagem de parâmetros no terminal
case "$1" in
    listar) listar_processos ;;
    buscar) buscar_processo "$2" ;;
    matar)  matar_processo "$2" ;;
    *) echo "Uso correto: $0 {listar|buscar <nome>|matar <PID>}" ;;
esac