#!/bin/bash


LOG_FILE="/tmp/pywal_spicetify.log"

# Start logging
exec > "$LOG_FILE" 2>&1
set -x

# Initialize variables
THEME=""

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --theme)
            THEME="$2"
            shift 2
            ;;
        *)
            echo "Unknown parameter passed: $1"
            exit 1
            ;;
    esac
done

# Check if theme is provided
if [ -z "$THEME" ]; then
    echo "Theme not specified. Use --theme <theme_name>."
    exit 1
fi

# Create a temporary file with the new [pywal] section
TEMP_FILE=$(mktemp)

# Append the contents of the original configuration file to the temporary file
cat ~/.cache/wal/colors-spicetify.ini >> "$TEMP_FILE"

# Use sed to replace the [pywal] section in the color.ini file
sed -i '/\[pywal\]/,/^$/d' ~/.config/spicetify/Themes/$THEME/color.ini
cat "$TEMP_FILE" >> ~/.config/spicetify/Themes/$THEME/color.ini

# Remove the temporary file
rm "$TEMP_FILE"

export PATH=$PATH:/home/micah/.spicetify

spicetify config current_theme "$THEME"
spicetify config color_scheme pywal
spicetify apply
