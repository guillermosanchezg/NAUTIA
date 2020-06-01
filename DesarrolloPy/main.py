# -*- coding: utf-8 -*-
"""
Created on Sun May 31 15:37:55 2020

@author: guill
"""

import ETLNAUTIA as nautia
import writeQuery as q
import mysql.connector
import setNMTables as setnm
    
mydb = mysql.connector.connect(
  port = 3309,
  host="127.0.0.1",
  user="root",
  passwd="",
  database = 'nautiatoolkit'
)
cursor = mydb.cursor()

#borrar dirctorio
nautia.ETLNAUTIA(1)
q.writeQuery(1,cursor)
# ejecución de sql
setnm.setNMTables(1)
#ejecutar sql NM
#Borrar directorio
nautia.ETLNAUTIA(0)
q.writeQuery(0,cursor)
# ejecución de sql
setnm.setNMTables(0)
#ejecutar sql NM
