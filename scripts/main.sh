#! /bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "+------------------------------------------------------------------------------------------------+"
echo -e "| ${GREEN}                                 THE EAGLE'S SCRIPTING NEST                                    ${NC}|"
echo -e "+----+-------------------------------------------------------------------------------------------+"
echo -e "| SR | DESCRIPTION                                                                               |"
echo -e "+----+-------------------------------------------------------------------------------------------+"
echo -e "| 01 | CLEAN ZSH_HISTORY FILE                                                                    |"
echo -e "| 02 | ORGANIZE DOWNLOADS                                                                        |"
echo -e "| 03 | BACKUP TRILIUM NOTES                                                                      |"
echo -e "| 04 | RESURRECT ~/programming/.temp                                                             |"
echo -e "+----+-------------------------------------------------------------------------------------------+"

read -rp "|=> " selection
case "$selection" in
"1") "$HOME/dotfiles/scripts/clean_zsh_history.sh" ;;
"2") "$HOME/dotfiles/scripts/organize_downloads.sh" ;;
"3") "$HOME/dotfiles/scripts/trilium_backup.sh" ;;
"4") "$HOME/dotfiles/scripts/resurrect_temp.sh" ;;
*) echo -e "${RED}__INVALID_INPUT__ ${NC}" ;;
esac
