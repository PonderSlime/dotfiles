#!/bin/bash
LOG_FILE="/tmp/cava.log"

# Start logging
exec > "$LOG_FILE" 2>&1
set -x

TEMP_FILE=$(mktemp)

cat ~/.cache/wal/colors-cava.ini >> "$TEMP_FILE"

sed -i '/\[color\]/,/^$/d' ~/.config/cava/config
cat "$TEMP_FILE" >> ~/.config/cava/config
rm "$TEMP_FILE"
