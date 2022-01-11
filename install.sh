#!/bin/bash
set -o errexit
git init -qqq
git remote add origin https://github.com/timrspratt/aero-docker
git fetch origin -qqq
git checkout origin/master -- compose
shopt -s dotglob
mv compose/* ./
rm -rf compose .git
rm -rf /usr/local/bin/aero
ln -s $(pwd)/aero /usr/local/bin/aero
