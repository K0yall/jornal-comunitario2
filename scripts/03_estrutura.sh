#!/bin/bash
# Criador da estrutura de subpastas do Jornal Comunitário

criar_estrutura_jornal() {
    BASE_DIR="/app/jornal"
    
    echo "Limpando estruturas antigas com segurança..."
    rm -rf "$BASE_DIR"
    
    echo "Criando diretórios dedicados do Portal de Notícias..."
    mkdir -p "$BASE_DIR/noticias"  # Textos e pautas
    mkdir -p "$BASE_DIR/edicoes"   # PDFs de edições impressas antigas
    mkdir -p "$BASE_DIR/imagens"   # Fotos da capa e reportagens
    mkdir -p "$BASE_DIR/logs"      # Histórico de acessos do jornal
    mkdir -p "$BASE_DIR/backups"   # Cópias de segurança das matérias
    
    echo "Criando arquivos de marcação inicial..."
    echo "Pautas da Semana" > "$BASE_DIR/noticias/pauta_exemplo.txt"
    
    echo "Estrutura temática criada com sucesso em: $BASE_DIR"
}

criar_estrutura_jornal