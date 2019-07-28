#!/bin/sh

# Begin capturing of probe requests AND association requests via wireshark

# Program expects the name of the wifi-card's interface
# as an argument
if [ "$1" = "" ]; then echo "$0 <interface-name>"; exit 1; fi

WIFI_ADAPTER=$1

# Wireshark command explained
# -i -> wifi interface name
# -f -> specific capture filter
# -T/-e -> specifying which columns to capture
# -E -> syntax of output
# -b -> ring buffer options (not used)
# -P -> still print summary even if writing to file
tshark 	-i $WIFI_ADAPTER \
	-f "wlan type mgt and (subtype probereq or subtype assocreq)" \
	-T fields -e frame.time -e wlan.sa \
	-E separator=, -E quote=d \
	-P \
	-F pcap \
	-w dump.pcap \
	> MACandSSID_dump.csv
