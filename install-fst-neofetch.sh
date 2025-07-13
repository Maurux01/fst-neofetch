#!/bin/bash

set -e

# Colores para mensajes
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Detectar gestor de paquetes
if command -v pacman >/dev/null; then
    PKG_INSTALL="sudo pacman -S --noconfirm"
elif command -v apt >/dev/null; then
    PKG_INSTALL="sudo apt update && sudo apt install -y"
elif command -v dnf >/dev/null; then
    PKG_INSTALL="sudo dnf install -y"
else
    echo -e "${YELLOW}No se detectó un gestor de paquetes soportado (pacman, apt, dnf).${NC}"
    exit 1
fi

# Instalar fastfetch y neofetch si no están
for pkg in fastfetch neofetch; do
    if ! command -v $pkg >/dev/null; then
        echo -e "${GREEN}Instalando $pkg...${NC}"
        eval "$PKG_INSTALL $pkg"
    else
        echo -e "${GREEN}$pkg ya está instalado.${NC}"
    fi
done

# Copiar configuraciones
mkdir -p ~/.config/fastfetch ~/.config/neofetch
cp fastfetch-config.jsonc ~/.config/fastfetch/config.jsonc
cp neofetch-config.conf ~/.config/neofetch/config.conf

echo -e "${GREEN}Configuraciones copiadas a ~/.config/fastfetch y ~/.config/neofetch${NC}"

# Crear carpeta de imágenes
PICTURES="$HOME/Pictures"
mkdir -p "$PICTURES"

# Descargar imagen de ejemplo si no hay ninguna
if ! find "$PICTURES" -maxdepth 1 -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' | grep -q .; then
    echo -e "${YELLOW}No se encontraron imágenes en $PICTURES. Descargando una de ejemplo...${NC}"
    wget -O "$PICTURES/random.png" https://upload.wikimedia.org/wikipedia/commons/a/a7/Archlinux-icon-crystal-64.svg || true
fi

echo -e "${GREEN}¡Listo!${NC}"
echo -e "\nPara usar una imagen aleatoria con neofetch o fastfetch, ejecuta:\n"
echo -e "${YELLOW}bash -c 'RANDOM_IMG=\"$(find \"$HOME/Pictures\" -type f \( -iname \"*.png\" -o -iname \"*.jpg\" -o -iname \"*.jpeg\" \) | shuf -n 1)\"; cp \"$RANDOM_IMG\" \"$HOME/Pictures/random.png\"; neofetch'${NC}"
echo -e "\no\n"
echo -e "${YELLOW}bash -c 'RANDOM_IMG=\"$(find \"$HOME/Pictures\" -type f \( -iname \"*.png\" -o -iname \"*.jpg\" -o -iname \"*.jpeg\" \) | shuf -n 1)\"; cp \"$RANDOM_IMG\" \"$HOME/Pictures/random.png\"; fastfetch'${NC}"
echo -e "\nPuedes agregar tus propias imágenes a $PICTURES para personalizar aún más tu fetch.\n" 