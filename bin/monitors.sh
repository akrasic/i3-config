#!/bin/bash

# Detect monitor configuration
connected=$(xrandr | grep -c ' connected')
if [[ "$connected" -gt "1" ]]; then

  if xrandr | grep ' connected' | grep -q 'DP2-3'; then
    xrandr \
      --output eDP1 --auto --primary \
      --output DP2-3 --auto --left-of eDP1 -s   1920x1080

    notify-send "DP2-3 configured"
  fi
else
  xrandr --output eDP1 --primary
fi
