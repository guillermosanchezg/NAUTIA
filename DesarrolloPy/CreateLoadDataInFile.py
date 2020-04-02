# -*- coding: utf-8 -*-
"""
Created on Thu Apr  2 10:47:28 2020

@author: guill
"""

import mysql.connector
import numpy as np

mydb = mysql.connector.connect(
  port = 3309,
  host="127.0.0.1",
  user="root",
  passwd="",
  database = 'nautiatoolkit'
)

cursor = mydb.cursor()
cursor.execute("SHOW TABLES")
tablesList = cursor.fetchall()
tablesList = np.array(tablesList)

query1 = "LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/"
query2 = "INTO TABLE" 
query3 = "FIELDS TERMINATED BY ','"
query4 = "LINES TERMINATED BY '\\n'"
f = open('LoadDataScript.sql','w+')
for row in tablesList:
    for elem in row:
        f.write(query1+elem+".csv'"+"\n"+query2+" "+elem+"\n"+query3+"\n"+query4+"\n")
    cursor.execute("SHOW columns FROM "+elem)
    columnList = cursor.fetchall()
    pk = True
    string = np.array([],dtype = str)
    for column in columnList:
        if(pk):
           pk = False
        else:
           string = np.append(string,column[0])
    f.write("    (")
    for elem in string:
        if(elem != string[-1]):
           f.write("@v"+elem+",")
        else:
           f.write("@v"+elem)
    f.write(")\n")
    f.write("SET ")
    for elem in string:
       if(elem != string[-1]):
           f.write("    "+elem+" = "+"if(@v"+elem+"='',null,@v"+elem+")")
       else:
           if(elem == string[0]):
               f.write("    "+elem+" = "+"if(@v"+elem+"='',null,@v"+elem+");\n\n")
           else:
               if(elem != "Community_idCommunity"):
                   f.write(",\n    "+elem+" = "+"if(@v"+elem+"='',null,@v"+elem+");\n\n") 
               else:
                   f.write(";\n\n")
       if(elem != string[-1] and elem != string[-2]):
           f.write(",\n")
f.close()