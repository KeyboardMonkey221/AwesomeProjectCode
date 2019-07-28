from bs4 import BeautifulSoup
from random import shuffle

suburbs = []

raw_html = open('suburbs.htm').read()
html = BeautifulSoup(raw_html, 'html.parser')
for a in html.select('a'):
        suburbs.append(a.text)

suburbs = suburbs[90:-147]

shuffle(suburbs)

for suburb in suburbs:
    print("{}".format(suburb))
