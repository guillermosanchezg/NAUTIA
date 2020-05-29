# -*- coding: utf-8 -*-
"""
Created on Thu Apr  2 10:47:28 2020

@author: guill
"""

import mysql.connector
import numpy as np

def validElem(elem):
    result = False
    if(elem != "community"):
        if(elem != "camp"):
            if(elem != "country"):
                if(elem.find("_has_") == -1):
                    if(elem != "hostcommunity"):
                        if(elem != "g_publicpolitic"):
                            if(elem != "inf_irrigationsystem"):
                                if(elem!= "inf_mobilityinfrastructure"):
                                    if(elem != "s_healthcenterservice"):
                                        if(elem != "u_landuse"):
                                            if(elem != "u_publicspace"):
                                                result = True
    return result

def validNMTable(elem):
    result = False
    if(elem.find("_has_") != -1):
        if(elem != "hostcommunity_has_camp"):
            if(elem != "s_subject_has_s_educationalcenter"):
                if(elem != "inf_expandplanbeneficiaries_has_inf_energyinfrastructure"):
                    result = True
    return result

def validColumn(column):
    result = False
    if(column[0] != "    "):
        if(column[0] != "Camp_idCamp"):
            if(column[0] != "Country_idCountry"):
                result = True
    return result
    
    
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
f = open('LoadDataCamp.sql','w+')
g = open('NMtablesCamp.csv','w+')

f.write("SET FOREIGN_KEY_CHECKS=0;\n")
f.write("SET SQL_SAFE_UPDATES = 0;\n")
f.write("SET @OLD_SQL_MODE=@@SQL_MODE, sql_mode='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';\n\n")

f.write(query1+"community.csv'\n"+query2+" community\n"+query3+"\n"+query4+"\n")
f.write("    (@Name)\n")
f.write("SET Name = NULLIF(@Name,'');\n")
f.write("SET @CommunityID = (SELECT idCommunity FROM community ORDER BY idCommunity DESC LIMIT 1);\n\n")

f.write(query1+"camp.csv'\n"+query2+" camp\n"+query3+"\n"+query4+"\n")
f.write("    (@StabilisationDate,@MigrationRate)\n")
f.write("SET StabilisationDate = NULLIF(@StabilisationDate,''),\n    MigrationRate = NULLIF(@MigrationRate,'');\n")
f.write("SET @campID = (SELECT idCamp FROM camp ORDER BY idCamp DESC LIMIT 1);\n\n")

f.write(query1+"Country.csv'\n"+query2+" Country\n"+query3+"\n"+query4+"\n")
f.write("    (@CountryName)\n")
f.write("SET CountryName = NULLIF(@CountryName,'');\n")
f.write("SET @CountryID = (SELECT idCountry FROM Country ORDER BY idCountry DESC LIMIT 1);\n\n")
        
cursor.execute("SHOW TABLES")
tablesList = cursor.fetchall()
tablesList = np.array(tablesList)

for row in tablesList:
    for elem in row:
        if(validElem(elem)):
            f.write(query1+elem+".csv'\n"+query2+" "+elem+"\n"+query3+"\n"+query4+"\n")
            cursor.execute("SHOW columns FROM "+elem)
            columnList = cursor.fetchall()
            pk = True
            string = np.array([],dtype = str)
            for column in columnList:
                if(pk):
                   pk = False
                else:
                    if(validColumn(column)):
                             string = np.append(string,column[0])
            f.write("    (")
            for column in string:
                if(column != string[-1]):
                   f.write("@"+column+",")
                else:
                   f.write("@"+column+")\n")
            f.write("SET ")
            for column in string:
                if(column != string[-1]):
                    if(column == string[0]):
                        f.write(column+" = NULLIF(@"+column+",''),\n")
                    else:
                        f.write("    "+column+" = NULLIF(@"+column+",''),\n")
                else:
                    if(column == string[0]):
                        f.write(column+" = NULLIF(@"+column+",'');\n\n")
                    else:
                        f.write("    "+column+" = NULLIF(@"+column+",'');\n\n")
        else:
            if(validNMTable(elem)):
                g.write(elem+"\n")                

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
                    f.write("UPDATE "+elem+" SET Community_idCommunity = (SELECT @CommunityID)\nWHERE "+elem+".Community_idCommunity = 0;\n\n")  
                else:
                    if(column == "Camp_idCamp"):
                        f.write("UPDATE "+elem+" SET Camp_idCamp = (SELECT @campID)\nWHERE "+elem+".Camp_idCamp = 0;\n\n")
                    else:
                        if(column == "Country_idCountry"):
                            f.write("UPDATE "+elem+" SET Country_idCountry = (SELECT @CountryID)\nWHERE "+elem+".Country_idCountry = 0;\n\n")

f.write("SET SQL_MODE=@OLD_SQL_MODE;\n")
f.write("SET FOREIGN_KEY_CHECKS = 1;\n")
f.write("SET SQL_SAFE_UPDATES = 1;\n\n")
f.close()
g.close()

