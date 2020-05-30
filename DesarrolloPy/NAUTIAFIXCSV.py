# -*- coding: utf-8 -*-
"""
Created on Sat May 30 10:53:22 2020

@author: guill
"""

import numpy as np
import pandas as pd
import os

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"

def getPath(mainpath,filename):
    return os.path.join(mainpath, filename)

def validColumn(cad):
    result = False
    if(cad == "index"):#Population
        result = True
    else:
        if(cad == "Type_of_settlement"):
            result = True
        else:
            if(cad == "General:settlement"):
                result = True
            else:
                if(cad == "general_info:_1_1_Choose_the_settlement"):
                    result = True
                else:
                    if(cad == "General_Information:Type_of_setlement"):
                        result = True
                    else:
                        if(cad == "General:Settlement"):
                            result = True
                        else:
                            if(cad == "Type_of_setlement"):
                                result = True
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

def dfFix(df,col1 = False,col2 = False):
    result = df.copy()
    if(col1):
        x = result.columns.get_loc(col1)
        result.drop(result.columns[0:x],axis = 1, inplace = True)
    if(col2):
        y = result.columns.get_loc(col2)
        result.drop(result.columns[y:],axis = 1, inplace = True)
    return result

def fixBibliography(df):
    df = dfFix(df,"GENERAL INFORMATION - COUNTRY LEVEL")
    df.columns = ['GeneralInfo', 'CommunityCountry', 'RefugeeCountry']
    df.set_index('GeneralInfo', inplace = True)
    df = df.transpose()
    df = df.reset_index()
    return df
