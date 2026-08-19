#! /bin/bash

GREEN='\033[0;32m'

cpp_template="#include <iostream>

int main (int argc, char *argv[]) {
    
    return 0;
}
"

bash_template="#! /bin/bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'
"

if [[ -d "$HOME/codex/.temp" ]]; then
    true
else
    mkdir "$HOME/codex/.temp"
fi

cd "$HOME/codex/.temp" || exit
rm -rf ./*
echo "$cpp_template" >main.cpp
echo "$bash_template" >script.sh
chmod +x script.sh
cd - || exit

echo -e "$GREEN THE EAGLE HAS RESURRECTED HIS TEMPORARY NEST SUCCESSFULLY"
