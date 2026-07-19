#!/usr/bin/env bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

SRC=$HOME/.local/share/trilium-data/
DST=$HOME/.secure_vault/

mkdir -p "$DST"

if [ -f "$SRC/document.db" ]; then
    TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

    cp "$SRC/document.db" "$DST/trilium_notes.db"
    echo -e "${GREEN} Backup created Successfully: $TIMESTAMP $NC"
else
    echo -e "${RED} ERROR: Trilium database not found at $SRC $NC"
    exit 1
fi
