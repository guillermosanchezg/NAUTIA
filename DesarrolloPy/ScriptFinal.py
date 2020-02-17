# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 17:34:18 2020

@author: guill
"""
#%%
import numpy as np
import pandas as pd
import os
#%%
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
#%%
#CSV to DataFrame
Bibliography = pd.read_excel(getPath(mainpath,"Bibliography_120220.xlsx"))
Bibliography = fixBibliography(Bibliography)
Entities = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Entities_Interview_results.csv"))

#%%
#Community

community = ["Shimelba"]
community = pd.DataFrame(community)
mkCSV(community,"community.csv")
#%% 
#Camp

df1 = dfFix(Bibliography,"Implementation date of the refugee camp (year)","Migration reasons")
df2 = dfFix(Entities,"GENERAL_INFORMATION:Secondary_movement","GENERAL_INFORMATION:Relationship")
df3 = dfFix(Entities,"Enviormental_Issues:High_enviormental_value","Enviormental_Issues:Native_Plant")
df4 = dfFix(Entities,"Enviormental_Issues:Deforestation","Enviormental_Issues:High_enviormental_value")
camp = concatDF(concatDF(df1,df2),concatDF(df3,df4))
camp = camp.drop(camp.index[0])
mkCSV(camp,"camp.csv")  
#%%
#Country

Country = dfFix(Bibliography,"Country's name", "Number of inhabitants (#)")
mkCSV(Country,"Country.csv")

#%%
#GENERAL DATA

df1 = dfFix(Bibliography,"Mujeres menores de 5 años (%)","Total population")
df2 = dfFix(Bibliography,"Growth rate of populatoin (%)","Culture")
GD_Demography = concatDF(df1,df2) 
mkCSV(GD_Demography,"GD_Demography.csv")

GD_Ethnicgroup = dfFix(Bibliography,"Ethnich group 1","Religion") 
mkCSV(GD_Ethnicgroup,"GD_Ethnicgroup.csv")

df1 = dfFix(Bibliography,"Parliamentary republic","Territorial and Urbanistic")
GD_Government = df1 
GD_Government = GD_Government.isin(["Si"]) #Genera boolean DF. True si elem == "Si"
GD_Government = GD_Government.any() #Lista con indice de columna y True si un contiene un True o False en caso contrario
GD_Government = list(GD_Government[GD_Government == True].index) #lista de indices con true
GD_Government = pd.DataFrame(GD_Government)
mkCSV(GD_Government,"GD_Government.csv")

GD_Economy = dfFix(Bibliography,"Agriculture (%)","Government") 
mkCSV(GD_Economy,"GD_Economy.csv")

df1 = dfFix(Bibliography,"Urban population (%)","Population density") 
df2 = dfFix(Bibliography,"Urban (inhabitants/hectares)","Infrastructures") 
GD_Urbanism = concatDF(df1,df2) 
mkCSV(GD_Urbanism,"GD_Urbanism.csv")

df1 = dfFix(Bibliography,"Rural agua (%)","Access to improved sanitation") 
df2 = dfFix(Bibliography,"Rural saneamiento(%)","Access to electricity") 
df3 = dfFix(Bibliography,"Rural electricidad (%)","Matrix of electricity generation") 
GD_Infrastruture = concatDF(concatDF(df1,df2),df3) 
mkCSV(GD_Infrastruture,"GD_Infrastruture.csv")

GD_ElectricGenerationMix = dfFix(Bibliography,"Hydropower (%)","High voltage (kV)") 
mkCSV(GD_ElectricGenerationMix,"GD_ElectricGenerationMix.csv")

GD_ServiceAcces = dfFix(Bibliography,"Illiteracy rate (%)","Shelter") 
mkCSV(GD_ServiceAcces,"GD_ServiceAcces.csv")

GD_Shelter = dfFix(Bibliography,"Slum population rate (%)","SPECIFIC INFORMATION - SETTLEMENTS LEVEL") 
mkCSV(GD_Shelter,"GD_Shelter.csv")

#%%
#COMMUN DATA

Commun_Religion = dfFix(Bibliography,"Religion 1","Language")
df1 = Commun_Religion.drop(Commun_Religion.index[1])
np_array1 = np.array(df1)
df2 = Commun_Religion.drop(Commun_Religion.index[0])
np_array2 = np.array(df2)
np_array3 = np.concatenate((np_array1,np_array2), axis = 1)
Commun_Religion = pd.DataFrame(np_array3)
Commun_Religion = Commun_Religion.transpose()
Commun_Religion = Commun_Religion[0].unique()
Commun_Religion = pd.DataFrame(Commun_Religion)
Commun_Religion = Commun_Religion.dropna()
mkCSV(Commun_Religion,"Commun_Religion.csv")

Commun_Language = dfFix(Bibliography,"Language 1","Economy and well-being")
df1 = Commun_Language.drop(Commun_Language.index[1])
np_array1 = np.array(df1)
df2 = Commun_Language.drop(Commun_Language.index[0])
np_array2 = np.array(df2)
np_array3 = np.concatenate((np_array1,np_array2), axis = 1)
Commun_Language = pd.DataFrame(np_array3)
Commun_Language = Commun_Language.transpose()
Commun_Language = Commun_Language[0].unique()
Commun_Language = pd.DataFrame(Commun_Language)
Commun_Language = Commun_Language.dropna()
mkCSV(Commun_Language,"Commun_Language.csv")


#%%
#Specific DATA CAMP

Camp_MovementReason = dfFix(Bibliography,"Reason 1","Climate")
Camp_MovementReason = Camp_MovementReason.drop(Camp_MovementReason.index[0]).dropna(axis = 1)
Camp_MovementReason = Camp_MovementReason.transpose()
mkCSV(Camp_MovementReason,"Camp_MovementReason.csv")

Camp_Integration = dfFix(Entities,"GENERAL_INFORMATION:Relationship","GENERAL_INFORMATION:Movement_outside")
mkCSV(Camp_Integration,"Camp_Integration.csv")

Camp_NaturalHazard = dfFix(Entities,"Enviormental_Issues:Risk:Risk_Flood","Enviormental_Issues:Deforestation")
columns = Camp_NaturalHazard.columns
array = []
for column in columns:
    column = column[30:]
    array.append(column)
Camp_NaturalHazard = pd.DataFrame(array)
mkCSV(Camp_NaturalHazard,"Camp_NaturalHazard.csv")

Camp_NaturalHazard_Has_Camp = dfFix(Entities,"Enviormental_Issues:Risk:Risk_Flood","Enviormental_Issues:Deforestation")
Camp_NaturalHazard_Has_Camp.transpose()
mkCSV(Camp_NaturalHazard_Has_Camp,"Camp_NaturalHazard_Has_Camp.csv") #1:Probar con datos 2:FKs4

Camp_LocalVegetation = dfFix(Entities,"Enviormental_Issues:Native_Plant","Enviormental_Issues:Native_Crops")
Camp_LocalVegetation.transpose()
mkCSV(Camp_LocalVegetation,"Camp_LocalVegetation.csv") #1:Probar con datos 2:MODIFICAR FOLMULARIO

Camp_LocalCrop = dfFix(Entities,"Enviormental_Issues:Native_Crops","Water_table")
Camp_LocalCrop.transpose()
mkCSV(Camp_LocalCrop,"Camp_LocalCrop.csv") #1:Probar con datos 2:MODIFICAR FOLMULARIO
