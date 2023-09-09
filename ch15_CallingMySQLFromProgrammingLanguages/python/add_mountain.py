import mysql.connector

conn = mysql.connector.connect(
    user="top_app",
    password="pQ3fgR5u5",
    host="localhost",
    database="topography",
)

cursor = conn.cursor()

sql = "insert into mountain(mountain_name, location, height) values (%s, %s, %s)"
val = ("Ojos Del Salado", "South America", 22615)
cursor.execute(sql, val)
conn.commit()

conn.close()
