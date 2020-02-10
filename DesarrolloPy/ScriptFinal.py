# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 17:34:18 2020

@author: guill
"""

import pandas as pd
import os

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"

def dfFix(df,col1,col2):
    result = df.copy()
    x = result.columns.get_loc(col1)
    result.drop(result.columns[0:x],axis = 1, inplace = True)
    y = result.columns.get_loc(col2)
    result.drop(result.columns[y+1:],axis = 1, inplace = True)
    return result

    
def concatDF(df1,df2):
    return  pd.concat([df1,df2],axis = 1)

def mkCSV(df,fileName):
    df.reset_index().to_csv('DataSetFinales/'+fileName,header = True, index=False)
    
def getPath(mainpath,filename):
    return os.path.join(mainpath, filename)

def fixBibliography(df):
    df = dfFix(df,"GENERAL INFORMATION - COUNTRY LEVEL","Unnamed: 2")
    df.columns = ['GeneralInfo', 'CommunityCountry', 'RefugeeCountry']
    df = df.transpose()
    df.columns = df.iloc[0]   #to set the real columns names
    df = df.drop(df.index[0])
    return df


GeneralData = pd.read_excel(getPath(mainpath,"Bibliography_290120.xlsx"))
GeneralData = fixBibliography(GeneralData)

df1 = dfFix(GeneralData,"Mujeres menores de 5 años (%)","Hombres mayores de 60 años (%)")
df2 = dfFix(GeneralData,"Growth rate of populatoin (%)","Life expentancy at birth (years)")
GD_Demography = concatDF(df1,df2) #Falta añadir clave foranea
mkCSV(GD_Demography,"GD_Demography.csv")