#!/bin/bash

cmdline=$(cat /proc/cmdline)

if [[ $cmdline == *'bt_mac='* ]]; then
    bt_mac=$(echo $cmdline | grep -o 'bt_mac=[^ ]*' | cut -d'=' -f2)
else
    bt_mac="2C:6D:C1:F1:93:32"
fi

# Power off Bluetooth before changing the MAC
sudo btmgmt power off
sleep 1

# Set the new MAC address
sudo btmgmt public-addr "$bt_mac"

# Power Bluetooth back on
sudo btmgmt power on
