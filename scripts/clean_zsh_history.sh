#! /bin/zsh

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

cd $HOME
if [[ -f ".zsh_history" ]]; then
    sort -u .zsh_history_bak > .zsh_history
    echo -e "${GREEN}ZSH history is spotless now ✨$NC"
else 
    echo -e "${RED}ZSH history file not found ❌$NC"
fi

cd -
