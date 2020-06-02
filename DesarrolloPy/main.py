# -*- coding: utf-8 -*-
"""
Created on Sun May 31 15:37:55 2020

@author: guill
"""

import ETLNAUTIA as nautia
import writeQuery as q
import setNMTables as setnm
import writeNMQuery as wnm
import cocectBD as bd
import dropAllFiles as drop
import exec_sql_file as sql
    
mydb,cursor = bd.cocectBD()

drop.dropAllFiles()
nautia.ETLNAUTIA(1)
q.writeQuery(1,cursor)
sql.exec_sql_file(mydb,cursor,'LoadDataCamp.sql')
setnm.setNMTables(1,cursor)
wnm.writeNMQuery(1,cursor)
sql.exec_sql_file(mydb,cursor,'LoadDataNMCamp.sql')
drop.dropAllFiles()
nautia.ETLNAUTIA(0)
q.writeQuery(0,cursor)
sql.exec_sql_file(mydb,cursor,'LoadDataHost.sql')
setnm.setNMTables(0,cursor)
wnm.writeNMQuery(0,cursor)
sql.exec_sql_file(mydb,cursor,'LoadDataNMHost.sql')
