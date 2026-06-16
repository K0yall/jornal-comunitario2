FROM ubuntu:24.04

# Evita interações travando o apt
ENV DEBIAN_FRONTEND=noninteractive

# Instala dependências básicas iniciais
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    systemctl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# O Apache será instalado via script conforme os requisitos do trabalho
EXPOSE 80

CMD ["tail", "-f", "/dev/null"]