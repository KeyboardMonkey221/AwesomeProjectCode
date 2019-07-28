#!/bin/sh

# Turn a given wifi interface onto monitor mode
if [ "$1" = "" ]; then echo "$0 <interface-name>"; exit 1; fi

WIFI_INTERFACE=$1

sudo ifconfig $WIFI_INTERFACE down
sudo iwconfig $WIFI_INTERFACE mode monitor
sudo ifconfig $WIFI_INTERFACE up

