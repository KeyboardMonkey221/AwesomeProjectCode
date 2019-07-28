import psycopg2
import re

try:
    connection = psycopg2.connect(user = "postgres",
                                  password = "",
                                  host = "127.0.0.1",
                                  port = "5432",
                                  database = "awesome_project_db")
    cursor = connection.cursor()
    # read the file

    sql_query = "INSERT INTO Dump (ts, mac, ssid, location) VALUES (%s, %s, %s, %s)"

    fd = open('new_dump_seclab.csv', 'r')
    for line in fd:
        m = '(.*),.*,.*,.*'
        mac = re.match(m, line)
        timestamp = re.sub('[,"]', '', mac.group(1))[:-14][:49]

        m = '.*,(.*),.*,.*'
        mac = re.match(m, line)
        mac_addr = re.sub('["]', '', mac.group(1))[:49]

        m = '.*,.*,(.*),.*'
        mac = re.match(m, line)
        ssid = re.sub('["]', '', mac.group(1))[:49] + ' '

        m = '.*,.*,.*,(.*)'
        mac = re.match(m, line)
        location = mac.group(1)[:49]
        record_insert = (str(timestamp).strip(), mac_addr.strip(), ssid.strip(), location.strip())

        cursor.execute(sql_query, record_insert)
        connection.commit()

except (Exception, psycopg2.Error) as error :
    print ("Error while connecting to PostgreSQL", error)
finally:
    #closing database connection.
        if(connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
