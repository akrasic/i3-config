#!/bin/bash
if which mpc > /dev/null 2>&1; then
  mpc current | cut -c 1-100
else
  echo "Install mpc"
fi
