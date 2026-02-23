#!/bin/bash

# --- 1. Get standard Waybar PulseAudio JSON output ---
# Waybar executes this script and passes its current JSON status as the first argument ($1).
PULSE_JSON="$1"

# --- 2. Get Corsair Battery Status ---
# Use the working command and filter the output to just the percentage number.
# Using the '-b' flag instead of '-c' for cleaner output.
BATTERY_PERCENT=$(headsetcontrol -b 2>/dev/null | grep 'Level:' | awk '{print $2}' | tr -d '%')

# --- 3. Determine if the Corsair Headset is the Active Sink ---
# Check if the PULSE_JSON contains the headset name/ID.
# This ensures the battery only appears when the device is actively used.
# The exact ID will depend on how PulseAudio names your device, often a variation of 'VOID ELITE'.
if echo "$PULSE_JSON" | grep -q 'VOID ELITE Wireless'; then
    IS_HEADSET_ACTIVE=true
else
    IS_HEADSET_ACTIVE=false
fi

# --- 4. Construct the new tooltip content ---
TOOLTIP_TEXT=""
if [ "$IS_HEADSET_ACTIVE" = true ] && [ ! -z "$BATTERY_PERCENT" ]; then
    # Add the battery percentage line if the headset is active and data is found
    TOOLTIP_TEXT="Battery: ${BATTERY_PERCENT}%\n"
fi

# Get the existing tooltip content from the Waybar JSON
EXISTING_TOOLTIP=$(echo "$PULSE_JSON" | jq -r '.tooltip')

# Prepend the battery status to the existing tooltip content
NEW_TOOLTIP="${TOOLTIP_TEXT}${EXISTING_TOOLTIP}"

# --- 5. Output the modified JSON ---
# Use jq to replace the original 'tooltip' field with the new content.
echo "$PULSE_JSON" | jq --arg new_tooltip "$NEW_TOOLTIP" '.tooltip = $new_tooltip'

