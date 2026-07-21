#!/bin/bash

echo -e "+----+-------------------------------------------------------------------------------------------+"
echo -e "| SR | DESCRIPTION                                                                               |"
echo -e "+----+-------------------------------------------------------------------------------------------+"
echo -e "| 01 | C                                                                                         |"
echo -e "| 02 | C++                                                                                       |"
echo -e "+----+-------------------------------------------------------------------------------------------+"

file="main.cpp"
read -rp "=> " filetype
if [[ $filetype == "1" ]]; then
    file="main.c"
elif [[ $filetype == "2" ]]; then
    file="main.cpp"
else
    echo "INVALID INPUT"
    exit 1
fi

echo -e "+----+-------------------------------------------------------------------------------------------+"
echo -e "| SR | DESCRIPTION                                                                               |"
echo -e "+----+-------------------------------------------------------------------------------------------+"
echo -e "| 01 | DEUBG ON                                                                                  |"
echo -e "| 02 | DEBUG OFF                                                                                 |"
echo -e "+----+-------------------------------------------------------------------------------------------+"

debug=0
read -rp "=> " debugToggle
if [[ $debugToggle == "1" ]]; then
    debug=1
elif [[ $debugToggle == "2" ]]; then
    debug=0
else
    echo "INVALID INPUT"
    exit 1
fi

cd "$WORKING_DIR_SCRIPT_C_CPP" || exit

out="${file%.*}.out"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

if [[ $debug -eq 1 ]]; then
    # Debug compile
    if g++ -std=c++20 -Wall -Wextra -O0 -g "${file}" -o "${out}"; then
        echo -e "${GREEN}✅ Compilation successful (debug). Debugging $out...${NC}"
    else
        echo -e "${RED}❌ Compilation failed.${NC}"
    fi
else
    # Release compile
    if g++ -std=c++20 -Wall -Wextra -O2 "${file}" -o "${out}"; then
        echo -e "${GREEN}✅ Compilation successful. Executing $out...${NC}"
        ./"$out"
    else
        echo -e "${RED}❌ Compilation failed.${NC}"
    fi
fi

cd - || exit
