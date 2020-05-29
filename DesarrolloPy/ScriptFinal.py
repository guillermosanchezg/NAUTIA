# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 17:34:18 2020

@author: Guillermo Sánchez Gutiérrez-Cabello
"""
# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 17:34:18 2020

@author: Guillermo Sánchez Gutiérrez-Cabello
"""
#%%
import numpy as np
import pandas as pd
import NAUTIAETL as nt
#pd.options.mode.chained_assignment = None  # default='warn'

#%% CSV to DataFrame
Bibliography,Entities,LocalLeaders,HouseHold,WomenGroup,SanitationInfra,Priorities,GeneralForm,PublicSpace,WaterInf,EnergyINF,SanitationInf,WasteManagementInf,EnergyINF,Business,MobilityINF,ComunalServices,GeneralCitizen,Shelter,FarmyardCrop = nt.set_AllCSVtoDF(0)
#%%Community

community = ["Shimelba"]
community = pd.DataFrame(community)
nt.nt.mkCSV(community,"community.csv")
#%% CAMP

df1 = nt.dfFix(Bibliography,"Implementation date of the refugee camp (year)","Migration reasons")
df2 = nt.dfFix(Entities,"GENERAL_INFORMATION:Secondary_movement","GENERAL_INFORMATION:Relationship")
df2 = df2['GENERAL_INFORMATION:Secondary_movement'].mean()
array = np.array([df2])
camp = nt.concatDF(df1,pd.DataFrame(array))
nt.mkCSV(camp,"camp.csv") 
#%%Country

Country = nt.dfFix(Bibliography,"Country's name", "Number of inhabitants (#)")
nt.mkCSV(Country,"Country.csv")

#%%GENERAL DATA

df1 = nt.dfFix(Bibliography,"Mujeres menores de 5 años (%)","Total population")
df2 = nt.dfFix(Bibliography,"Growth rate of populatoin (%)","Culture")
GD_Demography = nt.concatDF(df1,df2) 
nt.mkCSV(GD_Demography,"GD_Demography.csv")

GD_Ethnicgroup = nt.dfFix(Bibliography,"Ethnich group 1","Religion").T 
nt.mkCSV(GD_Ethnicgroup,"GD_Ethnicgroup.csv")

df1 = nt.dfFix(Bibliography,"Parliamentary republic","Territorial and Urbanistic")
GD_Government = df1 
GD_Government = GD_Government.isin(["Si"])
GD_Government = GD_Government.any() #Lista con indice de columna y True si un contiene un True o False en caso contrario
GD_Government = list(GD_Government[GD_Government == True].index) #lista de indices con true
GD_Government = pd.DataFrame(GD_Government)
nt.mkCSV(GD_Government,"GD_Government.csv")

GD_Economy = nt.dfFix(Bibliography,"Agriculture (%)","Government") 
nt.mkCSV(GD_Economy,"GD_Economy.csv")

df1 = nt.dfFix(Bibliography,"Urban population (%)","Population density") 
df2 = nt.dfFix(Bibliography,"Urban (inhabitants/hectares)","Infrastructures") 
GD_Urbanism = nt.concatDF(df1,df2) 
nt.mkCSV(GD_Urbanism,"GD_Urbanism.csv")

df1 = nt.dfFix(Bibliography,"Rural agua (%)","Access to improved sanitation") 
df2 = nt.dfFix(Bibliography,"Rural saneamiento(%)","Access to electricity") 
df3 = nt.dfFix(Bibliography,"Rural electricidad (%)","Matrix of electricity generation") 
GD_Infrastructure = nt.concatDF(nt.concatDF(df1,df2),df3) 
nt.mkCSV(GD_Infrastructure,"GD_Infrastructure.csv")

GD_ElectricGenerationMix = nt.dfFix(Bibliography,"Hydropower (%)","High voltage (kV)") 
nt.mkCSV(GD_ElectricGenerationMix,"GD_ElectricGenerationMix.csv")

GD_ServiceAccess = nt.dfFix(Bibliography,"Illiteracy rate (%)","Shelter") 
nt.mkCSV(GD_ServiceAccess,"GD_ServiceAccess.csv")

GD_Shelter = nt.dfFix(Bibliography,"Slum population rate (%)","SPECIFIC INFORMATION - SETTLEMENTS LEVEL") 
nt.mkCSV(GD_Shelter,"GD_Shelter.csv")

#%%COMMUN DATA
Comun = pd.read_excel(nt.getPath(nt.mainpath,"Bibliography_120220.xlsx"))
Comun = nt.fixBibliography(Comun)

GD_Religion = nt.dfFix(Comun,"Religion 1","Language")
df1 = nt.dropRow(GD_Religion,1)
np_array1 = np.array(df1)
df2 = nt.dropRow(GD_Religion,0)
np_array2 = np.array(df2)
np_array3 = np.concatenate((np_array1,np_array2), axis = 1)
GD_Religion = pd.DataFrame(np_array3)
GD_Religion = GD_Religion.transpose()
GD_Religion = GD_Religion[0].unique()
GD_Religion = pd.DataFrame(GD_Religion)
GD_Religion = GD_Religion.dropna()
nt.mkCSV(GD_Religion,"GD_Religion.csv")

GD_Language = nt.dfFix(Comun,"Language 1","Economy and well-being")
df1 = nt.dropRow(GD_Language,1)
np_array1 = np.array(df1)
df2 = nt.dropRow(GD_Language,0)
np_array2 = np.array(df2)
np_array3 = np.concatenate((np_array1,np_array2), axis = 1)
GD_Language = pd.DataFrame(np_array3)
GD_Language = GD_Language.transpose()
GD_Language = GD_Language[0].unique()
GD_Language = pd.DataFrame(GD_Language)
GD_Language = GD_Language.dropna()
nt.mkCSV(GD_Language,"GD_Language.csv")


#%% Specific DATA CAMP

Camp_MovementReason = nt.dfFix(Bibliography,"Reason 1","Climate")
Camp_MovementReason = Camp_MovementReason.transpose()
nt.mkCSV(Camp_MovementReason,"Camp_MovementReason.csv")

Camp_Integration = nt.dfFix(Entities,"GENERAL_INFORMATION:Relationship","GENERAL_INFORMATION:Movement_outside")
nt.mkCSV(Camp_Integration,"Camp_Integration.csv")

Camp_NaturalHazard = nt.dfFix(Entities,"Enviormental_Issues:Risk:Risk_Flood","Enviormental_Issues:Deforestation")
Camp_NaturalHazard = nt.getSubColumnNames(Camp_NaturalHazard,30)
nt.mkCSV(Camp_NaturalHazard,"Camp_NaturalHazard.csv")

Camp_NaturalHazard_Has_Camp = nt.dfFix(Entities,"Enviormental_Issues:Risk:Risk_Flood","Enviormental_Issues:Deforestation")
hazards = nt.getSubColumnNames(Camp_NaturalHazard_Has_Camp,30)
Camp_NaturalHazard_Has_Camp = nt.get_number(Camp_NaturalHazard_Has_Camp,hazards)
nt.mkCSV(Camp_NaturalHazard_Has_Camp,"Camp_NaturalHazard_Has_Camp.csv")

Camp_LocalVegetation = nt.dfFix(Entities,"Enviormental_Issues:Native_Plant","Enviormental_Issues:Native_Crops")
Camp_LocalVegetation = nt.separateValues(Camp_LocalVegetation)
nt.mkCSV(Camp_LocalVegetation,"Camp_LocalVegetation.csv") # ¿MODIFICAR FOLMULARIO? 

Camp_LocalCrop = nt.dfFix(Entities,"Enviormental_Issues:Native_Crops","Water_table")
Camp_LocalCrop = nt.separateValues(Camp_LocalCrop)
nt.mkCSV(Camp_LocalCrop,"Camp_LocalCrop.csv") #MODIFICAR FOLMULARIO?

df3 = nt.dfFix(Entities,"Enviormental_Issues:High_enviormental_value","Enviormental_Issues:Native_Plant")
df3 = df3.isin(["yes"])
df4 = nt.dfFix(Entities,"Enviormental_Issues:Deforestation","Enviormental_Issues:High_enviormental_value")
Camp_Enviroment = nt.concatDF(df3,df4)
nt.mkCSV(Camp_Enviroment,"Camp_Enviroment.csv")

df1 = nt.dfFix(Bibliography,"Tropical (Write one: Af, Aw or Am)","Temperature")
df1 = df1.transpose()
df1 = df1.dropna()
df1 = df1.transpose()
df2 = nt.dfFix(Bibliography,"Max (ºC)","Annual precipitation")
df3 = nt.dfFix(Bibliography,"Max (mm)","Additional information")
Camp_ClimaticRegion = nt.concatDF(df1,nt.concatDF(df2,df3))
nt.mkCSV(Camp_ClimaticRegion,"Camp_ClimaticRegion.csv")

Camp_EnergySource = ['diesel','Kerosene','Ethanol','gas','firewood','diesel genset','electricity','solar panel']
Camp_EnergySource = pd.DataFrame(Camp_EnergySource)
nt.mkCSV(Camp_EnergySource,"Camp_EnergySource.csv")

df1 = nt.dfFix(Entities,"Fuel_Cost:Fuel_Cost_Diesel","ENERGY:Electricity_network")
df2 = nt.dfFix(LocalLeaders,"Costs:cost_firewood","meta:instanceID")
Camp_EnergySource_Has_Camp = nt.concatDF(df1,df2)
source = pd.DataFrame(['diesel','Kerosene','Ethanol','gas','firewood','diesel genset','electricity','solar panel'])
Camp_EnergySource_Has_Camp = nt.get_number(Camp_EnergySource_Has_Camp,source)
nt.mkCSV(Camp_EnergySource_Has_Camp,"Camp_EnergySource_Has_Camp.csv")

Camp_Mobility = nt.dfFix(Entities,"GENERAL_INFORMATION:Movement_outside","Population:Women:Infants")
nt.mkCSV(Camp_Mobility,"Camp_Mobility.csv")

Camp_Shelter = nt.dfFix(Entities,"Shelter:Housing_Improvement","Shelter:Total_shelter")
nt.mkCSV(Camp_Shelter,"Camp_Shelter.csv")

#%%SocioEconomic DATA
#%%SE Demographyc And Culture

df1 = nt.dfFix(Entities,"Population:Women:Infants","Population:Men:Infants_001")
df2 = nt.dfFix(Entities,"Population:Men:Infants_001","Fuel_Cost:Main_Fuel")
df1 = np.array(df1)
df2 = np.array(df2)
array = np.array([],dtype = int)
array = df1+df2
SE_population = pd.DataFrame(array)
nt.mkCSV(SE_population,"SE_population.csv")

SE_HouseHoldComposition = nt.dfFix(HouseHold,"General:Old_women","Shelter:No_Rooms")
array  = np.array(SE_HouseHoldComposition)
array[np.isnan(array)] = 0
array = array.astype(int)
young = array[:,1]+array[:,3]
array[:,1] = array[:,2]
array[:,2] = young
array[:,3] = array[:,4]
array = np.delete(array,4,1)
SE_HouseHoldComposition = pd.DataFrame(array)
nt.mkCSV(SE_HouseHoldComposition,"SE_HouseHoldComposition.csv")

SE_PersonalHygiene = nt.dfFix(Entities,"Sanitation:Personal_hygiene","Sanitation:Excreta")
nt.mkCSV(SE_PersonalHygiene,"SE_PersonalHygiene.csv")

SE_CleaningMaterial = nt.dfFix(Entities,"Sanitation:Excreta","Sanitation:Open_defecation")
nt.mkCSV(SE_CleaningMaterial,"SE_CleaningMaterial.csv")

#%%Personal Safety

SE_SafetyPlace = nt.dfFix(WomenGroup,"Feel_Safe:Street_morning","Feel_Safe:Firewood_collection_001")
SE_SafetyPlace = nt.getSubColumnNames(SE_SafetyPlace,10)
nt.mkCSV(SE_SafetyPlace,"SE_SafetyPlace.csv") 

SE_SafetyPlace_has_Community = nt.dfFix(WomenGroup,"Feel_Safe:Street_morning","Feel_Safe:Firewood_collection_001")
SE_SafetyPlace = pd.DataFrame()
SE_SafetyPlace = nt.getSubColumnNames(SE_SafetyPlace_has_Community,10)
array1 = np.array([])
for row in np.array(SE_SafetyPlace_has_Community):
    for row2 in np.array(SE_SafetyPlace):
        for elem2 in row2:
            array1 = np.append(array1,elem2)
SE_SafetyPlace_has_Community = pd.DataFrame(np.array(SE_SafetyPlace_has_Community))
SE_SafetyPlace_has_Community = nt.concatDF(SE_SafetyPlace_has_Community.T,pd.DataFrame(array1))
nt.mkCSV(SE_SafetyPlace_has_Community,"SE_SafetyPlace_has_Community.csv") 

SE_ConflictArea = nt.dfFix(WomenGroup,"Trouble_Spots","Cooking_Details:INSTRUCTION_001")
SE_ConflictArea = SE_ConflictArea.dropna()
SE_ConflictArea = nt.separateValues(SE_ConflictArea)
nt.mkCSV(SE_ConflictArea,"SE_ConflictArea.csv") #IMPORRANTE Los datos entran como string de lugares, pero se quiere guardar coordenadas.

df1 = nt.dfFix(LocalLeaders,"Settlement_security:secur_committees","Food_security:cultivation_months")
df1 = df1.isin(["yes"])
df2 = nt.dfFix(Entities,"Women_Patrol","Education_Issues")
df2 = df2.isin(["Yes"])
SE_SafetyCommittee = nt.concatDF(df1,df2)
nt.mkCSV(SE_SafetyCommittee,"SE_SafetyCommittee.csv") 

SE_SafetyLatrines = nt.dfFix(SanitationInfra, "Public_Latrines:Sex_segregated","Slab")
SE_SafetyLatrines = SE_SafetyLatrines.isin(["yes"])
nt.mkCSV(SE_SafetyLatrines,"SE_SafetyLatrines.csv") 


#%%SE_Economy

SE_Economy = nt.dfFix(LocalLeaders, "Costs:cost_basic_basket","Costs:cost_firewood")
nt.mkCSV(SE_Economy,"SE_Economy.csv") 

SE_Incometype = nt.dfFix(HouseHold, "Economy:Main_inco","Economy:Money")
nt.mkCSV(SE_Incometype,"SE_Incometype.csv") 

df1 = nt.dfFix(HouseHold, "General:Gender","General:Settlement")
df2 = nt.dfFix(HouseHold, "Economy:Money","Economy:Food")
SE_IncomeTtype_has_Community = nt.concatDF(df1,df2)
nt.mkCSV(SE_IncomeTtype_has_Community,"SE_IncomeTtype_has_Community.csv")

SE_ExpenseType = ['food','clothes','water','education','transport','health','energy']
SE_ExpenseType = pd.DataFrame(SE_ExpenseType)
nt.mkCSV(SE_ExpenseType,"SE_ExpenseType.csv")

df1 = nt.dfFix(HouseHold, "General:Gender","General:Settlement")
df2 = nt.dfFix(HouseHold, "Economy:Food","meta:instanceID")
df3 = pd.DataFrame(['food','clothes','water','education','transport','health','energy'])
SE_ExpenseType_has_Community = nt.get_claveValor(df1,df2,df3)
nt.mkCSV(SE_ExpenseType_has_Community,"SE_ExpenseType_has_Community.csv")

priority = ['energy','shelter','water access','sanitation','education','health','public space','food','TIC','work','waste management','public transport','religious center','socio cultural center','market']
priority = pd.DataFrame(priority)
nt.mkCSV(priority,"se_priority.csv")

df1 = nt.dfFix(Priorities,"group_yf0yl72:Energy_1","Priority_2:Instruction")
df2 = nt.dfFix(Priorities,"Priority_2:Energy_2","Priority_3:Instruction_001")
df3 = nt.dfFix(Priorities,"Priority_3:Energy_3","Priority_4:Instruction_002")
df4 = nt.dfFix(Priorities,"Priority_4:Energy_4_001","Priority_5:Instruction_003")
df5 = nt.dfFix(Priorities,"Priority_5:Energy_4","meta:instanceID")
SE_Priority_has_Community = nt.concatDF(df1,(nt.concatDF(df2,nt.concatDF(df3,nt.concatDF(df4,df5)))))
SE_Priority_has_Community = pd.DataFrame(SE_Priority_has_Community.sum())
priority = np.array(['energy','shelter','water access','sanitation','education','health','public space','food','TIC','work','waste management','public transport','religious center','socio cultural center','market'])
array1 = np.array([])
array2 = np.array([])
for i in range(5):
    for elem in priority:
        array1 = np.append(array1,elem)
        array2 = np.append(array2,i+1)
SE_Priority_has_Community = nt.concatDF(SE_Priority_has_Community,nt.concatDF(pd.DataFrame(array1),pd.DataFrame(array2)))
nt.mkCSV(SE_Priority_has_Community,"SE_Priority_has_Community.csv")

#%% GenderData

#SE_GenderData = nt.dfFix(Entities,"","")
#nt.mkCSV(SE_GenderData,"SE_GenderData.csv") No existe dicho dato en los formularios

SE_WorkType = ["Firewood Collection", "Cooking"]
SE_WorkType = pd.DataFrame(SE_WorkType)
nt.mkCSV(SE_WorkType,"SE_WorkType.csv")

df1 = nt.dfFix(GeneralCitizen,"Firewood_collection:Childs","Cooking:Childs_001")
df2 = nt.dfFix(GeneralCitizen,"Cooking:Childs_001","TICs_Knowledge:Phone_Call")
df1 = df1.transpose()
df2 = df2.transpose()
df1 = df1.reset_index(drop = True)
df2 = df2.reset_index(drop = True)
SE_WorkType_has_Community = nt.concatDF(df1,df2).T
SE_WorkType = ["Firewood Collection", "Cooking"]
SE_WorkType_has_Community = nt.concatDF(SE_WorkType_has_Community,pd.DataFrame(SE_WorkType))
nt.mkCSV(SE_WorkType_has_Community,"SE_WorkType_has_Community.csv")

#%%GOVERNMENT_DATA
#G_PublicPolitic no forma parte ETL

dfPublic = nt.dfFix(Bibliography,"Public institutions","Private institutions")
dfPrivate = nt.dfFix(Bibliography,"Private institutions","Non-profit organizations/NGOs")
dfNonProfit = nt.dfFix(Bibliography,"Non-profit organizations/NGOs","International cooperation agencies")
dfInternational = nt.dfFix(Bibliography,"International cooperation agencies","Local representatives/local committees/ local liders")
dfLocal = nt.dfFix(Bibliography,"Local representatives/local committees/ local liders")
politicalActor = nt.politicalActor(dfPublic,dfPrivate,dfNonProfit,dfInternational,dfLocal)
nt.mkCSV(politicalActor,"politicalActor.csv")

#%%FISICO AMBIENTALES DATA

df1 = nt.dfFix(Bibliography,"Latitude","Topography")
df2 = nt.dfFix(Entities,"Water_table","Sanitation:Personal_hygiene")
FA_geographicIdentification = nt.concatDF(df1,df2)
nt.mkCSV(FA_geographicIdentification,"FA_geographicIdentification.csv")

FA_Topography = nt.dfFix(Bibliography,"Upper bound (m)","FOOD SECURITY")
nt.mkCSV(FA_Topography,"FA_Topography.csv")

FA_NaturalResource = nt.dfFix(Bibliography,"r.1","ACTORS (PARTNERS) IDENTIFICATION")
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
FA_NaturalResource = nt.concatDF(bound,resource)
nt.mkCSV(FA_NaturalResource,"FA_NaturalResource.csv")

#%% URBANISM DATA

df1 = nt.dfFix(Entities,"Urban_Planning_001:Urban_Planning","Urban_Planning_001:Growth_area")
df2 = nt.dfFix(GeneralForm,"Urban_information:Boundary_limits","Urban_information:Drain_system") 
df3 = nt.dfFix(Entities,"Urban_Planning_001:Land_Managment","Urban_Planning_001:Risk_Managment")
df4 = nt.dfFix(Entities,"Urban_Planning_001:Growth_area","Urban_Planning_001:Land_Managment")
df5 = nt.dfFix(Entities,"Urban_Planning_001:Risk_Managment","Shelter:Housing_Improvement")
U_Urbanism = nt.concatDF(df1,nt.concatDF(df2,nt.concatDF(df3,nt.concatDF(df4,df5))))
nt.mkCSV(U_Urbanism,"U_Urbanism.csv")

u_area = nt.dfFix(PublicSpace,"Details:Shade_Areas","meta:instanceID")
u_area = nt.getSubColumnNames(u_area,8)
u_area = pd.DataFrame(u_area)
nt.mkCSV(u_area,"u_area.csv")

df1 = nt.dfFix(PublicSpace,"Details:Shade_Areas","meta:instanceID")
df1 = df1.isin(["yes"])
u_area = nt.getSubColumnNames(df1,8)
df = pd.DataFrame()
U_Area_has_Community = nt.dfFix(PublicSpace,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
j = 0
for row in np.array(df1):
    i = 0
    array = np.array([],dtype = int)
    array2 = np.array([])
    for elem in row:
        if(elem == True):
            array = np.append(array,i)
        i += 1
    for i in array:
        array2 = np.append(array2,np.array(u_area)[i])
    df = nt.concatDF(df,pd.DataFrame(array2))
    j += 1
U_Area_has_Community = nt.concatDF(U_Area_has_Community,df.T)
df = pd.DataFrame()
for row in np.array(U_Area_has_Community):
    array = np.array([])
    for elem in row[3:]:
        if(str(elem) != 'nan'):
            array = np.append(array,elem)
    for elem in array:
        array2 = row[:3]
        array2 = np.append(array2,elem)
        df = nt.concatDF(df,pd.DataFrame(array2))
U_Area_has_Community = df.T
nt.mkCSV(U_Area_has_Community,"U_Area_has_Community.csv")



#U_LandUse Datos GIS, no parte de esta ETL. 2 no se encuentran datos.

U_Road = nt.dfFix(GeneralForm,"Urban_information:Drain_system","Energy:electrical_grid") 
nt.mkCSV(U_Road,"U_Road.csv") #Falta la información que sale de Plano

df1 = nt.dfFix(PublicSpace,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy") 
df2 = nt.dfFix(PublicSpace,"Details:Shade_Areas","meta:instanceID") 
df2 = df2.isin(["yes"])
U_RecreationalArea = nt.concatDF(df1,df2)
nt.mkCSV(U_RecreationalArea,"U_RecreationalArea.csv")

#U_PublicSpace dato , no corresponde a la ETL

#%%INFRASTRUCTURE DATA

#%%Water

df1 = nt.dfFix(Entities,"Water:Quality","Water:Treatment")
df2 = nt.dfFix(Entities,"Water:Comsuption","Water:Time")
INF_WaterInfrastructure = nt.concatDF(df1,df2)
nt.mkCSV(INF_WaterInfrastructure,"INF_WaterInfrastructure.csv")    

INF_TimeSpent = nt.dfFix(HouseHold,"Water:Water_col","health_001:Healthcare")
nt.mkCSV(INF_TimeSpent,"INF_TimeSpent.csv")

INF_Purificationsystem = nt.dfFix(Entities,"Water:Treatment","Water:Comsuption")
INF_Purificationsystem = nt.separateValues(INF_Purificationsystem)
nt.mkCSV(INF_Purificationsystem,"INF_Purificationsystem.csv")

df1 = nt.dfFix(WaterInf,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
df2 = nt.dfFix(WaterInf,"Availability","meta:instanceID")
df2 = df2.isin(["yes"])
INF_WaterPoint = nt.concatDF(df1,df2)
nt.mkCSV(INF_WaterPoint,"INF_WaterPoint.csv")

#INF_IrrigationSystem No se encuentra el origen de datos. COMPROBADO 17/04/2020
#%%Sanitation

df1 = nt.dfFix(Entities,"Sanitation:Open_defecation","Sanitation:Type_of_Latrine")
df1 = df1.isin(["yes"])
df2 = nt.dfFix(Entities,"Sanitation:Type_of_Latrine","Sanitation:Individual_Latrines")
INF_SanitationAccess = nt.concatDF(df1,df2)
nt.mkCSV(INF_SanitationAccess,"INF_SanitationAccess.csv")

inf_sanitationsystemquality = nt.dfFix(SanitationInf,"Slab","meta:instanceID")
inf_sanitationsystemquality = inf_sanitationsystemquality.isin(["yes"])
nt.mkCSV(inf_sanitationsystemquality,"inf_sanitationsystemquality.csv")

#%%WasteManagement

INF_WasteManagementgInfrastructure = nt.dfFix(Entities,"Waste_Managment:Waste_Collection","Waste_Managment:Landfill_Details:Location_1")
nt.mkCSV(INF_WasteManagementgInfrastructure,"INF_WasteManagementgInfrastructure.csv")

INF_landFill = nt.dfFix(Entities,"Waste_Managment:Landfill_Details:Location_1","Water:Quality")
nt.mkCSV(INF_landFill,"INF_landFill.csv")

INF_CollectionPoints = nt.dfFix(WasteManagementInf,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
nt.mkCSV(INF_CollectionPoints,"INF_CollectionPoints.csv")


#%%Energy

df1 = nt.dfFix(GeneralForm,"Energy:electrical_grid","Energy:power_point")
df1 = df1.isin(["yes"]) 
df2 = nt.dfFix(Entities,"ENERGY:Electricity_network","ENERGY:Covered_services")
df2 = df2.isin(["yes"])
flag = False
for row in np.array(df2):
    for elem in row:
        if(flag == False and elem == True):
            flag = True
df2 = pd.DataFrame(np.array([flag]))    
df3 = nt.dfFix(Entities,"ENERGY:Power_failure","ENERGY:Street_Light")
x = np.array([])
x = np.append(x,df3['ENERGY:Power_failure'].dropna().mean())
flag = False
for row in np.array(df2):
    for elem in row:
        if(flag == False and elem == 'available'):
            flag = True
if(flag):
    y = pd.DataFrame(np.array(["available"]))
else:
    y = pd.DataFrame(np.array(["not_available"]))
df3 = nt.concatDF(pd.DataFrame(x),y)
df4 = nt.dfFix(Entities,"ENERGY:Street_Light","Urban_Planning_001:Urban_Planning")
df4 = df4.isin(["yes"])
flag = False
for row in np.array(df4):
    for elem in row:
        if(flag == False and elem == True):
            flag = True
df4 = pd.DataFrame(np.array([flag]))   
df5 = nt.dfFix(GeneralForm,"Energy:Distance_ST","Transport:Kind_transport_inside")
INF_EnergyInfrastructure = nt.concatDF(df1,(nt.concatDF(df2,nt.concatDF(df3,nt.concatDF(df4,df5)))))
nt.mkCSV(INF_EnergyInfrastructure,"INF_EnergyInfrastructure.csv")

inf_expandplanbeneficiaries = nt.dfFix(Entities,"ENERGY:Covered_services","ENERGY:Power_failure") 
inf_expandplanbeneficiaries = nt.separateValues(inf_expandplanbeneficiaries)
nt.mkCSV(inf_expandplanbeneficiaries,"inf_expandplanbeneficiaries.csv") 

INF_GenerationSource = ['electrical_gri','diesel_genset','solar_energy','other']
INF_GenerationSource = pd.DataFrame(INF_GenerationSource)
nt.mkCSV(INF_GenerationSource,"INF_GenerationSource.csv")

df1 = nt.dfFix(Business,"Energy:access_by","Energy:electrical_appliances")
df2 = nt.dfFix(Business,"Energy:money_electricity","Energy:cost_solar_panel")
comercial = nt.concatDF(df1,df2)
comercial = nt.set_sector(comercial,"comercial")
df1 = nt.dfFix(HouseHold,"Energy:Access_electric","Energy:Appliances")
df2 = nt.dfFix(HouseHold,"Energy:Elec_expen","Energy:Solar_cost")
residencial = nt.concatDF(df1,df2)
residencial = nt.set_sector(residencial,"residencial")
residencial = nt.replacestr(residencial,"electrical_gri_1","electrical_gri")#REVISAR OTRAS OPCIONES
comunitario = nt.dfFix(ComunalServices,"Energy_Details:Energy_Source","Energy_Details:Type_of_water_supply")
comunitario = nt.set_sector(comunitario,"comunitario")
comunitario = nt.replacestr(comunitario,"thermal_genera","diesel_genset")
INF_GenerationSource_has_Community = nt.concatDF(comercial.T,nt.concatDF(residencial.T,comunitario.T)).T
nt.mkCSV(INF_GenerationSource_has_Community,"INF_GenerationSource_has_Community.csv")

df1 = nt.dfFix(EnergyINF,"Ofert:Type_of_water_supply","Ofert:Picture")
df2 = nt.dfFix(EnergyINF,"Ofert:Power_of_generation","Ofert:Power_of_generation_001")
INF_GenerationSystem = nt.concatDF(df1,df2)
nt.mkCSV(INF_GenerationSystem,"INF_GenerationSystem.csv")

INF_Appliance = np.array(["lantern","light_bulbs","mobile_phone","radio_music_pl","tv_dvd","laptop_tablet_","fridge","electrical_sto","others"])
INF_Appliance = pd.DataFrame(INF_Appliance)
nt.mkCSV(INF_Appliance,"INF_Appliance.csv") 

comercial = nt.dfFix(Business,"Energy:electrical_appliances","Energy:money_electricity")
comercial = nt.dropNaAndResetIndex(comercial)
comercial = nt.get_applianceDF(comercial)
comercial = nt.set_sector(comercial,"comercial")
residencial = nt.dfFix(HouseHold,"Energy:Appliances","Energy:Elec_expen")
residencial = nt.dropNaAndResetIndex(residencial)
residencial = nt.get_applianceDF(residencial)
residencial = nt.set_sector(residencial,"residencial")
comunitario = nt.dfFix(ComunalServices,"Energy_Details:Electrical_Appliances:Devices","Construction_Details:Appropiate_Roof")
comunitario = nt.dropNaAndResetIndex(comunitario)
comunitario = nt.get_applianceDF(comunitario)
comunitario = nt.set_sector(comunitario,"comunitario")
INF_Appliance_has_Community = nt.concatDF(comercial.T,nt.concatDF(residencial.T,comunitario.T)).T
INF_Appliance_has_Community = INF_Appliance_has_Community[INF_Appliance_has_Community[1].notna()]
nt.mkCSV(INF_Appliance_has_Community,"INF_Appliance_has_Community.csv")

df1 = nt.dfFix(GeneralForm,"Energy:Stove","Energy:Firewood_weight")
df2 = nt.dfFix(GeneralForm,"Energy:fuel_cooking","Energy:technology_street_lighting")
df3 = nt.dfFix(GeneralForm, "Energy:Firewood_weight","Energy:fuel_cooking")
INF_Kitchen = nt.concatDF(df1,nt.concatDF(df2,df3))
nt.mkCSV(INF_Kitchen,"INF_Kitchen.csv")

INF_CookWoman = nt.dfFix(WomenGroup,"Cooking_Details:Cooking_Inside","Street_light")
nt.mkCSV(INF_CookWoman,"INF_CookWoman.csv")

df1 = nt.dfFix(Entities,"ENERGY:Street_Light","Urban_Planning_001:Urban_Planning")
df1 = df1.isin(["yes"])
df2 = nt.dfFix(GeneralForm,"Energy:Distance_ST","Transport:Kind_transport_inside")
df3 = nt.dfFix(WomenGroup,"Feel_Safe:Street_Night","Feel_Safe:Bath_Area")
INF_PublicLighting = nt.concatDF(df1,(nt.concatDF(df2,df3)))
nt.mkCSV(INF_PublicLighting,"INF_PublicLighting.csv")

INF_LightingTech = nt.dfFix(GeneralForm,"Energy:technology_street_lighting","Energy:Distance_ST")
nt.mkCSV(INF_LightingTech,"INF_LightingTech.csv")


df1 = nt.dfFix(EnergyINF,"Item","Sector")
df1 = df1.isin(["street light"])
INF_StreetLamp = nt.dfFix(EnergyINF,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
INF_StreetLamp = nt.get_valueBySector(df1,INF_StreetLamp)
nt.mkCSV(INF_StreetLamp,"INF_StreetLamp.csv")  #Necesario probar con datos

#%%Mobility Infrastructure
#INF_MobilityInfrasctucture = nt.dfFix(Entities,"","") #no se encuentra el dato en origen COMPROBADO 17/04/2020

INF_MobilityPoint = nt.dfFix(MobilityINF,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
nt.mkCSV(INF_MobilityPoint,"INF_MobilityPoint.csv")

INF_MobilityWay = ['walking','motorcycle','bike','truck_lorry_va','animals','car']
INF_MobilityWay = pd.DataFrame(INF_MobilityWay)
nt.mkCSV(INF_MobilityWay,"INF_MobilityWay.csv")

internal = nt.dfFix(GeneralForm,"Transport:Kind_transport_inside","Transport:Kind_transport_outside")
internal = nt.separateValues(internal)
internal = nt.set_sector(internal,"internal")
external = nt.dfFix(GeneralForm,"Transport:Kind_transport_outside","meta:instanceID")
external = nt.separateValues(external)
external = nt.set_sector(external,"external")
INF_MobilityWay_has_Community = nt.concatDF(internal.T,external.T).T
nt.mkCSV(INF_MobilityWay_has_Community,"INF_MobilityWay_has_Community.csv")
#%% SERVICIOS DATA
#%%Ceneter

df1 = nt.dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service")
df1 = df1.isin(["educational_center"])
df2 = nt.dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
df3 = nt.dfFix(ComunalServices,"Education_level","education_details:Subjects")
df4 = nt.dfFix(ComunalServices,"education_details:Start_001","Health_Center")
S_EducationalCenter = nt.concatDF(df2,(nt.concatDF(df3,df4)))
S_EducationalCenter = nt.get_valueBySector(df1,S_EducationalCenter)
nt.mkCSV(S_EducationalCenter,"S_EducationalCenter.csv")

df1 = nt.dfFix(ComunalServices,"education_details:Subjects","education_details:Subjects_001")
df1 = df1.dropna()
S_Subject = nt.separateValues(df1)
df2 = nt.dfFix(ComunalServices,"education_details:Subject_needed","education_details:Start_001").dropna()
S_Subject = np.array(S_Subject)
df2 = np.array(df2)
newSubject = np.array([])
for column in df2:
    for elem in column:
        flag = False
        for column2 in S_Subject:
            for elem2 in column2:
                if(elem == elem2):
                    flag = True
        if(flag == False):
            newSubject = np.append(newSubject,elem)
S_Subject = pd.DataFrame(S_Subject)
newSubject = pd.DataFrame(newSubject)
S_Subject = nt.concatDF(S_Subject.T,newSubject.T).T
S_Subject = pd.DataFrame(np.unique(np.array(S_Subject)))
nt.mkCSV(S_Subject,"S_Subject.csv")

df1 = nt.dfFix(ComunalServices,"education_details:Subjects","education_details:Subjects_001")
df1 = df1.dropna()
S_Subject = nt.separateValues(df1)
df2 = nt.dfFix(ComunalServices,"education_details:Subject_needed","education_details:Start_001").dropna()
S_Subject_has_S_EducationalCenter = nt.concatDF(S_Subject,df2)
nt.mkCSV(S_Subject_has_S_EducationalCenter,"S_Subject_has_S_EducationalCenter.csv")

df1 = nt.dfFix(ComunalServices,"Health_Center","Health_Center_details:Capacity")
df1 = df1.isin(["primary_care"])
S_PrimaryAttention = nt.dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
S_PrimaryAttention = nt.get_valueBySector(df1,S_PrimaryAttention)
S_PrimaryAttention = nt.set_defaultColumn(S_PrimaryAttention)
nt.mkCSV(S_PrimaryAttention,"S_PrimaryAttention.csv")

df1 = nt.dfFix(ComunalServices,"Health_Center","Health_Center_details:Capacity")
df1 = df1.isin(["hospital"])                                                  
df2 = nt.dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
df3 = nt.dfFix(ComunalServices,"Health_Center_details:Capacity","Associate_infrastructure:Sanitation")
S_Hospital = nt.concatDF(df2,df3)
S_Hospital = nt.get_valueBySector(df1,S_Hospital)
S_Hospital = nt.set_defaultColumn(S_Hospital)
S_Hospital = S_Hospital.dropna(how = 'all')
S_Hospital[3] = S_Hospital[3].apply(np.int64)
nt.mkCSV(S_Hospital,"S_Hospital.csv")

df1 = nt.dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service")
df1 = df1.isin(["cementary"])
df2 = nt.dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
df3 = nt.dfFix(ComunalServices,"Cementary_Details:Drainage","Education_level")
s_cementery = nt.concatDF(df2,df3)
s_cementery = nt.get_valueBySector(df1,s_cementery)
nt.mkCSV(s_cementery,"s_cementery.csv")

df1 = nt.dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service") 
df1 = df1.isin(["other"])
df2 = nt.dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
df3 = nt.dfFix(ComunalServices,"General_Information:Other_service","General_Information:Sharing_Services")
S_OtherCenter = nt.concatDF(df2,df3)
S_OtherCenter = nt.get_valueBySector(df1,S_OtherCenter)
S_OtherCenter = nt.set_defaultColumn(S_OtherCenter)
nt.mkCSV(S_OtherCenter,"S_OtherCenter.csv")

S_BuildingQuality = nt.dfFix(ComunalServices,"Construction_Details:Appropiate_Roof","meta:instanceID") 
S_BuildingQuality = S_BuildingQuality.isin(["yes"])
nt.mkCSV(S_BuildingQuality,"S_BuildingQuality.csv")

#%%Service
#S_HealthCenterService #información de plano

S_MedicineAccess = nt.dfFix(HouseHold,"health_001:Healthcare","Economy:FamilyHead")
S_MedicineAccess = S_MedicineAccess.isin(["yes"])
nt.mkCSV(S_MedicineAccess,"S_MedicineAccess.csv")

S_DataAccess = nt.dfFix(Entities,"Data_Access","Antenna")
S_DataAccess = nt.separateValues(S_DataAccess)
nt.mkCSV(S_DataAccess,"S_DataAccess.csv")

S_RepeaterAntena = nt.dfFix(Entities,"Antenna","meta:instanceID")
nt.mkCSV(S_RepeaterAntena,"S_RepeaterAntena.csv")

S_NoEducationCause = nt.dfFix(Entities,"Education_Issues","Data_Access")
S_NoEducationCause = nt.separateValues(S_NoEducationCause)
nt.mkCSV(S_NoEducationCause,"S_NoEducationCause.csv")
#%%KnowEledge

S_Tecknowlege = ["Phone Call","Internet","PC","Programming"]
S_Tecknowlege = pd.DataFrame(S_Tecknowlege)
nt.mkCSV(S_Tecknowlege,"S_Tecknowlege.csv")

S_Tecknowlege_has_Community = nt.dfFix(GeneralCitizen,"TICs_Knowledge:Phone_Call","App_USED")
S_Tecknowlege_has_Community = S_Tecknowlege_has_Community.transpose()
nt.mkCSV(S_Tecknowlege_has_Community,"S_Tecknowlege_has_Community.csv")

S_App = ["whatsapp","facebook","skype","instagram","google","youtube","email","word","excel","otra"]
S_App = pd.DataFrame(S_App)
nt.mkCSV(S_App,"S_App.csv")

df1 = nt.dfFix(GeneralCitizen,"App_USED","App_needed")
df1 = nt.set_sector(df1,"Used")
df2 = nt.dfFix(GeneralCitizen,"App_needed","Type_Food:Meat")
df2 = nt.set_sector(df2,"Necesity")
S_App_has_Community = nt.concatDF(df1.T,df2.T).T
nt.mkCSV(S_App_has_Community,"S_App_has_Community.csv")

#%% SHELTER DATA 

SH_Shelter = nt.dfFix(Entities,"Shelter:Total_shelter","Shelter:Vulnerable_Area:Vunerable_Area")
nt.mkCSV(SH_Shelter,"SH_Shelter.csv")

df1 = nt.dfFix(Shelter,"Location:Latitude","Location:Accuracy")
df2 = nt.dfFix(Shelter,"Construc_tion_Details:Appropiate_Roof","Construc_tion_Details:Picture_Outside")
df2 = df2.isin(["yes"])
SH_Building = nt.concatDF(df1,df2)
nt.mkCSV(SH_Building,"SH_Building.csv")


SH_House = nt.dfFix(HouseHold,"Shelter:No_Rooms","Energy:Access_Y_N_001")
nt.mkCSV(SH_House,"SH_House.csv")

#%%FOOD SECURITY DATA
#%%FOOD

FS_Cause = nt.dfFix(Bibliography,"Cause 1","Affected groups due to food insecurity")
FS_Cause = FS_Cause.transpose()
FS_Cause = FS_Cause.dropna(axis = 1)
nt.mkCSV(FS_Cause,"FS_Cause.csv") #Incompleto falta separar por comunidadades

df1 = nt.dfFix(Bibliography,"Children","Calories of the typical dish")
df1 = df1.isin(["yes"])
df2 = nt.dfFix(Bibliography,"Intake (g) - default value 70g-","GENERAL INFORMATION OF REFUGEES SETTLEMENT")
FS_FoodSafety = nt.concatDF(df1,df2)
nt.mkCSV(FS_FoodSafety,"FS_FoodSafety.csv") #Incompleto falta separar por comunidadades

FS_FoodAccess = ["meat","grain","vegetable","fruit"]
FS_FoodAccess = pd.DataFrame(FS_FoodAccess)
nt.mkCSV(FS_FoodAccess,"FS_FoodAccess.csv")

FS_FoodAccess_has_Community = nt.dfFix(GeneralCitizen,"Type_Food:Meat","times:One_time")
FS_FoodAccess_has_Community = FS_FoodAccess_has_Community.transpose()
nt.mkCSV(FS_FoodAccess_has_Community,"FS_FoodAccess_has_Community.csv")

FS_TimesPerDay = ["one","two","three","Greater than three"]
FS_TimesPerDay = pd.DataFrame(FS_TimesPerDay)
nt.mkCSV(FS_TimesPerDay,"FS_TimesPerDay.csv")

df1 = nt.dfFix(GeneralCitizen,"times:One_time","main_food:Breakfast")
times = pd.DataFrame([["one","two","three","Greater than three"]])
FS_TimesPerDay_has_Community = nt.get_number(df1,times)
nt.mkCSV(FS_TimesPerDay_has_Community,"FS_TimesPerDay_has_Community.csv")

FS_ImportantMeal = ["Breakfast","lunch","coffe time","dinner"]
FS_ImportantMeal = pd.DataFrame(FS_ImportantMeal)
nt.mkCSV(FS_ImportantMeal,"FS_ImportantMeal.csv")

df1 = nt.dfFix(GeneralCitizen,"main_food:Breakfast","typical_dish:Pork")
meal = pd.DataFrame(["Breakfast","lunch","coffe time","dinner"])
FS_ImportantMeal_has_Community = nt.get_number(df1,meal)
nt.mkCSV(FS_ImportantMeal_has_Community,"FS_ImportantMeal_has_Community.csv")

FS_TypicalPlate = ["pork","beef","chicken","lamp","cereals","legumes","fruits"]
FS_TypicalPlate = pd.DataFrame(FS_TypicalPlate)
nt.mkCSV(FS_TypicalPlate,"FS_TypicalPlate.csv")

df1 = nt.dfFix(Bibliography,"Pork (200 kcal/100g)","Intake (g) - default value 70g-")
plate = pd.DataFrame(["pork","beef","chicken","lamp","cereals","legumes","fruits"])
FS_TypicalPlate_has_Community = nt.get_number(df1,plate)
nt.mkCSV(FS_TypicalPlate_has_Community,"FS_TypicalPlate_has_Community.csv")
#%%Source

FS_FoodSource = ["Humanitarian Aid","Crops","Market"]
FS_FoodSource = pd.DataFrame(FS_FoodSource)
nt.mkCSV(FS_FoodSource,"FS_FoodSource.csv")

df1 = nt.dfFix(GeneralCitizen,"Main_food_source:Humanitarian_Aid","meta:instanceID")
source = pd.DataFrame(["Humanitarian Aid","Crops","Market"])
FS_FoodSource_has_Community = nt.get_number(df1,source)
nt.mkCSV(FS_FoodSource_has_Community,"FS_FoodSource_has_Community.csv")

FS_CultivationSeason = nt.dfFix(LocalLeaders,"Food_security:cultivation_months","Food_security:own_food_months")
FS_CultivationSeason = nt.vectorizeValue(FS_CultivationSeason)
nt.mkCSV(FS_CultivationSeason,"FS_CultivationSeason.csv")

#%%Corral and Crop

df1 = nt.dfFix(LocalLeaders,"Food_security:Grazing_technique","Costs:basic_basket")
df2 = nt.dfFix(LocalLeaders,"Food_security:fertilizers","Food_security:storing_food")
df2 = df2.isin(["yes"])
FS_CorralCropData = nt.concatDF(df1,df2)
nt.mkCSV(FS_CorralCropData,"FS_CorralCropData.csv")

df1 = nt.dfFix(FarmyardCrop,"Item","Property")
df1 = df1.isin(["crop_area"])
df2 = nt.dfFix(FarmyardCrop,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
df3 = nt.dfFix(FarmyardCrop,"Property","Drainage")
df4 = nt.dfFix(FarmyardCrop,"Drainage","Irrigation") #No se ajusta dato a Requisitos
df4 = df4.isin(["yes"])
FS_CorralUbication = nt.concatDF(df2,nt.concatDF(df3,df4))
FS_CorralUbication = nt.get_valueBySector(df1,FS_CorralUbication)
nt.mkCSV(FS_CorralUbication,"FS_CorralUbication.csv")

df1 = nt.dfFix(FarmyardCrop,"Item","Property")
df1 = df1.isin(["farmyard"])
df2 = nt.dfFix(FarmyardCrop,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
df3 = nt.dfFix(FarmyardCrop,"Property","Drainage")
df4 = nt.dfFix(FarmyardCrop,"Irrigation","Irrigation_details:Water_pump")
df4 = df4.isin(["yes"]) #No se ajusta dato a Requisitos
FS_CropUbication = nt.concatDF(df2,nt.concatDF(df3,df4))
FS_CropUbication =nt.get_valueBySector(df1,FS_CropUbication)
nt.mkCSV(FS_CropUbication,"FS_CropUbication.csv")

#%%Continuity

FS_FoodAccessContinuity = nt.dfFix(LocalLeaders,"Food_security:perishable_food","Costs:basic_basket")
nt.mkCSV(FS_FoodAccessContinuity,"FS_FoodAccessContinuity.csv")

FS_SelfSufficiencySeason = nt.dfFix(LocalLeaders,"Food_security:own_food_months","Food_security:kind_food")
FS_SelfSufficiencySeason = nt.vectorizeValue(FS_SelfSufficiencySeason)
nt.mkCSV(FS_SelfSufficiencySeason,"FS_SelfSufficiencySeason.csv")

FS_OwnCultivationFoodType = nt.dfFix(LocalLeaders,"Food_security:kind_food","Food_security:fertilizers")
FS_OwnCultivationFoodType = nt.separateValues(FS_OwnCultivationFoodType)
nt.mkCSV(FS_OwnCultivationFoodType,"FS_OwnCultivationFoodType.csv")

FS_GrainConservation = nt.dfFix(LocalLeaders,"Food_security:dry_food","Food_security:perishable_food")
FS_GrainConservation = nt.separateValues(FS_GrainConservation)
nt.mkCSV(FS_GrainConservation,"FS_GrainConservation.csv")

df1 = nt.dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service")
df1 = df1.isin(["gran_mill"])
df2 = nt.dfFix(ComunalServices,"Grain_Mill_Details:Available","Grain_Mill_Details:Type")
df3 = nt.dfFix(ComunalServices,"Grain_Mill_Details:Engine","Cementary_Details:Drainage")
FS_GrainMill = nt.concatDF(df2,df3)
FS_GrainMill = nt.get_valueBySector(df1,FS_GrainMill)
nt.mkCSV(FS_GrainMill,"FS_GrainMill.csv")