#!/bin/bash

LOCKFILE="/tmp/waybar-idle.lock"

if [ -f "$LOCKFILE" ]; then
    # Disable idle inhibit
    pkill -f "systemd-inhibit.*Waybar Idle Lock"
    rm "$LOCKFILE"
    echo '{"text": "󰒲", "tooltip": "Idle allowed", "class": "off"}'
else
    # Enable idle inhibit
    systemd-inhibit --what=sleep:idle --why="Waybar Idle Lock" sleep infinity &
    echo $! > "$LOCKFILE"
    echo '{"text": "󰒳", "tooltip": "Idle inhibited", "class": "on"}'
fi

