# -*- coding: utf-8 -*-
"""
Created on Mon May 25 16:06:23 2020

@author: guill
"""

# -*- coding: utf-8 -*-
"""
Created on Thu Apr  2 10:47:28 2020

@author: guill
"""

import mysql.connector
import numpy as np
import pandas as pd
import os
import sklearn

from sklearn.feature_extraction.text import CountVectorizer
count_vectorizer = CountVectorizer()

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"

def NMTable(elem):
    result = False
    if(elem.find("_has_") >= 0):
        result = True
    return result

def specialTable(cad):
    result = False
    if(cad == "hostcommunity_has_camp"):
        result = True
    else:
        if(cad == "inf_expandplanbeneficiaries_has_inf_energyinfrastructure"):
            result = True
        else:
            if(cad == "inf_irrigationsystem_has_community"):
                result = True
            else:
                if(cad == "s_subject_has_s_educationalcenter"):
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
    if(column[0].find("id") != 0):
        result = True
    return result

def mkCSV(df,fileName):
    df = df.dropna(how = 'all')
    df *= 1   
    fileName = fileName.lower()
    df.to_csv('DataSetFinales/'+fileName,sep=',',header = False, index=False, encoding='utf-8')

def concatDF(df1,df2):
    return  pd.concat([df1,df2],axis = 1, ignore_index = True, sort = True)

def dfFix(df,col1 = False,col2 = False):
    result = df.copy()
    if(col1):
        x = result.columns.get_loc(col1)
        result.drop(result.columns[0:x],axis = 1, inplace = True)
    if(col2):
        y = result.columns.get_loc(col2)
        result.drop(result.columns[y:],axis = 1, inplace = True)
    return result

def separateValues(df):
    if(df.isnull().values.all(axis=0)):
        result = df
    else:
        array = np.array(df)
        count_vectorizer = CountVectorizer(stop_words = spanish_stopwords+english_stopwords)
        corpus = []
        for row in array:
            for elem in row:
                corpus = np.append(corpus,[elem])
        X = count_vectorizer.fit_transform(corpus)
        array = count_vectorizer.get_feature_names()
        result = pd.DataFrame(array)
    return result


def dropRow(df,i):
    return df.drop(index = i)

def get_communityRows(df,cad,communityType): #la función pd.loc[] tiene un bug indiscriminado (https://github.com/pandas-dev/pandas/issues/8555)
    result = df
    if(communityType == 0):
        comm = "host_community"
    else:
        comm = "refugee_camp"
    for index, row in df.iterrows():
        if(row[cad] != comm):
            result = dropRow(result,index)
    return result


def setDataByIndex(df,communityType):
    array = df.columns
    i = 0
    df = df.replace("refugee","refugee_camp")
    df = df.replace("host_comunity","host_community")
    df = df.replace("RefugeeCountry","refugee_camp")
    df = df.replace("CommunityCountry","host_community")
    while(validColumn(array[i]) == False):
        i += 1
    df = get_communityRows(df,array[i],communityType)
    return df

def getPath(mainpath,filename):
    return os.path.join(mainpath, filename)


mydb = mysql.connector.connect(
  port = 3309,
  host="127.0.0.1",
  user="root",
  passwd="",
  database = 'nautiatoolkit'
)
cursor = mydb.cursor()

Entities = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Entities_Interview_results.csv"),float_precision = "high"),1)
finalpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales"

def writteExpanPlan(query1,query2,query3,query4,):
    inf_expandplanbeneficiaries = dfFix(Entities,"ENERGY:Covered_services","ENERGY:Power_failure") 
    inf_expandplanbeneficiaries = separateValues(inf_expandplanbeneficiaries)
    cursor.execute("SELECT * FROM inf_expandplanbeneficiaries")
    array = np.array(cursor.fetchall())
    pk = np.array([])
    for row in array:
        for row2 in np.array(inf_expandplanbeneficiaries):
            for elem in row2:
                if(row[1] == elem):
                    pk = np.append(pk,elem)
    cursor.execute("SELECT idINF_EnergyInfrastructure FROM INF_EnergyInfrastructure  ORDER BY idINF_EnergyInfrastructure DESC LIMIT 1")
    pkInf = np.array(cursor.fetchall())
    cursor.execute("SELECT Community_idCommunity FROM INF_EnergyInfrastructure  ORDER BY Community_idCommunity DESC LIMIT 1")
    fkInf = np.array(cursor.fetchall())
    v1 = v2 = np.array([])
    for elem in pk:
        v1 = np.append(v1, pkInf)
        v2 = np.append(v2,fkInf)
    result = concatDF(pd.DataFrame(pk),concatDF(pd.DataFrame(v1),pd.DataFrame(v2)))
    mkCSV(result,"inf_expandplanbeneficiaries_has_inf_energyinfrastructure.csv")
    cursor.execute("SHOW columns FROM inf_expandplanbeneficiaries_has_inf_energyinfrastructure")
    columnList = cursor.fetchall()
    table = "inf_expandplanbeneficiaries_has_inf_energyinfrastructure"
    f.write(query1+table+".csv'\n"+query2+" "+table+"\n"+query3+"\n"+query4+"\n")
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
                
def getTableName(elem):
    x = ""
    if(elem.find("_has_camp") != -1):
        x = elem.replace("_has_camp","")
    else:
        if(elem.find("_has_country") != -1):
            x = elem.replace("_has_country","")
        else:
            if(elem.find("_has_community") != -1):
                x = elem.replace("_has_community","")
    return x

query1 = "LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/"
query2 = "INTO TABLE" 
query3 = "FIELDS TERMINATED BY ','"
query4 = "LINES TERMINATED BY '\\n'"
f = open('LoadDataNMHost.sql','w+')

f.write("SET FOREIGN_KEY_CHECKS=0;\n")
f.write("SET SQL_SAFE_UPDATES = 0;\n")
f.write("SET @OLD_SQL_MODE=@@SQL_MODE, sql_mode='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';\n\n")

        
cursor.execute("SHOW TABLES")
tablesList = cursor.fetchall()
tablesList = np.array(tablesList)
otherTable = np.array([])

for row in tablesList:
    for elem in row:
        if(elem.find("_has_camp") == -1):
            if(NMTable(elem)):
                x = getTableName(elem)
                if(is_non_zero_file(getPath(finalpath,x+".csv"))):
                    if(specialTable(elem) == False):
                        f.write(query1+elem+".csv'\n"+query2+" "+elem+"\n"+query3+"\n"+query4+"\n")
                        cursor.execute("SHOW columns FROM "+elem)
                        columnList = cursor.fetchall()
                        string = np.array([],dtype = str)
                        for column in columnList:
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
                        otherTable = np.append(otherTable,elem)

for elem in otherTable:
    if(elem == "inf_expandplanbeneficiaries_has_inf_energyinfrastructure"):
        writteExpanPlan(query1,query2,query3,query4)

                            
f.write("SET SQL_MODE=@OLD_SQL_MODE;\n")
f.write("SET FOREIGN_KEY_CHECKS = 1;\n")
f.write("SET SQL_SAFE_UPDATES = 1;\n\n")
f.close()
