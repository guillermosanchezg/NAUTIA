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

f.write("SET FOREIGN_KEY_CHECKS = 0;\n")
f.write("SET SQL_SAFE_UPDATES = 0;\n\n")

f.write(query1+"community.csv'\n"+query2+" community\n"+query3+"\n"+query4+"\n")
f.write("    (Name);\n")
f.write("SET @CommunityID = (SELECT idCommunity FROM community ORDER BY idCommunity DESC LIMIT 1);\n\n")

f.write(query1+"camp.csv'\n"+query2+" camp\n"+query3+"\n"+query4+"\n")
f.write("    (StabilisationDate,MigrationRate);\n")
f.write("SET @campID = (SELECT idCamp FROM camp ORDER BY idCamp DESC LIMIT 1);\n\n")

f.write(query1+"Country.csv'\n"+query2+" Country\n"+query3+"\n"+query4+"\n")
f.write("    (CountryName);\n")
f.write("SET @CountryID = (SELECT idCountry FROM Country ORDER BY idCountry DESC LIMIT 1);\n\n")
        
cursor.execute("SHOW TABLES")
tablesList = cursor.fetchall()
tablesList = np.array(tablesList)

for row in tablesList:
    for elem in row:
        if(elem != "community" and elem != "camp" and elem != "country"):        
            f.write(query1+elem+".csv'\n"+query2+" "+elem+"\n"+query3+"\n"+query4+"\n")
            cursor.execute("SHOW columns FROM "+elem)
            columnList = cursor.fetchall()
            pk = True
            string = np.array([],dtype = str)
            for column in columnList:
                print(column)
                if(pk):
                   pk = False
                else:
                   string = np.append(string,column[0])
            f.write("    (")
            for column in string:
                if(column != string[-1]):
                   f.write(column+",")
                else:
                   f.write(column+");\n\n")

cursor.execute("SHOW TABLES")
tablesList = cursor.fetchall()
tablesList = np.array(tablesList)

for row in tablesList:
    for elem in row:
        cursor.execute("SHOW columns FROM "+elem)
        columnList = cursor.fetchall()
        pk = True
        string = np.array([],dtype = str)
        for column in columnList:
            if(pk):
                pk = False
            else:
                string = np.append(string,column[0])
            for column in string:
                if(column == "Community_idCommunity"):
                    f.write("UPDATE "+elem+" SET Community_idCommunity = (SELECT @CommunityID);\n\n")  
                else:
                    if(column == "Camp_idCamp"):
                        f.write("UPDATE "+elem+" SET Camp_idCamp = (SELECT @campID);\n\n")
                    else:
                        if(column == "Country_idCountry"):
                            f.write("UPDATE "+elem+" SET Country_idCountry = (SELECT @CountryID);\n\n")
f.write("SET FOREIGN_KEY_CHECKS = 1;\n")
f.write("SET SQL_SAFE_UPDATES = 1;\n\n")
f.close()
