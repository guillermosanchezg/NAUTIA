# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 17:34:18 2020

@author: guill
"""

import numpy as np
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


GeneralData = pd.read_excel(getPath(mainpath,"Bibliography_120220.xlsx"))
GeneralData = fixBibliography(GeneralData)

df1 = dfFix(GeneralData,"Mujeres menores de 5 años (%)","Hombres mayores de 60 años (%)")
df2 = dfFix(GeneralData,"Growth rate of populatoin (%)","Life expentancy at birth (years)")
GD_Demography = concatDF(df1,df2) #Falta añadir clave foranea
mkCSV(GD_Demography,"GD_Demography.csv")

GD_Ethnicgroup = dfFix(GeneralData,"Ethnich group 1","Religion") #Falta añadir clave foranea
mkCSV(GD_Ethnicgroup,"GD_Ethnicgroup.csv")

df1 = dfFix(GeneralData,"Parliamentary republic","Territorial and Urbanistic")
GD_Government = df1 #Falta añadir clave foranea
GD_Government = GD_Government.isin(["Si"]) #Genera boolean DF. True si elem == "Si"
GD_Government = GD_Government.any() #Lista con indice de columna y True si un contiene un True o False en caso contrario
GD_Government = list(GD_Government[GD_Government == True].index) #lista de indices con true
GD_Government = pd.DataFrame(GD_Government)
mkCSV(GD_Government,"GD_Government.csv")

GD_Economy = dfFix(GeneralData,"Agriculture (%)","Government") #Falta añadir clave foranea
mkCSV(GD_Economy,"GD_Economy.csv")

df1 = dfFix(GeneralData,"Urban population (%)","Population density") 
df2 = dfFix(GeneralData,"Urban (inhabitants/hectares)","Infrastructures") 
GD_Urbanism = concatDF(df1,df2) #Falta añadir clave foranea
mkCSV(GD_Urbanism,"GD_Urbanism.csv")

df1 = dfFix(GeneralData,"Rural agua (%)","Access to improved sanitation") 
df2 = dfFix(GeneralData,"Rural saneamiento(%)","Access to electricity") 
df3 = dfFix(GeneralData,"Rural electricidad (%)","Matrix of electricity generation") 
df4 = concatDF(df1,df2)
GD_Infrastruture = concatDF(df4,df3) #Falta añadir clave foranea
mkCSV(GD_Infrastruture,"GD_Infrastruture.csv")

GD_ElectricGenerationMix = dfFix(GeneralData,"Hydropower (%)","High voltage (kV)") #Falta añadir clave foranea
mkCSV(GD_ElectricGenerationMix,"GD_ElectricGenerationMix.csv")

GD_ServiceAcces = dfFix(GeneralData,"Illiteracy rate (%)","Shelter") #Falta añadir clave foranea
mkCSV(GD_ServiceAcces,"GD_ServiceAcces.csv")

GD_Shelter = dfFix(GeneralData,"Slum population rate (%)","SPECIFIC INFORMATION - SETTLEMENTS LEVEL") #Falta añadir clave foranea
mkCSV(GD_Shelter,"GD_Shelter.csv")



