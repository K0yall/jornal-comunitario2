# Trabalho 03 - Linux, Shell Script e Cloud Computing

## Aluno
Lucas Gilmar da Silva

## Tema
Infraestrutura para um Pequeno Jornal Comunitário

## Descrição do Projeto
Este projeto simula uma infraestrutura automatizada baseada em Linux Ubuntu dentro de containers Docker, voltada para a operação, deploy e segurança de um Portal de Notícias Comunitário.

## Tecnologias Utilizadas
- Linux Ubuntu 24.04
- Docker & Docker Compose
- Apache2
- Shell Script (Bash)
- Git & GitHub
- DockerHub

## Estrutura do Projeto
- `Dockerfile` e `docker-compose.yml`: Configuração do ambiente containerizado.
- `scripts/`: Scripts automatizados (01 a 09) e o `menu.sh`.
- `source/`: Código-fonte do portal web (HTML e CSS em `assets/`).
- `backups/`: Destino dos backups compactados.
- `logs/`: Histórico de execução e auditoria das ferramentas.
- `evidencias/`: Prints de comprovação do funcionamento.

## Como Executar
1. Suba o container:
   ```bash
   docker compose up -d --build