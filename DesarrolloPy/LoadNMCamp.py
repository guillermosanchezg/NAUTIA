# -*- coding: utf-8 -*-
"""
Created on Tue Apr 21 12:34:54 2020

@author: guill
"""
import mysql.connector
import numpy as np
import pandas as pd
import os

def getPath(mainpath,filename):
    return os.path.join(mainpath, filename)

def is_non_zero_file(fpath):
    print(s.path.isfile(fpath))
    print(os.path.getsize(fpath))
    print(os.path.isfile(fpath) and os.path.getsize(fpath))
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

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales"

mydb = mysql.connector.connect(
  port = 3309,
  host="127.0.0.1",
  user="root",
  passwd="",
  database = 'nautiatoolkit'
)
cursor = mydb.cursor()
#f = open('LoadDataCamp.sql','w+')

if(pd.read_csv(getPath(mainpath,"inf_irrigationsystem.csv"))):
    table = pd.read_csv(getPath(mainpath,"inf_irrigationsystem.csv"))

tablesNM = pd.read_csv("NMtablesCamp.csv")
tablesNM = np.array(tablesNM)
tables = np.array([])
originTables = np.array([])
for column in tablesNM:
    for elem in column:
        x = getTableName(elem)
        if(is_non_zero_file(getPath(mainpath,x+".csv")) > 0):
            print("hola")
            try:
                table = pd.read_csv(getPath(mainpath,x+".csv"))
                print(table)
        #if(elem.find("_has_community") != -1):
            #f.write("INSERT INTO '"+elem+"' ("+elem+"_id"+elem",Community_idCommunity) VALUES ")
