#!/bin/sh

python3 webscrape_suburbs.py > list_of_suburbs.txt

python3 create_wifi_names.py
