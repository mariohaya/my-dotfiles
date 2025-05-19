#!/bin/bash

# Optional: log the event
echo "[hypridle] Preparing for suspend at $(date)" >> ~/.hypridle.log

# Optionally kill/restart Firefox
# killall firefox  # or: pkill -f firefox

# Optional: stop resource-heavy apps or services
# systemctl --user stop firefox-wayland.service

# Optional: give GPU time to settle
sleep 1

exit 0

# Make it executable: chmod +x ~/.config/hypr/scripts/pre_suspend.sh
