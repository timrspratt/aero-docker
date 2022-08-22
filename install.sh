#!/bin/bash
set -o errexit
AERO_DOCKER_DIR="$HOME/.aero-docker"
if [ -f "$AERO_DOCKER_DIR/.env" ]; then
    cp -p "$AERO_DOCKER_DIR/.env" "$HOME/.env.aero-docker.temp"
fi
WHITE='\033[0;37m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'
if ! sudo -n true 2>/dev/null; then
  if [ $# -eq 0 ]; then
    echo -e "${YELLOW}Please provide your password so the global \`aero\` command can be installed.${NC}" >&2
  else
    echo -e "${YELLOW}Please provide your password so the global \`aero\` command can be updated.${NC}" >&2
  fi
fi
rm -rf "$AERO_DOCKER_DIR"
mkdir -p "$_/extract"
cd "$_/.."
if ! wget https://github.com/timrspratt/aero-docker/archive/refs/heads/1.x.tar.gz -qO docker.tar.gz &> /dev/null; then
    curl https://github.com/timrspratt/aero-docker/archive/refs/heads/1.x.tar.gz -Lso docker.tar.gz
fi
if ! tar -xf docker.tar.gz -C extract --strip-components=1; then
    echo -e "${RED}There was a problem downloading the required files.${NC}" >&2
    exit 1
fi
shopt -s dotglob
mv extract/compose/* ./
rm -rf extract docker.tar.gz
sudo rm -rf /usr/local/bin/aero
if [ -f "$HOME/.env.aero-docker.temp" ]; then
    cp -p "$HOME/.env.aero-docker.temp" "$AERO_DOCKER_DIR/.env"
    rm -f "$HOME/.env.aero-docker.temp"
else
    cp -n "$AERO_DOCKER_DIR/.env.example" "$AERO_DOCKER_DIR/.env"
fi
sudo ln -s "$(pwd)"/aero /usr/local/bin/aero
if [ $# -eq 0 ]; then
  echo -e "${GREEN}Installed!${NC}" >&2
  echo -e "${WHITE}Run the \`aero new\` command to create a new store.${NC}" >&2
  echo -e "${WHITE}Make sure to include the store name.${NC}" >&2
fi
