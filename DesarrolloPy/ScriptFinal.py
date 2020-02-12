# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 17:34:18 2020

@author: guill
"""

import pandas as pd
import os

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"

def dfFix(df,col1 = False,col2 = False):
    result = df.copy()
    if(col1):
        x = result.columns.get_loc(col1)
        result.drop(result.columns[0:x],axis = 1, inplace = True)
    if(col2):
        y = result.columns.get_loc(col2)
        result.drop(result.columns[y:],axis = 1, inplace = True)
    return result
 
def concatDF(df1,df2):
    return  pd.concat([df1,df2],axis = 1)

def mkCSV(df,fileName):
    df.to_csv('DataSetFinales/'+fileName,header = False, index=False) #Header e index a false para no mostrarlo en el csv
  
    
def getPath(mainpath,filename):
    return os.path.join(mainpath, filename)

def fixBibliography(df):
    df = dfFix(df,"GENERAL INFORMATION - COUNTRY LEVEL")
    df.columns = ['GeneralInfo', 'CommunityCountry', 'RefugeeCountry']
    df.set_index('GeneralInfo', inplace = True)
    df = df.transpose()
    return df


GeneralData = pd.read_excel(getPath(mainpath,"Bibliography_290120.xlsx"))
GeneralData = fixBibliography(GeneralData)

df1 = dfFix(GeneralData,"Mujeres menores de 5 años (%)","Hombres mayores de 60 años (%)")
df2 = dfFix(GeneralData,"Growth rate of populatoin (%)","Life expentancy at birth (years)")
GD_Demography = concatDF(df1,df2) #Falta añadir clave foranea
mkCSV(GD_Demography,"GD_Demography.csv")

df1 = dfFix(GeneralData,"Ethnich group 1","Religion")
GD_Ethnicgroup = df1 #Falta añadir clave foranea
mkCSV(GD_Ethnicgroup,"GD_Ethnicgroup.csv")

