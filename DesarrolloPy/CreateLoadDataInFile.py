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

query1 = "LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/"
query2 = "INTO TABLE" 
query3 = "FIELDS TERMINATED BY ','"
query4 = "LINES TERMINATED BY '\\n'"
f = open('LoadDataScript.sql','w+')

f.write(query1+"community.csv'\n"+query2+" community\n"+query3+"\n"+query4+"\n")
cursor.execute("SHOW columns FROM  community")
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
    f.write(elem)
f.write(");\n\n")
    
f.write("SET @CommunityID = (SELECT idCommunity FROM community ORDER BY idCommunity DESC LIMIT 1);\n\n")
        
cursor.execute("SHOW TABLES")
tablesList = cursor.fetchall()
tablesList = np.array(tablesList)

for row in tablesList:
    for elem in row:
        if(elem != "community"):        
            f.write(query1+elem+".csv'\n"+query2+" "+elem+"\n"+query3+"\n"+query4+"\n")
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
            for column in string:
                if(column != string[-1]):
                   f.write("@v"+column+",")
                else:
                   f.write("@v"+column+");\n")
            f.write("SET ")
            for column in string:
               if(column != string[-1]):
                   f.write("    "+column+" = "+"if(@v"+column+"='',null,@v"+column+")")
               else:
                   if(column == string[0]):
                       f.write("    "+column+" = "+"if(@v"+column+"='',null,@v"+column+");\n\n")
                   else:
                       if(column != "Community_idCommunity"):
                           f.write(",\n    "+column+" = "+"if(@v"+column+"='',null,@v"+column+");\n\n") 
                       else:
                           f.write(";\n\n")
                           f.write("INSERT INTO "+elem+" (Community_idCommunity)\nVALUES (@CommunityID);\n\n")  
               if(column != string[-1] and column != string[-2]):
                   f.write(",\n")

f.close()