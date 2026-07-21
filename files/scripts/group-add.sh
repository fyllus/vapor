#!/usr/bin/env bash
set -euo pipefail

# Cria os grupos minimos de sistema
groupadd -f gamer
groupadd -f input
groupadd -f video
groupadd -f render
groupadd -f audio

# Cria o usuario sem gerar o diretorio home no /var/home durante o build
useradd -m -k /etc/skel -g gamer -G input,video,render,audio gamer || true

# Remove a senha do usuario
passwd -d gamer || true

# Popula a estrutura padrao via /etc/skel para ser implantada no primeiro boot
mkdir -p /etc/skel/.local/share /etc/skel/.config
