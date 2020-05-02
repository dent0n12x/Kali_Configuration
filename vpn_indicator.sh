#!/bin/bash

checkvpn=$(nmcli con | grep tun0)
readonly TOOLTIP=$(nmcli -m multiline con)

# Check VPN status

if [[ -n "$checkvpn" ]]; then
  STATUS="$(ip -o -4 addr list tun0 | awk '{print $4}' | cut -d/ -f1)"
  ICON=".vpn_icons/vpn_on.png"
else
  STATUS="VPN Off"
  ICON=".vpn_icons/vpn_off.png"
fi

# Configure icon depending on VPN status and add it to the panel

if [[ $(file -b "${ICON}") =~ PNG ]]; then
  INFO="<img>${ICON}</img>"
  INFO+="<txt>"
else
  INFO="<txt>"
fi

# Add status to panel text depending on VPN status

if [[ -n "$checkvpn"  ]]; then
  INFO+="  <span weight='Bold' fgcolor='Orange'>$STATUS</span> "
else
  INFO+="  <span weight='Bold' fgcolor='Red'>$STATUS</span> "
fi

INFO+="</txt>"

# Add info to tooltip

# Tooltip
MORE_INFO="<tool>"
MORE_INFO+="${TOOLTIP}"
MORE_INFO+="</tool>"

# Panel Print

echo -e "${INFO}"

# Tooltip Print

echo -e "${MORE_INFO}"
