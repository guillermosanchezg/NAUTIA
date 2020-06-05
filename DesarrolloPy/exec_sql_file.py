# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 18:46:04 2020

@author: guill
"""

import re
import mysql.connector as c

def exec_sql_file(mydb,cursor, sql_file):
    print("\n[INFO] Executing SQL script file: '%s'" % (sql_file))
    statement = ""

    for line in open(sql_file):
        if re.match(r'--', line):  # ignore sql comment lines
            continue
        if not re.search(r';$', line):  # keep appending lines that don't end in ';'
            statement = statement + line
        else:  # when you get a line ending in ';' then exec statement and reset for next statement
            statement = statement + line
            try:
                cursor.execute(statement)
                mydb.commit()
            except (c.OperationalError, c.ProgrammingError) as e:
                print("\n[WARN] MySQLError during execute statement \n\tArgs: '%s'" % (str(e.args)))

            statement = ""