# -*- coding: utf-8 -*-
"""
Created on Tue Apr 21 12:34:54 2020

@author: guill
"""
import mysql.connector
import numpy as np
import pandas as pd

mydb = mysql.connector.connect(
  port = 3309,
  host="127.0.0.1",
  user="root",
  passwd="",
  database = 'nautiatoolkit'
)
cursor = mydb.cursor()

tablesNM = pd.read_csv("NMtablesCamp.csv")
tablesNM = np.array(tablesNM)
originTables = np.array([])
for column in tablesNM:
    for elem in column:
        elem = elem.replace("_has_camp","")
        elem = elem.replace("_has_country","")
        elem = elem.replace("_has_community","")
        originTables = np.append(originTables,elem)
print(originTables)