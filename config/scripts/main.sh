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
echo -e "| 05 | Compile & Execute C/C++                                                                   |"
echo -e "+----+-------------------------------------------------------------------------------------------+"

read -rp "|=> " selection
case "$selection" in
"1") "$HOME/scripts/clean_zsh_history.sh" ;;
"2") "$HOME/scripts/organize_downloads.sh" ;;
"3") "$HOME/scripts/trilium_backup.sh" ;;
"4") "$HOME/scripts/resurrect_temp.sh" ;;
"5")
    export WORKING_DIR_SCRIPT_C_CPP="$PWD"
    "$HOME/scripts/comp_exec_c_cpp.sh"
    ;;
*) echo -e "${RED}__INVALID_INPUT__ ${NC}" ;;
esac
