#!/bin/bash

# Configuration
GLYPHS="🔋"

# 1. Get battery percentage (number only)
BATTERY_PERCENT=$(headsetcontrol -b 2>/dev/null | grep 'Level:' | awk '{print $2}' | tr -d '%')

# 2. If empty, hide the module
if [ -z "$BATTERY_PERCENT" ]; then
    # Two empty lines = no text, no tooltip
    printf '\n\n'
    exit 0
fi

# 3. Build text and tooltip (both with %)
TEXT="${GLYPHS} ${BATTERY_PERCENT}%%"
TOOLTIP="Corsair Battery: ${BATTERY_PERCENT}%"

# 4. i3blocks-style output:
#   line 1 = text
#   line 2 = tooltip
printf '%s\n%s\n' "$TEXT" "$TOOLTIP"

