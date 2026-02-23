#!/bin/bash

GLYPHS="🔋"

BATTERY_PERCENT=$(headsetcontrol -b 2>/dev/null | grep 'Level:' | awk '{print $2}' | tr -d '%')

# If no data, output nothing (module hidden)
if [ -z "$BATTERY_PERCENT" ]; then
    echo ""
    exit 0
fi

echo "${GLYPHS} ${BATTERY_PERCENT}%"
