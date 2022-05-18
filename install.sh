#!/bin/bash
set -o errexit
AERO_DOCKER_DIR="$HOME/.aero-docker-2"
if [ -f "$AERO_DOCKER_DIR/.env" ]; then
    cp -p "$AERO_DOCKER_DIR/.env" "$HOME/.env.aero-docker.temp"
fi
WHITE='\033[1;37m'
YELLOW='\033[1;33m'
NC='\033[0m'
if ! sudo -n true 2>/dev/null; then
    echo -e "${YELLOW}Please provide your password so the global \`aero\` command can be installed.${NC}" >&2
fi
rm -rf "$AERO_DOCKER_DIR"
mkdir -p "$_/extract"
cd "$_/.."
wget https://github.com/timrspratt/aero-docker/archive/refs/heads/1.x.zip -qO docker.zip
tar -xf docker.zip -C extract --strip-components=1
shopt -s dotglob
mv extract/compose/* ./
rm -rf extract docker.zip
sudo rm -rf /usr/local/bin/aero
if [ -f "$HOME/.env.aero-docker.temp" ]; then
    cp -p "$HOME/.env.aero-docker.temp" "$AERO_DOCKER_DIR/.env"
    rm -f "$HOME/.env.aero-docker.temp"
else
    cp "$AERO_DOCKER_DIR/.aero/.env.example" "$AERO_DOCKER_DIR/.env"
fi
sudo ln -s "$(pwd)"/aero /usr/local/bin/aero
echo -e "${WHITE}✔ Installed${NC}" >&2
