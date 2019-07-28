
csvfile = 'dump_seclab.csv'
og = open(csvfile, 'r')
new = open("new_{}".format(csvfile), 'w')

for line in og:
    new.write(line[:-1] + ", seclab\n")

new.close()
og.close()
