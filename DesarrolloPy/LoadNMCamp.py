# -*- coding: utf-8 -*-
"""
Created on Tue Apr 21 12:34:54 2020

@author: guill
"""
import mysql.connector
import numpy as np
import pandas as pd
import os

mydb = mysql.connector.connect(
  port = 3309,
  host="127.0.0.1",
  user="root",
  passwd="",
  database = 'nautiatoolkit'
)
cursor = mydb.cursor()

def getPath(mainpath,filename):
    return os.path.join(mainpath, filename)

def mkCSV(df,fileName):
    df = df.dropna(how = 'all')
    df *= 1   
    fileName = fileName.lower()
    df.to_csv('DataSetFinales/'+fileName,sep=',',header = False, index=False, encoding='utf-8')

def is_non_zero_file(fpath):
    return os.path.isfile(fpath) and os.path.getsize(fpath)

def getTableName(elem):
    if(elem.find("_has_camp") != -1):
        x = elem.replace("_has_camp","")
    else:
        if(elem.find("_has_country") != -1):
            x = elem.replace("_has_country","")
        else:
            if(elem.find("_has_community") != -1):
                x = elem.replace("_has_community","")
    return x

def get_communityFK(elem):
    if(elem.find("_has_camp") != -1):
        cursor.execute("SELECT idCamp FROM camp ORDER BY idCamp DESC LIMIT 1")
    else:
        if(elem.find("_has_country") != -1):
                cursor.execute("SELECT idCountry FROM Country ORDER BY idCountry DESC LIMIT 1")
        else:
            if(elem.find("_has_community") != -1):
                cursor.execute("SELECT idCommunity FROM community ORDER BY idCommunity DESC LIMIT 1")
    return cursor.fetchall()

def get_tableFK(table):
    cursor.execute("SELECT id"+table+" FROM "+table+" ORDER BY id"+table+" DESC LIMIT 1")
    return cursor.fetchall()

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales"

#f = open('LoadDataCamp.sql','w+')

tablesNM = pd.read_csv("NMtablesCamp.csv")
tablesNM = np.array(tablesNM)
tables = np.array([])
originTables = np.array([])
for column in tablesNM:
    for elem in column:
        x = getTableName(elem)
        if(is_non_zero_file(getPath(mainpath,x+".csv"))):
            table = pd.read_csv(getPath(mainpath,x+".csv"))
            communityFK = get_communityFK(elem)
            print(elem)
            for index, row in table.iterrows():
               # print(tableFK[0][0],communityFK[0][0])
                #tableFK = get_tableFK(x)
                tables = np.append(tables,[tableFK[0][0],communityFK[0][0]])
            tables = pd.DataFrame(tables)
            mkCSV(tables,elem+".csv")
            

                    
                
        #if(elem.find("_has_community") != -1):
            #f.write("INSERT INTO '"+elem+"' ("+elem+"_id"+elem",Community_idCommunity) VALUES ")
