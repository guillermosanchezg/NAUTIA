# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 11:18:25 2020

@author: guill
"""

import setNMTables as setnm
import mysql.connector


mydb = mysql.connector.connect(
  port = 3309,
  host="127.0.0.1",
  user="root",
  passwd="",
  database = 'nautiatoolkit'
)
cursor = mydb.cursor()

setnm.setNMTables(0,cursor)