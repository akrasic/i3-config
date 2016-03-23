#!/bin/bash
#
# Use nmcli to display the VPN status
#
if nmcli -t -f name,type con show --active | grep -q vpn; then
  vpnname=$(nmcli -t -f name,type con show --active  | grep vpn | cut -d: -f1)
  echo "  ${vpnname} connected"
else
  echo "  off"
fi
