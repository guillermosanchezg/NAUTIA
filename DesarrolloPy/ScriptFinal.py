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
    return  pd.concat([df1,df2],axis = 1, sort = True)

def dropRow(df,index):
    return df.drop(df.index[index])

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

def getSubColumnNames(df,x):
    columns = df.columns
    array = []
    for column in columns:
        column = column[x:]
        array.append(column)
    return pd.DataFrame(array)

#%%
#CSV to DataFrame
Bibliography = pd.read_excel(getPath(mainpath,"Bibliography_120220.xlsx"))
Bibliography = fixBibliography(Bibliography)
Entities = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Entities_Interview_results.csv"))
LocalLeaders = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Local_leaders_v3_results.csv"))
HouseHold = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Survey_household_v6_results.csv"))
WomenGroup = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Women_Focus_Group2_results.csv"))
SanitationInfra = pd.read_csv(getPath(mainpath,"NAUTIA_V1_0_Sanitation_Infrastructre_results.csv"))
Priorities = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Priorities_v3_results.csv"))

#%%
#Community

community = ["Shimelba"]
community = pd.DataFrame(community)
mkCSV(community,"community.csv")
#%% 
#Camp

df1 = dfFix(Bibliography,"Implementation date of the refugee camp (year)","Migration reasons")
df2 = dfFix(Entities,"GENERAL_INFORMATION:Secondary_movement","GENERAL_INFORMATION:Relationship")
camp = concatDF(df1,df2)
camp = dropRow(camp,0)
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
df1 = dropRow(Commun_Religion,1)
np_array1 = np.array(df1)
df2 = dropRow(Commun_Religion,0)
np_array2 = np.array(df2)
np_array3 = np.concatenate((np_array1,np_array2), axis = 1)
Commun_Religion = pd.DataFrame(np_array3)
Commun_Religion = Commun_Religion.transpose()
Commun_Religion = Commun_Religion[0].unique()
Commun_Religion = pd.DataFrame(Commun_Religion)
Commun_Religion = Commun_Religion.dropna()
mkCSV(Commun_Religion,"Commun_Religion.csv")

Commun_Language = dfFix(Bibliography,"Language 1","Economy and well-being")
df1 = dropRow(Commun_Language,1)
np_array1 = np.array(df1)
df2 = dropRow(Commun_Language,0)
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
Camp_MovementReason = dropRow(Camp_MovementReason,0).dropna(axis = 1)
Camp_MovementReason = Camp_MovementReason.transpose()
mkCSV(Camp_MovementReason,"Camp_MovementReason.csv")

Camp_Integration = dfFix(Entities,"GENERAL_INFORMATION:Relationship","GENERAL_INFORMATION:Movement_outside")
mkCSV(Camp_Integration,"Camp_Integration.csv")

Camp_NaturalHazard = dfFix(Entities,"Enviormental_Issues:Risk:Risk_Flood","Enviormental_Issues:Deforestation")
Camp_NaturalHazard = getSubColumnNames(Camp_NaturalHazard,30)
mkCSV(Camp_NaturalHazard,"Camp_NaturalHazard.csv")

Camp_NaturalHazard_Has_Camp = dfFix(Entities,"Enviormental_Issues:Risk:Risk_Flood","Enviormental_Issues:Deforestation")
Camp_NaturalHazard_Has_Camp.transpose()
mkCSV(Camp_NaturalHazard_Has_Camp,"Camp_NaturalHazard_Has_Camp.csv") #1:Probar con datos 2:FKs4

Camp_LocalVegetation = dfFix(Entities,"Enviormental_Issues:Native_Plant","Enviormental_Issues:Native_Crops")
Camp_LocalVegetation.transpose()
mkCSV(Camp_LocalVegetation,"Camp_LocalVegetation.csv") #1:Probar con datos 2:MODIFICAR FOLMULARIO o probar con librería de PLN

Camp_LocalCrop = dfFix(Entities,"Enviormental_Issues:Native_Crops","Water_table")
Camp_LocalCrop.transpose()
mkCSV(Camp_LocalCrop,"Camp_LocalCrop.csv") #1:Probar con datos 2:MODIFICAR FOLMULARIO o probar con librería de PLN

df3 = dfFix(Entities,"Enviormental_Issues:High_enviormental_value","Enviormental_Issues:Native_Plant")
df4 = dfFix(Entities,"Enviormental_Issues:Deforestation","Enviormental_Issues:High_enviormental_value")
Camp_Enviroment = concatDF(df3,df4) #NO DEFINITIVO, controlar tipos de datos (Bool)
mkCSV(Camp_Enviroment,"Camp_Enviroment.csv")

df1 = dfFix(Bibliography,"Tropical (Write one: Af, Aw or Am)","Temperature")
df1 = dropRow(df1,0)
df1 = df1.transpose()
df1 = df1.dropna()
df1 = df1.transpose()
df2 = dfFix(Bibliography,"Max (ºC)","Annual precipitation")
df2 = dropRow(df2,0)
df3 = dfFix(Bibliography,"Max (mm)","Additional information")
df3 = dropRow(df3,0)
Camp_ClimaticRegion = concatDF(df1,concatDF(df2,df3))
mkCSV(Camp_ClimaticRegion,"Camp_ClimaticRegion.csv")

Camp_EnergySource = ['diesel','Kerosene','Ethanol','gas','firewood','diesel genset','electricity','solar panel']
Camp_EnergySource = pd.DataFrame(Camp_EnergySource)
mkCSV(Camp_EnergySource,"Camp_EnergySource.csv")

df1 = dfFix(Entities,"Fuel_Cost:Fuel_Cost_Diesel","ENERGY:Electricity_network")
df2 = dfFix(LocalLeaders,"Costs:cost_firewood","meta:instanceID")
Camp_EnergySource_Has_Camp = concatDF(df1,df2)
mkCSV(Camp_EnergySource_Has_Camp,"Camp_EnergySource_Has_Camp.csv") #ESTA MAL. Comprobar con datos reales

Camp_Mobility = dfFix(Entities,"GENERAL_INFORMATION:Movement_outside","Population:Women:Infants")
mkCSV(Camp_Mobility,"Camp_Mobility.csv")

Camp_Shelter = dfFix(Entities,"Shelter:Housing_Improvement","Shelter:Total_shelter")
mkCSV(Camp_Shelter,"Camp_Shelter.csv")

#%%SocioEconomic DATA
#%%SE Demographyc And Culture
#SE_population suma ESCALAR entre dos DF, necesito datos para probarlo

SE_HouseHoldComposition = dfFix(HouseHold,"General:Old_women","Shelter:No_Rooms")
array  = np.array(SE_HouseHoldComposition)
array[np.isnan(array)] = 0
array = array.astype(int)
young = array[:,1]+array[:,3]
array[:,1] = array[:,2]
array[:,2] = young
array[:,3] = array[:,4]
array = np.delete(array,4,1)
SE_HouseHoldComposition = pd.DataFrame(array)
mkCSV(SE_HouseHoldComposition,"SE_HouseHoldComposition.csv")

SE_PersonalHygiene = dfFix(Entities,"Sanitation:Personal_hygiene","Sanitation:Excreta")
mkCSV(Entities,"Entities.csv")

SE_CleaningMaterial = dfFix(Entities,"Sanitation:Excreta","Sanitation:Open_defecation")
mkCSV(SE_CleaningMaterial,"SE_CleaningMaterial.csv")

#%%Personal Safety

SE_SafetyPlace = dfFix(WomenGroup,"Feel_Safe:Street_morning","Feel_Safe:Firewood_collection_001")
SE_SafetyPlace = getSubColumnNames(SE_SafetyPlace,10)
mkCSV(SE_SafetyPlace,"SE_SafetyPlace.csv") 

SE_SafetyPlace_has_Community = dfFix(WomenGroup,"Feel_Safe:Street_morning","Feel_Safe:Firewood_collection_001")
mkCSV(SE_SafetyPlace_has_Community,"SE_SafetyPlace_has_Community.csv") 

#SE_ConflictArea: Los datos entran como string de lugares, pero se quiere guardar coordenadas.

df1 = dfFix(LocalLeaders,"Settlement_security:secur_committees","Food_security:cultivation_months")
df1 = df1.isin(["yes"]) #Genera boolean DF. True si elem == "yes"
df2 = dfFix(Entities,"Women_Patrol","Education_Issues")
df2 = df2.isin(["Yes"]) #Genera boolean DF. True si elem == "Yes"
SE_SafetyCommittee = concatDF(df1,df2)
mkCSV(SE_SafetyCommittee,"SE_SafetyCommittee.csv") 

SE_SafetyLatrines = dfFix(SanitationInfra, "Public_Latrines:Sex_segregated","Slab")
SE_SafetyLatrines = SE_SafetyLatrines.isin(["yes"]) #Genera boolean DF. True si elem == "Yes"
mkCSV(SE_SafetyLatrines,"SE_SafetyLatrines.csv") 


#%%SE_Economy

SE_Economy = dfFix(LocalLeaders, "Costs:cost_basic_basket","Costs:cost_firewood")
mkCSV(SE_Economy,"SE_Economy.csv") 

SE_IncomeTtype = dfFix(HouseHold, "Economy:Main_inco","Economy:Money")
mkCSV(SE_IncomeTtype,"SE_IncomeTtype.csv") 

df1 = dfFix(HouseHold, "General:Gender","General:Settlement")
df2 = dfFix(HouseHold, "Economy:Money","Economy:Food")
SE_IncomeTtype_has_Community = concatDF(df1,df2)
mkCSV(SE_IncomeTtype_has_Community,"SE_IncomeTtype_has_Community.csv") #mucho ojo con las PKs y FKs

SE_ExpenseType = ['food','clothes','water','education','transport','health','energy']
SE_ExpenseType = pd.DataFrame(SE_ExpenseType)
mkCSV(SE_ExpenseType,"SE_ExpenseType.csv")

df1 = dfFix(HouseHold, "General:Gender","General:Settlement")
df2 = dfFix(HouseHold, "Economy:Food","meta:instanceID")
array = np.array(df2)
array2 = np.array(df1)

income = []
gender = []
i = 0
for row in array:
    gen = array2[i]
    for elem in row:
        income = np.append(income,elem)
        gender = np.append(gender,gen)
    i+=1

gender = pd.DataFrame(gender)
gender = gender.reset_index(drop = True)
income = pd.DataFrame(income)
income = income.reset_index(drop = True)

SE_ExpenseType_has_Community = concatDF(gender,income)
mkCSV(SE_ExpenseType_has_Community,"SE_ExpenseType_has_Community.csv") 

priorities = ['energy','shelter','water access','sanitation','education','health','public space','food','TIC','work','waste management','public transport','religious center','socio cultural center','market']
priorities = pd.DataFrame(priorities)
mkCSV(priorities,"SE_Priorities.csv")

#df1 = dfFix(Priorities,"group_yf0yl72:Energy_1","Priority_2:Instruction")
#df2 = dfFix(Priorities,"Priority_2:Energy_2","Priority_3:Instruction_001")
#df2 = dfFix(Priorities,"Priority_3:Energy_3","Priority_4:Instruction_002")
#[...]
#mkCSV(SE_Priorities_has_Community,"SE_Priorities_has_Community.csv")  continuar cuando se tenga acceso a servidor ODK

#%% GenderData

#SE_GenderData = dfFix(Entities,"","")
#mkCSV(priorities,"SE_Priorities_has_Community.csv") No existe dicho dato en los formularios

#SE_WorkType no la encuentro en los formularios

#%%GOVERNMENT_DATA
#G_PublicPolitic no forma parte ETL





