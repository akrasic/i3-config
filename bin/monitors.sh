#!/bin/bash

# Detect monitor configuration
connected=$(xrandr | grep -c ' connected')
if [[ "$connected" -gt "1" ]]; then
  if xrandr | grep ' connected' | grep -q 'DP2-3'; then
    # if xrandr | grep ' connected' | grep -q 'DP2-2'; then
    if xrandr | grep ' connected' | grep -q 'DP1'; then
      xrandr \
        --output eDP1 --auto --primary \
        --output DP2-3 --auto --above eDP1 -s   1920x1080 \
        --output DP1 --auto --right-of eDP1 --right-of DP2-3 -s 1920x1080 --rotate left
      #      --output DP2-3 --auto --left-of eDP1 -s   1920x1080
    else
      xrandr \
        --output eDP1 --auto --primary \
        --output DP2-3 --auto --above eDP1 -s   1920x1080
      notify-send "DP2-3 configured"
    fi
  fi
else
  xrandr --output eDP1 --primary
fi
