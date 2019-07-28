#!/bin/sh

if [ "$1" = "" ]; then echo "$0 <interface-name>" exit 1; fi

sudo aireplay-ng -9 $1
