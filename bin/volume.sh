#!/bin/bash

# Volume is active, let's read the percentage
if amixer get Master | grep "Front Left:" | grep -q "\[on\]"; then
 echo $(amixer get Master | grep -E -o '[0-9]{1,3}?%' | head -1)
else
  echo "muted"
fi
