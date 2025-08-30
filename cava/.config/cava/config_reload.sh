#!/bin/bash
sed -i -e '/#start-color/,/#end-color/d' ~/.config/cava/config
cat ~/.config/cava/config-colors.txt >> ~/.config/cava/config
