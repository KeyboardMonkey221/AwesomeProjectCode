suburbs_file = open('list_of_suburbs.txt', 'r')


SSID_file = open('SSID_dictionary_libraries.txt', 'w')


for suburb in suburbs_file:
        # remove newline
        suburb = suburb[:-1]
        SSID_file.write("{} Library\n".format(suburb))
        SSID_file.write("{}Library\n".format(suburb))
        SSID_file.write("Library of {}\n".format(suburb))


SSID_file.close()
suburbs_file.close()
