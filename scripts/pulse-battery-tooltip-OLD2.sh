#!/bin/bash

# Configuration
HEADSET_ICON="🎧🔋"

# --- 1. Get Corsair Battery Status ---
# Use headsetcontrol to get the percentage.
# We are using 'jq' to output the final JSON, so we will not use its output here.
BATTERY_PERCENT=$(headsetcontrol -b 2>/dev/null | grep 'Level:' | awk '{print $2}' | tr -d '%')

# --- 2. Check if the Headset is Connected and Data is Available ---
# This is a simple check: if BATTERY_PERCENT is empty, assume disconnected.
if [ -z "$BATTERY_PERCENT" ]; then
    # Output empty JSON: module is invisible and has no tooltip
    echo '{"text": "", "tooltip": ""}'
    exit 0
fi

# --- 3. Construct the Output Fields ---
# Explicitly use Pango markup to wrap the text.
# We'll use a simple span tag for reliable rendering.
# You can change the color (e.g., to '#BF00FF' for a headset color)
# or remove the color attribute entirely.

# Combine the two glyphs into one variable for cleaner Pango wrapping
GLYPHS="🎧🔋"

VISIBLE_TEXT="<span color='#00FFFF'>${GLYPHS}</span> ${BATTERY_PERCENT}%"
# Example of simpler formatting:
# VISIBLE_TEXT="${GLYPHS} ${BATTERY_PERCENT}%"

TOOLTIP_TEXT="Corsair Battery: ${BATTERY_PERCENT}%"

# --- 4. Output the final JSON using jq ---
# This JSON is what the 'custom/headset-battery' module will display.
jq -n \
    --arg text "$VISIBLE_TEXT" \
    --arg tooltip "$TOOLTIP_TEXT" \
    '{text: $text, tooltip: $tooltip}'
