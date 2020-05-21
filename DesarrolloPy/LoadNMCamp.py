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

finalpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales"

def getPath(mainpath,filename):
    return os.path.join(mainpath, filename)

def mkCSV(df,fileName):
    df = df.dropna(how = 'all')
    df *= 1   
    fileName = fileName.lower()
    df.to_csv('DataSetFinales/'+fileName,sep=',',header = False, index=False, encoding='utf-8')
    
def concatDF(df1,df2):
    return  pd.concat([df1,df2],axis = 1, ignore_index = True, sort = True)

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
def specialTable(cad):
    result = False
    if(cad == "s_educationalcenter"):
        result = True
    else:
        if(cad == "s_primaryattention"):
            result = True
        else:
            if(cad == "s_hospital"):
                result = True
            else:
                if(cad == "s_othercenter"):
                    result = True
    return result

def isEducationalCenter(cad):
    result = False
    if(cad == "s_educationalcenter"):
        result = True           
    return result

def isOtherCenter(cad):
    result = False
    if(cad == "s_othercenter"):
        result = True           
    return result

def get_communityPK(elem):
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

def replacestr(df,cad1,cad2):
    cols=list(df.columns)
    for col in cols:
        df[col] = df[col].astype(str).str.replace(cad1,cad2)
    return df

def uniFormatTable(df):
    df = replacestr(df,"\r","")
    df = replacestr(df,"NaN","nan")
    df = replacestr(df,"None","nan")
    return df

def uniFormatDF(df):
    df = replacestr(df,"NaN","nan")
    df = replacestr(df,"None","nan")
    return df

def get_tablePK(table):
    cursor.execute("SELECT * FROM "+table)
    df1 = uniFormatTable(pd.DataFrame(cursor.fetchall()))
    df2 = pd.read_csv(getPath(finalpath,table+".csv"),header = None, float_precision = "high")
    df2 = uniFormatDF(df2)
    df1 = np.array(df1)
    pk = np.array([])
    for index, row in df2.iterrows():
        if(specialTable(table) == False):
            if((np.equal(np.array(row),df1[index][1:])).all()):
                pk = np.append(pk,df1[index][0])
        else:
            if(isEducationalCenter(table)):
                if((np.equal(np.array(row[:-2]),df1[index][1:-3])).all()):
                    pk = np.append(pk,df1[index][0])
            else:
                if(isOtherCenter(table) == False):
                    if((np.equal(np.array(row[:-1]),df1[index][1:-2])).all()):
                        pk = np.append(pk,df1[index][0])
                else:
                    if((np.equal(np.array(row[:-1]),df1[index][1:-1])).all()):
                        pk = np.append(pk,df1[index][0])                    

    return pd.DataFrame(pk)                     

#f = open('LoadDataCamp.sql','w+')

tablesNM = pd.read_csv("NMtablesCamp.csv")
tablesNM = np.array(tablesNM)
tables = np.array([])
originTables = np.array([])
for column in tablesNM:
    for elem in column:
        x = getTableName(elem)
        if(is_non_zero_file(getPath(finalpath,x+".csv"))):
            tablePK = get_tablePK(x)
            communityPK = get_communityPK(elem)
            arrayCommunity = np.array([])
            for index, row in tablePK.iterrows():
                arrayCommunity = np.append(arrayCommunity,communityPK[0][0])
            nmTableFK = concatDF(tablePK,pd.DataFrame(arrayCommunity))
            if(os.path.isfile(finalpath+"/"+elem+".csv")):
                df = pd.read_csv(finalpath+"/"+elem+".csv")
                nmTableFK = concatDF(nmTableFK,df)
            mkCSV(nmTableFK,elem+".csv")

                    
        
