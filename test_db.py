import cx_Oracle

dsn = cx_Oracle.makedsn("localhost", 1521, service_name="XEPDB1")
connection = cx_Oracle.connect(user="BetSyncDB", password="1234", dsn=dsn)

cursor = connection.cursor()
cursor.execute("SELECT 1 FROM dual")
print(cursor.fetchone())
