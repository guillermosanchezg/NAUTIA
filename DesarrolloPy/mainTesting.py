# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 11:18:25 2020

@author: guill
"""

import exec_sql_file as sql
import os
import mysql.connector


mydb = mysql.connector.connect(
  port = 3309,
  host="127.0.0.1",
  user="root",
  passwd="",
  database = 'nautiatoolkit'
)

cursor = mydb.cursor()
sql.exec_sql_file(mydb,cursor,'LoadDataCamp.sql')