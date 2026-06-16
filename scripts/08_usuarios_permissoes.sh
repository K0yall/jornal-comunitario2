#!/bin/bash
# Gerenciamento de Níveis de Acesso para os Redatores e Jornalistas

configurar_seguranca() {
    echo "Configurando perfis de segurança de arquivos do Jornal..."
    
    # Criando grupo editorial e usuário se não existirem
    groupadd -f jornal_redatores
    id -u reporter_user &>/dev/null || useradd -m -g jornal_redatores reporter_user
    
    # Aplicando donos de arquivos e permissões restritas (Evitando 777!)
    chown -R reporter_user:jornal_redatores /app/jornal
    chmod -R 750 /app/jornal
    
    echo "[OK] Permissões aplicadas com sucesso ao diretório /app/jornal (750 - Dono total, Grupo lê/executa)."
}

configurar_seguranca