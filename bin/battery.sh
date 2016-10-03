#!/bin/sh

INSTANCE="${1:-BAT0}"
ALERT_LOW="${2:-10}"

if test -e "/sys/class/power_supply/$INSTANCE"
then
    status=$(cat /sys/class/power_supply/$INSTANCE/status)
    capacity=$(cat /sys/class/power_supply/$INSTANCE/capacity)

    case "$status" in
        "Discharging")
            symbol='↓'
            ;;
        "Charging")
            symbol='↑'
            ;;
        "Full")
            exit
            ;;
    esac

    # Full text
    #echo "Ψ $capacity% $symbol"

    # Short text
    echo "  $capacity% $symbol"

    # Color
    if test $capacity -le $ALERT_LOW -a $status = "Discharging"
    then
        echo "#FF0000"
    fi
fi
