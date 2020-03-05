# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 17:34:18 2020

@author: Guillermo Sánchez Gutiérrez-Cabello
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

def addInstitutionAndType(df,array1,array2,instType,index):
    refugees = dropRow(df,index)
    refugees = refugees.dropna(axis = 1)
    refugees = np.array(refugees)
    for row in refugees:
        for elem in row:
            array1 = np.append(array1,elem)
            array2 = np.append(array2,instType)
    return array1,array2

def politicalActor(df1,df2,df3,df4,df5,index):
    institution = []
    instType = []

    institution, instType  = addInstitutionAndType(df1,institution,instType,'Public Institution',index)
    institution, instType  = addInstitutionAndType(df2,institution,instType,'Private Institution',index)
    institution, instType  = addInstitutionAndType(df3,institution,instType,'NGO',index)
    institution, instType  = addInstitutionAndType(df4,institution,instType,'International Agency',index)
    institution, instType  = addInstitutionAndType(df5,institution,instType,'Local',index)

    institution = pd.DataFrame(institution)
    institution = institution.reset_index(drop = True)
    instType = pd.DataFrame(instType)
    instType = instType.reset_index(drop = True)
    
    return concatDF(institution,instType)

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
GeneralForm = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_General_form_v3_results.csv"))
PublicSpace = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Public_Space_results.csv"))
WaterInf = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Water_Infrastructure_results.csv"))
SanitationInf = pd.read_csv(getPath(mainpath,"NAUTIA_V1_0_Sanitation_Infrastructre_results.csv"))
WasteManagementInf = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Waste_Management_Infrastructure_results.csv"))
EnergyINF = pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Energy_Infrastructure_results.csv"))
Business = pd.read_csv(getPath(mainpath,"NAUTIA1_0_Business_surveys_v3_results.csv"))

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
mkCSV(SE_PersonalHygiene,"SE_PersonalHygiene.csv")

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

dfPublic = dfFix(Bibliography,"Public institutions","Private institutions")
dfPrivate = dfFix(Bibliography,"Private institutions","Non-profit organizations/NGOs")
dfNonProfit = dfFix(Bibliography,"Non-profit organizations/NGOs","International cooperation agencies")
dfInternational = dfFix(Bibliography,"International cooperation agencies","Local representatives/local committees/ local liders")
dfLocal = dfFix(Bibliography,"Local representatives/local committees/ local liders")

G_PoliticalActor1 = politicalActor(dfPublic,dfPrivate,dfNonProfit,dfInternational,dfLocal,0)
mkCSV(G_PoliticalActor1,"G_PoliticalActor1.csv")
G_PoliticalActor2 = politicalActor(dfPublic,dfPrivate,dfNonProfit,dfInternational,dfLocal,1)
mkCSV(G_PoliticalActor2,"G_PoliticalActor2.csv")

#%%FISICO AMBIENTALES DATA

df1 = dfFix(Bibliography,"Latitude","Topography")
df2 = dfFix(Entities,"Water_table","Sanitation:Personal_hygiene")
FA_geographicIdentification = concatDF(df1,df2)
mkCSV(FA_geographicIdentification,"FA_geographicIdentification.csv")

FA_Topography = dfFix(Bibliography,"Upper bound (m)","FOOD SECURITY")
mkCSV(FA_Topography,"FA_Topography.csv")

FA_NaturalResource = dfFix(Bibliography,"r.1","ACTORS (PARTNERS) IDENTIFICATION")
FA_NaturalResource = dropRow(FA_NaturalResource,0)
FA_NaturalResource = FA_NaturalResource.dropna(axis = 1)
FA_NaturalResource = np.array(FA_NaturalResource)
bound = []
resource = []
for row in FA_NaturalResource:
    for elem in row:
        bound = np.append(bound,elem)
        resource = np.append(resource,'river')
        
bound = pd.DataFrame(bound)
bound = bound.reset_index(drop = True)
resource = pd.DataFrame(resource)
resource = resource.reset_index(drop = True)

FA_NaturalResource = concatDF(bound,resource)
mkCSV(FA_NaturalResource,"FA_NaturalResource.csv")

#%% URBANISM DATA

df1 = dfFix(Entities,"Urban_Planning_001:Urban_Planning","Urban_Planning_001:Growth_area")
df2 = dfFix(GeneralForm,"Urban_information:Boundary_limits","Urban_information:Drain_system") 
df3 = dfFix(Entities,"Urban_Planning_001:Land_Managment","Urban_Planning_001:Risk_Managment")
df4 = dfFix(Entities,"Urban_Planning_001:Growth_area","Urban_Planning_001:Land_Managment")
df5 = dfFix(Entities,"Urban_Planning_001:Risk_Managment","Shelter:Housing_Improvement")
U_Urbanism = concatDF(df1,concatDF(df2,concatDF(df3,concatDF(df4,df5))))

#U_Area No está claro el origen de datos

#U_LandUse no sé de donde se coge la información del Plano

U_Road = dfFix(GeneralForm,"Urban_information:Drain_system","Energy:electrical_grid") 
mkCSV(U_Road,"U_Road.csv") #Falta la información que sale de Plano

df1 = dfFix(PublicSpace,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy") 
df2 = dfFix(PublicSpace,"Details:Shade_Areas","meta:instanceID") 
df2 = df2.isin(["yes"]) #Genera boolean DF. True si elem == "yes"
U_RecreationalArea = concatDF(df1,df2)
mkCSV(U_RecreationalArea,"U_RecreationalArea.csv")

#U_PublicSpace no sñe de donde se coge la información del plano

#%%INFRASTRUCTURE DATA

#%%Water

df1 = dfFix(Entities,"Water:Quality","Water:Treatment")
df2 = dfFix(Entities,"Water:Comsuption","Water:Time")
INF_WaterInfrastructure = concatDF(df1,df2)
mkCSV(INF_WaterInfrastructure,"INF_WaterInfrastructure.csv")    

INF_TimeSpent = dfFix(HouseHold,"Water:Water_col","health_001:Healthcare")
mkCSV(INF_TimeSpent,"INF_TimeSpent.csv")


INF_PotabilitationSystem = dfFix(Entities,"Water:Treatment","Water:Comsuption")
mkCSV(INF_PotabilitationSystem,"INF_PotabilitationSystem.csv") #PROBLEMA PLN

df1 = dfFix(WaterInf,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
df2 = dfFix(WaterInf,"Availability","meta:instanceID")
df2 = df2.isin(["yes"]) #Genera boolean DF. True si elem == "yes"
INF_WaterPoint = concatDF(df1,df2)
mkCSV(INF_WaterPoint,"INF_WaterPoint.csv")

#INF_IrrigationSystem No se encuentra el origen de datos.

#%%Sanitation

df1 = dfFix(Entities,"Sanitation:Open_defecation","Sanitation:Type_of_Latrine")
df1 = df1.isin(["yes"]) #Genera boolean DF. True si elem == "yes"
df2 = dfFix(Entities,"Sanitation:Type_of_Latrine","Sanitation:Individual_Latrines")
INF_SanitationAccess = concatDF(df1,df2)
mkCSV(INF_SanitationAccess,"INF_SanitationAccess.csv")

INF_SanitationSystmeQuality = dfFix(SanitationInf,"Slab","meta:instanceID")
INF_SanitationSystmeQuality = INF_SanitationSystmeQuality.isin(["yes"]) #Genera boolean DF. True si elem == "yes"
mkCSV(INF_SanitationSystmeQuality,"INF_SanitationSystmeQuality.csv")

#%%WasteManagement

INF_WasteManagementInf = dfFix(Entities,"Waste_Managment:Waste_Collection","Waste_Managment:Landfill_Details:Location_1")
mkCSV(INF_WasteManagementInf,"INF_WasteManagementInf.csv")

INF_landFill = dfFix(Entities,"Waste_Managment:Landfill_Details:Location_1","Water:Quality")
mkCSV(INF_landFill,"INF_landFill.csv")

INF_CollectionPoints = dfFix(WasteManagementInf,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
mkCSV(INF_CollectionPoints,"INF_CollectionPoints.csv")


#%%Energy

df1 = dfFix(GeneralForm,"Energy:electrical_grid","Energy:power_point")
df1 = df1.isin(["yes"]) #Genera boolean DF. True si elem == "yes"
df2 = dfFix(Entities,"ENERGY:Electricity_network","ENERGY:Covered_services")
df2 = df2.isin(["yes"]) #Genera boolean DF. True si elem == "yes"
df3 = dfFix(Entities,"ENERGY:Power_failure","ENERGY:Street_Light")
df4 = dfFix(Entities,"ENERGY:Street_Light","Urban_Planning_001:Urban_Planning")
df4 = df4.isin(["yes"]) #Genera boolean DF. True si elem == "yes"
df5 = dfFix(GeneralForm,"Energy:Distance_ST","Transport:Kind_transport_inside")
INF_EnergyInfrastructure = concatDF(df1,(concatDF(df2,concatDF(df3,concatDF(df4,df5)))))
mkCSV(INF_EnergyInfrastructure,"INF_EnergyInfrastructure")

INF_ExpandPlandBeneficiaries = dfFix(Entities,"ENERGY:Covered_services","ENERGY:Power_failure") #Posible problema PLN
mkCSV(INF_ExpandPlandBeneficiaries,"INF_ExpandPlandBeneficiaries.csv") 

INF_GenerationSource = ['electrical grid','diesel genset','solar panel','other']
INF_GenerationSource = pd.DataFrame(INF_GenerationSource)
mkCSV(INF_GenerationSource,"INF_GenerationSource.csv")



