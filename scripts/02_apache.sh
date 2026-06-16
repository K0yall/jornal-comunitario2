#!/bin/bash
# Configuração do Servidor Web e Otimizador de Imagens do Jornal

LOG_FILE="/app/logs/apache.log"

instalar_apache() {
    echo "Instalando Apache2 e ImageMagick (Processamento de Fotos das Matérias)..."
    apt-get install -y apache2 imagemagick >> "$LOG_FILE" 2>&1
}

verificar_apache() {
    if systemctl is-active --quiet apache2 || service apache2 status >/dev/null 2>&1; then
        echo "[OK] Apache está rodando."
    else
        echo "[AVISO] Apache não está rodando. Iniciando serviço..."
        service apache2 start >> "$LOG_FILE" 2>&1
    fi
}

versao_apache() {
    echo "Versão do Servidor Apache instalado:"
    apache2 -v | head -n 1
}

# Execução das funções de validação
instalar_apache
verificar_apache
versao_apache