#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for casbin/casbin-website (Docusaurus v1.14.7)
# Runs on existing source tree (no clone). Installs deps and builds.

# --- Node 16 via nvm (Docusaurus v1.14.7) ---
export NVM_DIR="$HOME/.nvm"
if [ ! -f "$NVM_DIR/nvm.sh" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi
source "$NVM_DIR/nvm.sh"
nvm install 16
nvm use 16

echo "[INFO] Node version: $(node --version)"
echo "[INFO] npm version: $(npm --version)"

# --- Install yarn and dependencies ---
npm install -g yarn
yarn install

# --- Build ---
yarn build

echo "[DONE] Build complete."
