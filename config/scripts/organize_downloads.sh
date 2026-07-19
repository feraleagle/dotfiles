#!/bin/bash

GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m'

# =================================================================
#  The Eagle's Downloads Organizer - Firmware & CS Edition
# =================================================================

TARGET_DIR="$HOME/Downloads"
cd "$TARGET_DIR" || exit

echo "🔧 Organizing $TARGET_DIR for a clean workspace..."

# 📂 Create the directory structure first
mkdir -p images documents archives web videos others scripts general

# 🔄 Loop through every file in the current directory (non-recursive)
for file in *; do
    # Skip if it's a directory
    [[ -d "$file" ]] && continue

    # Extract extension and convert to lowercase
    ext="${file##*.}"
    ext_lower=$(echo "$ext" | tr '[:upper:]' '[:lower:]')

    case "$ext_lower" in
    # 🖼️ Images
    png | jpg | jpeg | svg | webp | gif | ico)
        mv "$file" images/
        ;;

    # 📄 Documents (SDLC handouts, PDFs, etc.)
    pdf | docx | doc | txt | pptx | xlsx)
        mv "$file" documents/
        ;;

    # 📦 Archives
    zip | tar | gz | 7z | rar | bz2 | xz)
        mv "$file" archives/
        ;;

    # 🌐 Web Files
    html | htm | css | js | php)
        mv "$file" web/
        ;;

    # 🎥 Videos
    mp4 | mkv | mov | avi | flv)
        mv "$file" videos/
        ;;

    # 💻 Scripts (C++, Python, Bash)
    sh | py | cpp | hpp | c | h | cmd | bat)
        mv "$file" scripts/
        ;;

    # 🛠️ Others (Partial downloads, specific tool formats)
    part | crdownload | tmp)
        mv "$file" others/
        ;;

    # 📥 General (Anything else)
    *)
        mv "$file" general/
        ;;
    esac
done

echo -e "${GREEN}✅ Done! Your $TARGET_DIR is now organized🔥$NC"
