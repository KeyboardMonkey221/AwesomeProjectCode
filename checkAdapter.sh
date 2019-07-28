#!/bin/sh

# Check for wlan1 ... <REALTEK>
echo "###### DISPLAYING ALL AVAILABLE WIFI CARDS ######"
echo "@@@@@@ iwconfig @@@@@@"
iwconfig

echo "@@@@@@ WIRESHARK (optional parameter -wireshark) @@@@@"
if [ "-wireshark" = "$1" ]; then
	sudo wireshark -D
fi

