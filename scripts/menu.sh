#!/bin/bash
# Menu Principal Interativo - Administração do Jornal Comunitário

while true; do
    clear
    echo "========================================="
    echo " Criado por: Lucas Gilmar Da Silva"
    echo " Instituição: Unidavi"
    echo " Tema: Infraestrutura para um Pequeno Jornal Comunitário"
    echo "========================================="
    echo "          MENU DEVOPS CLOUD"
    echo "========================================="
    echo " 1 - Atualizar sistema"
    echo " 2 - Instalar Apache & Ferramentas de Mídia"
    echo " 3 - Criar estrutura do projeto do Jornal"
    echo " 4 - Realizar backup das matérias"
    echo " 5 - Fazer deploy do Portal Web"
    echo " 6 - Ver processos ativos"
    echo " 7 - Monitorar sistema"
    echo " 8 - Configurar usuários e permissões editoriais"
    echo " 9 - Gerar relatório consolidado"
    echo " 0 - Sair"
    echo "========================================="
    read -p "Escolha uma opção: " opcao

    case $opcao in
        1) /app/scripts/01_update.sh ;;
        2) /app/scripts/02_apache.sh ;;
        3) /app/scripts/03_estrutura.sh ;;
        4) /app/scripts/04_backup.sh ;;
        5) /app/scripts/05_deploy.sh ;;
        6) /app/scripts/06_processos.sh listar ;;
        7) /app/scripts/07_monitoramento.sh ;;
        8) /app/scripts/08_usuarios_permissoes.sh ;;
        9) /app/scripts/09_relatorio.sh ;;
        0) echo "Saindo... Até logo!"; exit 0 ;;
        *) echo "Opção inválida! Pressione Enter para continuar..."; read ;;
    esac
    echo "Pressione Enter para voltar ao menu..."
    read
done