# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:35 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAETL as nt
import NAUTIAFIXCSV as nfv

def generalData(Bibliography):
    df1 = nfv.dfFix(Bibliography,"Mujeres menores de 5 años (%)","Total population")
    df2 = nfv.dfFix(Bibliography,"Growth rate of populatoin (%)","Culture")
    GD_Demography = nt.concatDF(df1,df2) 
    nt.mkCSV(GD_Demography,"GD_Demography.csv")
    
    GD_Ethnicgroup = nfv.dfFix(Bibliography,"Ethnich group 1","Religion").T 
    nt.mkCSV(GD_Ethnicgroup,"GD_Ethnicgroup.csv")
    
    df1 = nfv.dfFix(Bibliography,"Parliamentary republic","Territorial and Urbanistic")
    GD_Government = df1 
    GD_Government = GD_Government.isin(["Si"])
    GD_Government = GD_Government.any() #Lista con indice de columna y True si un contiene un True o False en caso contrario
    GD_Government = list(GD_Government[GD_Government == True].index) #lista de indices con true
    GD_Government = pd.DataFrame(GD_Government)
    nt.mkCSV(GD_Government,"GD_Government.csv")
    
    GD_Economy = nfv.dfFix(Bibliography,"Agriculture (%)","Government") 
    nt.mkCSV(GD_Economy,"GD_Economy.csv")
    
    df1 = nfv.dfFix(Bibliography,"Urban population (%)","Population density") 
    df2 = nfv.dfFix(Bibliography,"Urban (inhabitants/hectares)","Infrastructures") 
    GD_Urbanism = nt.concatDF(df1,df2) 
    nt.mkCSV(GD_Urbanism,"GD_Urbanism.csv")
    
    df1 = nfv.dfFix(Bibliography,"Rural agua (%)","Access to improved sanitation") 
    df2 = nfv.dfFix(Bibliography,"Rural saneamiento(%)","Access to electricity") 
    df3 = nfv.dfFix(Bibliography,"Rural electricidad (%)","Matrix of electricity generation") 
    GD_Infrastructure = nt.concatDF(nt.concatDF(df1,df2),df3) 
    nt.mkCSV(GD_Infrastructure,"GD_Infrastructure.csv")
    
    GD_ElectricGenerationMix = nfv.dfFix(Bibliography,"Hydropower (%)","High voltage (kV)") 
    nt.mkCSV(GD_ElectricGenerationMix,"GD_ElectricGenerationMix.csv")
    
    GD_ServiceAccess = nfv.dfFix(Bibliography,"Illiteracy rate (%)","Shelter") 
    nt.mkCSV(GD_ServiceAccess,"GD_ServiceAccess.csv")
    
    GD_Shelter = nfv.dfFix(Bibliography,"Slum population rate (%)","SPECIFIC INFORMATION - SETTLEMENTS LEVEL") 
    nt.mkCSV(GD_Shelter,"GD_Shelter.csv")
    
    Comun = pd.read_excel(nt.getPath(nt.mainpath,"Bibliography_120220.xlsx"))
    Comun = nt.fixBibliography(Comun)
    
    GD_Religion = nfv.dfFix(Comun,"Religion 1","Language")
    df1 = nfv.dropRow(GD_Religion,1)
    np_array1 = np.array(df1)
    df2 = nfv.dropRow(GD_Religion,0)
    np_array2 = np.array(df2)
    np_array3 = np.concatenate((np_array1,np_array2), axis = 1)
    GD_Religion = pd.DataFrame(np_array3)
    GD_Religion = GD_Religion.transpose()
    GD_Religion = GD_Religion[0].unique()
    GD_Religion = pd.DataFrame(GD_Religion)
    GD_Religion = GD_Religion.dropna()
    nt.mkCSV(GD_Religion,"GD_Religion.csv")
    
    GD_Language = nfv.dfFix(Comun,"Language 1","Economy and well-being")
    df1 = nfv.dropRow(GD_Language,1)
    np_array1 = np.array(df1)
    df2 = nfv.dropRow(GD_Language,0)
    np_array2 = np.array(df2)
    np_array3 = np.concatenate((np_array1,np_array2), axis = 1)
    GD_Language = pd.DataFrame(np_array3)
    GD_Language = GD_Language.transpose()
    GD_Language = GD_Language[0].unique()
    GD_Language = pd.DataFrame(GD_Language)
    GD_Language = GD_Language.dropna()
    nt.mkCSV(GD_Language,"GD_Language.csv")