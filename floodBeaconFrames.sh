#!/bin/sh 

# Given a wifi-interface, flood the air with beacon frames using SSIDs from a file

if [ "$3" = "" ]; then echo "$0 <interface-name> <dictionary_filename> <channel_no>"; exit 1; fi

WIFI_ADAPTER=$1
FILE=$2
CHANNEL=$3

# b -> beacon frames
# -f -> select file
# -g and -a are standards of wifi
# -c transmit on channel 11 
sudo mdk3 $WIFI_ADAPTER b -f $FILE -g -a -m -c $CHANNEL

