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

cd "$WORKING_DIR_SCRIPT_C_CPP" || exit

out="${file%.*}.out"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

if g++ -std=c++20 -Wall -Wextra -O2 "${file}" -o "${out}"; then
    echo -e "${GREEN}✅ Compilation successful $out...${NC}"
else
    echo -e "${RED}❌ Compilation failed.${NC}"
fi

cd - || exit
