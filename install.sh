#!/bin/bash
set -o errexit
AERO_DOCKER_DIR="$HOME/.aero-docker"
if [ -f "$AERO_DOCKER_DIR/.env" ]; then
    cp -p "$AERO_DOCKER_DIR/.env" "$HOME/.env.aero-docker.temp"
fi
rm -rf $AERO_DOCKER_DIR
mkdir -p $_
cd $_
git init -qqq
git remote add origin https://github.com/timrspratt/aero-docker
git fetch origin -qqq
git checkout origin/master -- compose
shopt -s dotglob
mv compose/* ./
rm -rf compose .git
rm -rf /usr/local/bin/aero
if [ -f "$HOME/.env.aero-docker.temp" ]; then
    cp -p "$HOME/.env.aero-docker.temp" "$AERO_DOCKER_DIR/.env"
    rm -f "$HOME/.env.aero-docker.temp"
else
    cp "$AERO_DOCKER_DIR/.aero/.env.example" "$AERO_DOCKER_DIR/.env"
fi
ln -s $(pwd)/aero /usr/local/bin/aero
