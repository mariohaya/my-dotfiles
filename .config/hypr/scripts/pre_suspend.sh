#!/bin/bash

# Optional: log the event
echo "[hypridle] Preparing for suspend at $(date)" >> ~/.hypridle.log

# give GPU time to settle
sleep 1

exit 0

# Make it executable: chmod +x ~/.config/hypr/scripts/pre_suspend.sh
