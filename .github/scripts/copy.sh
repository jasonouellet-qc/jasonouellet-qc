#!/usr/bin/env bash
# bash boilerplate
set -euo pipefail # strict mode
readonly SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
function l { # Log a message to the terminal.
    echo
    echo -e "[$SCRIPT_NAME] ${1:-}"
}

if $DEBUG == true then
  echo "ls avant copie"
  ls -la -R
fi

# File to copy from personal repo
README_FILE=$SRC_PATH/README.md

# if the file exists in Notehub, copy it to Notehub-JS repo
if [ -f "$README_FILE" ]; then
    echo "Copying $README_FILE"
    cp -R $README_FILE .
fi

echo "README file copied"


# File to copy from personal repo
IMAGES_PATH=$SRC_PATH/images
IMAGES_PATTERN=$IMAGES_PATH/*badge*.*

# if the file exists in Notehub, copy it to Notehub-JS repo
if [ -f "$IMAGES_PATH" ]; then
    echo "Copying $README_FILE"
    cp -R $IMAGES_PATTERN ./images/.
fi

echo "images files copied"

if $DEBUG == true then
  echo "ls après copie"
  ls -la -R
fi
