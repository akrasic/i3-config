#!/bin/bash

# Detect monitor configuration
connected=$(xrandr | grep -c ' connected')
if [[ "$connected" -gt "1" ]]; then
  if xrandr | grep ' connected' | grep -q 'DP1'; then
    # if xrandr | grep ' connected' | grep -q 'DP2-2'; then
    if xrandr | grep ' connected' | grep -q 'DP2-3'; then
      echo "Configuring 3 displays: eDP1 DP1 DP2-3"
      xrandr \
        --output eDP1 --auto --primary \
        --output DP1 --auto --above eDP1 -s 1920x1080 --rotate normal\
        --output DP2-3 --auto --right-of eDP1 --right-of DP1 -s 1920x1080 --rotate left
    else
      echo "configuring 2 displays eDP1 DP2-3"
      xrandr \
        --output eDP1 --auto --primary \
        --output DP2-3 --auto --above eDP1 -s   1920x1080
      notify-send "DP2-3 configured"
    fi
  fi
else
  xrandr --output eDP1 --primary
fi
