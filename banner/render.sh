#!/bin/sh
# Renders banner.html to banner-dark.png and banner-light.png (1200x630 at 2x) with headless Chrome.
set -e
cd "$(dirname "$0")"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

for theme in dark light; do
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --window-size=1200,630 --force-device-scale-factor=2 \
    --default-background-color=00000000 --virtual-time-budget=5000 \
    --allow-file-access-from-files \
    --screenshot="$PWD/banner-$theme.png" \
    "file://$PWD/banner.html?theme=$theme" 2>/dev/null
  echo "banner-$theme.png"
done
