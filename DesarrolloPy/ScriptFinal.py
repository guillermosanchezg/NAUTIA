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
import os
import sklearn
#pd.options.mode.chained_assignment = None  # default='warn'


from sklearn.feature_extraction.text import CountVectorizer
count_vectorizer = CountVectorizer()

import nltk
nltk.download("popular") # required to download the stopwords lists
from nltk.corpus import stopwords

spanish_stopwords = stopwords.words('spanish')
english_stopwords = stopwords.words('english')
#%%
mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"

def fixBibliography(df):
    df = dfFix(df,"GENERAL INFORMATION - COUNTRY LEVEL")
    df.columns = ['GeneralInfo', 'CommunityCountry', 'RefugeeCountry']
    df.set_index('GeneralInfo', inplace = True)
    df = df.transpose()
    df = df.reset_index()
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

def set_AllCSVtoDF(communityType):
    Bibliography = pd.read_excel(getPath(mainpath,"Bibliography_120220.xlsx"))
    Bibliography = fixBibliography(Bibliography)
    Bibliography = setDataByIndex(Bibliography,communityType)
    Entities = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Entities_Interview_results.csv"),float_precision = "high"),communityType)
    LocalLeaders = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Local_leaders_v3_results.csv"),float_precision = "high"),communityType)
    HouseHold = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Survey_household_v6_results.csv"),float_precision = "high"),communityType)
    WomenGroup = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Women_Focus_Group2_results.csv"),float_precision = "high"),communityType)
    SanitationInfra = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_V1_0_Sanitation_Infrastructre_results.csv"),float_precision = "high"),communityType)
    Priorities = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Priorities_v3_results.csv"),float_precision = "high"),communityType)
    GeneralForm = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_General_form_v3_results.csv"),float_precision = "high"),communityType)
    PublicSpace = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Public_Space_results.csv"),float_precision = "high"),communityType)
    WaterInf = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Water_Infrastructure_results.csv"),float_precision = "high"),communityType)
    SanitationInf = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_V1_0_Sanitation_Infrastructre_results.csv"),float_precision = "high"),communityType)
    WasteManagementInf = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Waste_Management_Infrastructure_results.csv"),float_precision = "high"),communityType)
    EnergyINF = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Energy_Infrastructure_results.csv"),float_precision = "high"),communityType)
    Business = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA1_0_Business_surveys_v3_results.csv"),float_precision = "high"),communityType)
    MobilityINF = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0__Transport_servicesaccess_points_results.csv"),float_precision = "high"),communityType) 
    ComunalServices = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Communal_Services_results.csv"),float_precision = "high"),communityType) 
    GeneralCitizen = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_General_Citizen_Focus_Group_results.csv"),float_precision = "high"),communityType)
    Shelter = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Shelter_results.csv"),float_precision = "high"),communityType)
    FarmyardCrop = setDataByIndex(pd.read_csv(getPath(mainpath,"NAUTIA_1_0_Farmyard_and_Crops_results.csv"),float_precision = "high"),communityType)
    return Bibliography,Entities,LocalLeaders,HouseHold,WomenGroup,SanitationInfra,Priorities,GeneralForm,PublicSpace,WaterInf,EnergyINF,SanitationInf,WasteManagementInf,EnergyINF,Business,MobilityINF,ComunalServices,GeneralCitizen,Shelter,FarmyardCrop

def concatDF(df1,df2):
    return  pd.concat([df1,df2],axis = 1, ignore_index = True, sort = True)

def mkCSV(df,fileName):
    df = df.dropna(how = 'all')
    df *= 1   
    fileName = fileName.lower()
    df.to_csv('DataSetFinales/'+fileName,sep=',',header = False, index=False, encoding='utf-8')
    
def getPath(mainpath,filename):
    return os.path.join(mainpath, filename)

def getSubColumnNames(df,x):
    columns = df.columns
    array = []
    for column in columns:
        column = column[x:]
        array.append(column)
    return pd.DataFrame(array) 

def addInstitutionAndType(df,array1,array2,instType):
    df = df.dropna(axis = 1)
    df = np.array(df)
    for row in df:
        for elem in row:
            array1 = np.append(array1,elem)
            array2 = np.append(array2,instType)
    return array1,array2

def politicalActor(df1,df2,df3,df4,df5):
    institution = []
    instType = []

    institution, instType  = addInstitutionAndType(df1,institution,instType,'Public Institution')
    institution, instType  = addInstitutionAndType(df2,institution,instType,'Private Institution')
    institution, instType  = addInstitutionAndType(df3,institution,instType,'NGO')
    institution, instType  = addInstitutionAndType(df4,institution,instType,'International Agency')
    institution, instType  = addInstitutionAndType(df5,institution,instType,'Local')

    institution = pd.DataFrame(institution)
    institution = institution.reset_index(drop = True)
    instType = pd.DataFrame(instType)
    instType = instType.reset_index(drop = True)
    
    return concatDF(institution,instType)


def get_claveValor(df1,df2):
    array1 = np.array(df2)
    array2 = np.array(df1)
    result1 = []
    result2 = []
    i = 0
    for row in array1:
        var = array2[i]
        for elem in row:
            result1 = np.append(result1,elem)
            result2 = np.append(result2,var)
        i+=1
    result2 = pd.DataFrame(result2)
    result2 = result2.reset_index(drop = True)
    result1 = pd.DataFrame(result1)
    result1 = result1.reset_index(drop = True)
    return concatDF(result2,result1)

def get_number(df):
    df = np.array(df)
    array = np.array([])
    for column in df:
        for elem in column:
            array = np.append(array,elem)
    return (pd.DataFrame(array)).fillna(0) 

def get_valueBySector(df1,df2):
    df2 = df2.reset_index()
    array1 = np.array(df1)
    i = 0
    for row in array1:
        for elem in row:
            if(elem == False):
                df2 = dropRow(df2,i)
        i += 1
    df2 = df2.set_index('index')
    return df2

def set_defaultColumn(df):
    default = np.array([])
    for row in df:
        default = np.append(default,np.nan)
    default = pd.DataFrame(default)
    return concatDF(df,default)        
        
def separateValues(df):
    if(df.isnull().values.all(axis=0)):
        result = df
    else:
        array = np.array(df)
        count_vectorizer = CountVectorizer(stop_words = spanish_stopwords+english_stopwords)
        corpus = []
        for row in array:
            for elem in row:
                corpus = np.append(corpus,[elem])
        X = count_vectorizer.fit_transform(corpus)
        array = count_vectorizer.get_feature_names()
        result = pd.DataFrame(array)
    return result

def vectorizeValue(df):
    df = separateValues(df)
    year = np.array(['january','february','march','april','may','june','july','august','september','october','november','december'])
    result = np.array([],dtype = bool)
    df = np.array(df)
    for elem in year:
        flag = False
        for column in df:
            for month in column:
                if(column == elem):
                    flag = True
        if(flag):
            result = np.append(result,True)
        else:
            result = np.append(result,False)
    return pd.DataFrame(result)

def set_sector(df,sect, concat = True):
    sector = np.array([])
    df = df.dropna(how = 'all')
    df = np.array(df)
    for column in df:
        sector = np.append(sector,sect)
    sector = pd.DataFrame(sector)
    df = pd.DataFrame(df)
    if(concat):
        result = concatDF(sector,df)
    else:
        result = sector
    return result 

#%% CSV to DataFrame
Bibliography,Entities,LocalLeaders,HouseHold,WomenGroup,SanitationInfra,Priorities,GeneralForm,PublicSpace,WaterInf,EnergyINF,SanitationInf,WasteManagementInf,EnergyINF,Business,MobilityINF,ComunalServices,GeneralCitizen,Shelter,FarmyardCrop = set_AllCSVtoDF(1)
#%%Community

community = ["Shimelba"]
community = pd.DataFrame(community)
mkCSV(community,"community.csv")
#%% CAMP

df1 = dfFix(Bibliography,"Implementation date of the refugee camp (year)","Migration reasons")
df2 = dfFix(Entities,"GENERAL_INFORMATION:Secondary_movement","GENERAL_INFORMATION:Relationship")
camp = concatDF(df1,df2)
camp = dropRow(camp,0)
mkCSV(camp,"camp.csv") 

#%%Country

Country = dfFix(Bibliography,"Country's name", "Number of inhabitants (#)")
mkCSV(Country,"Country.csv")

#%%GENERAL DATA

df1 = dfFix(Bibliography,"Mujeres menores de 5 años (%)","Total population")
df2 = dfFix(Bibliography,"Growth rate of populatoin (%)","Culture")
GD_Demography = concatDF(df1,df2) 
mkCSV(GD_Demography,"GD_Demography.csv")

GD_Ethnicgroup = dfFix(Bibliography,"Ethnich group 1","Religion") 
mkCSV(GD_Ethnicgroup,"GD_Ethnicgroup.csv")

df1 = dfFix(Bibliography,"Parliamentary republic","Territorial and Urbanistic")
GD_Government = df1 
GD_Government = GD_Government.isin(["Si"])
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
GD_Infrastructure = concatDF(concatDF(df1,df2),df3) 
mkCSV(GD_Infrastructure,"GD_Infrastructure.csv")

GD_ElectricGenerationMix = dfFix(Bibliography,"Hydropower (%)","High voltage (kV)") 
mkCSV(GD_ElectricGenerationMix,"GD_ElectricGenerationMix.csv")

GD_ServiceAccess = dfFix(Bibliography,"Illiteracy rate (%)","Shelter") 
mkCSV(GD_ServiceAccess,"GD_ServiceAccess.csv")

GD_Shelter = dfFix(Bibliography,"Slum population rate (%)","SPECIFIC INFORMATION - SETTLEMENTS LEVEL") 
mkCSV(GD_Shelter,"GD_Shelter.csv")

#%%COMMUN DATA
Comun = pd.read_excel(getPath(mainpath,"Bibliography_120220.xlsx"))
Comun = fixBibliography(Comun)

GD_Religion = dfFix(Comun,"Religion 1","Language")
df1 = dropRow(GD_Religion,1)
np_array1 = np.array(df1)
df2 = dropRow(GD_Religion,0)
np_array2 = np.array(df2)
np_array3 = np.concatenate((np_array1,np_array2), axis = 1)
GD_Religion = pd.DataFrame(np_array3)
GD_Religion = GD_Religion.transpose()
GD_Religion = GD_Religion[0].unique()
GD_Religion = pd.DataFrame(GD_Religion)
GD_Religion = GD_Religion.dropna()
mkCSV(GD_Religion,"GD_Religion.csv")

GD_Language = dfFix(Comun,"Language 1","Economy and well-being")
df1 = dropRow(GD_Language,1)
np_array1 = np.array(df1)
df2 = dropRow(GD_Language,0)
np_array2 = np.array(df2)
np_array3 = np.concatenate((np_array1,np_array2), axis = 1)
GD_Language = pd.DataFrame(np_array3)
GD_Language = GD_Language.transpose()
GD_Language = GD_Language[0].unique()
GD_Language = pd.DataFrame(GD_Language)
GD_Language = GD_Language.dropna()
mkCSV(GD_Language,"GD_Language.csv")


#%% Specific DATA CAMP

Camp_MovementReason = dfFix(Bibliography,"Reason 1","Climate")
Camp_MovementReason = Camp_MovementReason.transpose()
mkCSV(Camp_MovementReason,"Camp_MovementReason.csv")

Camp_Integration = dfFix(Entities,"GENERAL_INFORMATION:Relationship","GENERAL_INFORMATION:Movement_outside")
mkCSV(Camp_Integration,"Camp_Integration.csv")

Camp_NaturalHazard = dfFix(Entities,"Enviormental_Issues:Risk:Risk_Flood","Enviormental_Issues:Deforestation")
Camp_NaturalHazard = getSubColumnNames(Camp_NaturalHazard,30)
mkCSV(Camp_NaturalHazard,"Camp_NaturalHazard.csv")

Camp_NaturalHazard_Has_Camp = dfFix(Entities,"Enviormental_Issues:Risk:Risk_Flood","Enviormental_Issues:Deforestation")
Camp_NaturalHazard_Has_Camp = get_number(Camp_NaturalHazard_Has_Camp)
mkCSV(Camp_NaturalHazard_Has_Camp,"Camp_NaturalHazard_Has_Camp.csv")

Camp_LocalVegetation = dfFix(Entities,"Enviormental_Issues:Native_Plant","Enviormental_Issues:Native_Crops")
Camp_LocalVegetation = separateValues(Camp_LocalVegetation)
mkCSV(Camp_LocalVegetation,"Camp_LocalVegetation.csv") # ¿MODIFICAR FOLMULARIO? 

Camp_LocalCrop = dfFix(Entities,"Enviormental_Issues:Native_Crops","Water_table")
Camp_LocalCrop = separateValues(Camp_LocalCrop)
mkCSV(Camp_LocalCrop,"Camp_LocalCrop.csv") #MODIFICAR FOLMULARIO?

df3 = dfFix(Entities,"Enviormental_Issues:High_enviormental_value","Enviormental_Issues:Native_Plant")
df3 = df3.isin(["yes"])
df4 = dfFix(Entities,"Enviormental_Issues:Deforestation","Enviormental_Issues:High_enviormental_value")
Camp_Enviroment = concatDF(df3,df4)
mkCSV(Camp_Enviroment,"Camp_Enviroment.csv")

df1 = dfFix(Bibliography,"Tropical (Write one: Af, Aw or Am)","Temperature")
df1 = df1.transpose()
df1 = df1.dropna()
df1 = df1.transpose()
df2 = dfFix(Bibliography,"Max (ºC)","Annual precipitation")
df3 = dfFix(Bibliography,"Max (mm)","Additional information")
Camp_ClimaticRegion = concatDF(df1,concatDF(df2,df3))
mkCSV(Camp_ClimaticRegion,"Camp_ClimaticRegion.csv")

Camp_EnergySource = ['diesel','Kerosene','Ethanol','gas','firewood','diesel genset','electricity','solar panel']
Camp_EnergySource = pd.DataFrame(Camp_EnergySource)
mkCSV(Camp_EnergySource,"Camp_EnergySource.csv")

df1 = dfFix(Entities,"Fuel_Cost:Fuel_Cost_Diesel","ENERGY:Electricity_network")
df2 = dfFix(LocalLeaders,"Costs:cost_firewood","meta:instanceID")
Camp_EnergySource_Has_Camp = concatDF(df1,df2)
Camp_EnergySource_Has_Camp = get_number(Camp_EnergySource_Has_Camp)
mkCSV(Camp_EnergySource_Has_Camp,"Camp_EnergySource_Has_Camp.csv")

Camp_Mobility = dfFix(Entities,"GENERAL_INFORMATION:Movement_outside","Population:Women:Infants")
mkCSV(Camp_Mobility,"Camp_Mobility.csv")

Camp_Shelter = dfFix(Entities,"Shelter:Housing_Improvement","Shelter:Total_shelter")
mkCSV(Camp_Shelter,"Camp_Shelter.csv")

#%%SocioEconomic DATA
#%%SE Demographyc And Culture

df1 = dfFix(Entities,"Population:Women:Infants","Population:Men:Infants_001")
df2 = dfFix(Entities,"Population:Men:Infants_001","Fuel_Cost:Main_Fuel")
df1 = np.array(df1)
df2 = np.array(df2)
array = np.array([],dtype = int)
array = df1+df2
SE_population = pd.DataFrame(array)
mkCSV(SE_population,"SE_population.csv")

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

SE_ConflictArea = dfFix(WomenGroup,"Trouble_Spots","Cooking_Details:INSTRUCTION_001")
SE_ConflictArea = SE_ConflictArea.dropna()
SE_ConflictArea = separateValues(SE_ConflictArea)
mkCSV(SE_ConflictArea,"SE_ConflictArea.csv") #IMPORRANTE Los datos entran como string de lugares, pero se quiere guardar coordenadas.

df1 = dfFix(LocalLeaders,"Settlement_security:secur_committees","Food_security:cultivation_months")
df1 = df1.isin(["yes"])
df2 = dfFix(Entities,"Women_Patrol","Education_Issues")
df2 = df2.isin(["Yes"])
SE_SafetyCommittee = concatDF(df1,df2)
mkCSV(SE_SafetyCommittee,"SE_SafetyCommittee.csv") 

SE_SafetyLatrines = dfFix(SanitationInfra, "Public_Latrines:Sex_segregated","Slab")
SE_SafetyLatrines = SE_SafetyLatrines.isin(["yes"])
mkCSV(SE_SafetyLatrines,"SE_SafetyLatrines.csv") 


#%%SE_Economy

SE_Economy = dfFix(LocalLeaders, "Costs:cost_basic_basket","Costs:cost_firewood")
mkCSV(SE_Economy,"SE_Economy.csv") 

SE_Incometype = dfFix(HouseHold, "Economy:Main_inco","Economy:Money")
mkCSV(SE_Incometype,"SE_Incometype.csv") 

df1 = dfFix(HouseHold, "General:Gender","General:Settlement")
df2 = dfFix(HouseHold, "Economy:Money","Economy:Food")
SE_IncomeTtype_has_Community = concatDF(df1,df2)
mkCSV(SE_IncomeTtype_has_Community,"SE_IncomeTtype_has_Community.csv")

SE_ExpenseType = ['food','clothes','water','education','transport','health','energy']
SE_ExpenseType = pd.DataFrame(SE_ExpenseType)
mkCSV(SE_ExpenseType,"SE_ExpenseType.csv")

df1 = dfFix(HouseHold, "General:Gender","General:Settlement")
df2 = dfFix(HouseHold, "Economy:Food","meta:instanceID")
SE_ExpenseType_has_Community = get_claveValor(df1,df2)
mkCSV(SE_ExpenseType_has_Community,"SE_ExpenseType_has_Community.csv")

priority = ['energy','shelter','water access','sanitation','education','health','public space','food','TIC','work','waste management','public transport','religious center','socio cultural center','market']
priority = pd.DataFrame(priority)
mkCSV(priority,"se_priority.csv")

df1 = dfFix(Priorities,"group_yf0yl72:Energy_1","Priority_2:Instruction")
df2 = dfFix(Priorities,"Priority_2:Energy_2","Priority_3:Instruction_001")
df3 = dfFix(Priorities,"Priority_3:Energy_3","Priority_4:Instruction_002")
df4 = dfFix(Priorities,"Priority_4:Energy_4_001","Priority_5:Instruction_003")
df5 = dfFix(Priorities,"Priority_5:Energy_4","meta:instanceID")
SE_Priority_has_Community = concatDF(df1,(concatDF(df2,concatDF(df3,concatDF(df4,df5)))))
mkCSV(SE_Priority_has_Community,"SE_Priority_has_Community.csv")

#%% GenderData

#SE_GenderData = dfFix(Entities,"","")
#mkCSV(SE_GenderData,"SE_GenderData.csv") No existe dicho dato en los formularios

SE_WorkType = ["Firewood Collection", "Cooking"]
SE_WorkType = pd.DataFrame(SE_WorkType)
mkCSV(SE_WorkType,"SE_WorkType.csv")

df1 = dfFix(GeneralCitizen,"Firewood_collection:Childs","Cooking:Childs_001")
df2 = dfFix(GeneralCitizen,"Cooking:Childs_001","TICs_Knowledge:Phone_Call")
df1 = df1.transpose()
df2 = df2.transpose()
df1 = df1.reset_index(drop = True)
df2 = df2.reset_index(drop = True)
SE_WorkType_has_Community = concatDF(df1,df2)
SE_WorkType_has_Community = SE_WorkType_has_Community.transpose()
mkCSV(SE_WorkType_has_Community,"SE_WorkType_has_Community.csv")

#%%GOVERNMENT_DATA
#G_PublicPolitic no forma parte ETL

dfPublic = dfFix(Bibliography,"Public institutions","Private institutions")
dfPrivate = dfFix(Bibliography,"Private institutions","Non-profit organizations/NGOs")
dfNonProfit = dfFix(Bibliography,"Non-profit organizations/NGOs","International cooperation agencies")
dfInternational = dfFix(Bibliography,"International cooperation agencies","Local representatives/local committees/ local liders")
dfLocal = dfFix(Bibliography,"Local representatives/local committees/ local liders")
G_PoliticalActor = politicalActor(dfPublic,dfPrivate,dfNonProfit,dfInternational,dfLocal)
mkCSV(G_PoliticalActor,"G_PoliticalActor.csv")

#%%FISICO AMBIENTALES DATA

df1 = dfFix(Bibliography,"Latitude","Topography")
df2 = dfFix(Entities,"Water_table","Sanitation:Personal_hygiene")
FA_geographicIdentification = concatDF(df1,df2)
mkCSV(FA_geographicIdentification,"FA_geographicIdentification.csv")

FA_Topography = dfFix(Bibliography,"Upper bound (m)","FOOD SECURITY")
mkCSV(FA_Topography,"FA_Topography.csv")

FA_NaturalResource = dfFix(Bibliography,"r.1","ACTORS (PARTNERS) IDENTIFICATION")
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
mkCSV(U_Urbanism,"U_Urbanism.csv")

u_area = np.array(['Shade Area','Urban Furniture','Paved Area','Waste Management'])
u_area = pd.DataFrame(u_area)
mkCSV(u_area,"u_area.csv")

df1 = dfFix(PublicSpace,"Details:Shade_Areas","meta:instanceID")
df1 = df1.isin(["yes"])
U_Area_has_Community = dfFix(PublicSpace,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
mkCSV(U_Area_has_Community,"U_Area_has_Community.csv")

#U_LandUse Datos GIS, no parte de esta ETL. 2 no se encuentran datos.

U_Road = dfFix(GeneralForm,"Urban_information:Drain_system","Energy:electrical_grid") 
mkCSV(U_Road,"U_Road.csv") #Falta la información que sale de Plano

df1 = dfFix(PublicSpace,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy") 
df2 = dfFix(PublicSpace,"Details:Shade_Areas","meta:instanceID") 
df2 = df2.isin(["yes"])
U_RecreationalArea = concatDF(df1,df2)
mkCSV(U_RecreationalArea,"U_RecreationalArea.csv")

#U_PublicSpace dato , no corresponde a la ETL

#%%INFRASTRUCTURE DATA

#%%Water

df1 = dfFix(Entities,"Water:Quality","Water:Treatment")
df2 = dfFix(Entities,"Water:Comsuption","Water:Time")
INF_WaterInfrastructure = concatDF(df1,df2)
mkCSV(INF_WaterInfrastructure,"INF_WaterInfrastructure.csv")    

INF_TimeSpent = dfFix(HouseHold,"Water:Water_col","health_001:Healthcare")
mkCSV(INF_TimeSpent,"INF_TimeSpent.csv")

INF_Purificationsystem = dfFix(Entities,"Water:Treatment","Water:Comsuption")
INF_Purificationsystem = separateValues(INF_Purificationsystem)
mkCSV(INF_Purificationsystem,"INF_Purificationsystem.csv")

df1 = dfFix(WaterInf,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
df2 = dfFix(WaterInf,"Availability","meta:instanceID")
df2 = df2.isin(["yes"])
INF_WaterPoint = concatDF(df1,df2)
mkCSV(INF_WaterPoint,"INF_WaterPoint.csv")

#INF_IrrigationSystem No se encuentra el origen de datos. COMPROBADO 17/04/2020
#%%Sanitation

df1 = dfFix(Entities,"Sanitation:Open_defecation","Sanitation:Type_of_Latrine")
df1 = df1.isin(["yes"])
df2 = dfFix(Entities,"Sanitation:Type_of_Latrine","Sanitation:Individual_Latrines")
INF_SanitationAccess = concatDF(df1,df2)
mkCSV(INF_SanitationAccess,"INF_SanitationAccess.csv")

inf_sanitationsystemquality = dfFix(SanitationInf,"Slab","meta:instanceID")
inf_sanitationsystemquality = inf_sanitationsystemquality.isin(["yes"])
mkCSV(inf_sanitationsystemquality,"inf_sanitationsystemquality.csv")

#%%WasteManagement

INF_WasteManagementgInfrastructure = dfFix(Entities,"Waste_Managment:Waste_Collection","Waste_Managment:Landfill_Details:Location_1")
mkCSV(INF_WasteManagementgInfrastructure,"INF_WasteManagementgInfrastructure.csv")

INF_landFill = dfFix(Entities,"Waste_Managment:Landfill_Details:Location_1","Water:Quality")
mkCSV(INF_landFill,"INF_landFill.csv")

INF_CollectionPoints = dfFix(WasteManagementInf,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
mkCSV(INF_CollectionPoints,"INF_CollectionPoints.csv")


#%%Energy

df1 = dfFix(GeneralForm,"Energy:electrical_grid","Energy:power_point")
df1 = df1.isin(["yes"]) 
df2 = dfFix(Entities,"ENERGY:Electricity_network","ENERGY:Covered_services")
df2 = df2.isin(["yes"])
df3 = dfFix(Entities,"ENERGY:Power_failure","ENERGY:Street_Light")
df4 = dfFix(Entities,"ENERGY:Street_Light","Urban_Planning_001:Urban_Planning")
df4 = df4.isin(["yes"])
df5 = dfFix(GeneralForm,"Energy:Distance_ST","Transport:Kind_transport_inside")
INF_EnergyInfrastructure = concatDF(df1,(concatDF(df2,concatDF(df3,concatDF(df4,df5)))))
mkCSV(INF_EnergyInfrastructure,"INF_EnergyInfrastructure.csv")

inf_expandplanbeneficiaries = dfFix(Entities,"ENERGY:Covered_services","ENERGY:Power_failure") 
inf_expandplanbeneficiaries = separateValues(inf_expandplanbeneficiaries)
mkCSV(inf_expandplanbeneficiaries,"inf_expandplanbeneficiaries.csv") 

INF_GenerationSource = ['electrical grid','diesel genset','solar panel','other']
INF_GenerationSource = pd.DataFrame(INF_GenerationSource)
mkCSV(INF_GenerationSource,"INF_GenerationSource.csv")

df1 = dfFix(Business,"Energy:hours_morning","Energy:electrical_appliances")
df2 = dfFix(Business,"Energy:money_electricity","Energy:cost_solar_panel")
comercial = concatDF(df1,df2)
comercial = set_sector(comercial,"comercial")
df1 = dfFix(HouseHold,"Energy:Hours_day","Energy:Appliances")
df2 = dfFix(HouseHold,"Energy:Elec_expen","Energy:Solar_cost")
residencial = concatDF(df1,df2)
residencial = set_sector(residencial,"residencial")
comunitario = dfFix(ComunalServices,"Energy_Details:Energy_Source","Energy_Details:Type_of_water_supply")
comunitario = set_sector(comunitario,"comunitario",concat=False)
INF_GenerationSource_has_Community = concatDF(comercial.T,concatDF(residencial.T,comunitario.T)).T
mkCSV(INF_GenerationSource_has_Community,"INF_GenerationSource_has_Community.csv")

df1 = dfFix(EnergyINF,"Ofert:Type_of_water_supply","Ofert:Picture")
df2 = dfFix(EnergyINF,"Ofert:Power_of_generation","Ofert:Power_of_generation_001")
INF_GenerationSystem = concatDF(df1,df2)
mkCSV(INF_GenerationSystem,"INF_GenerationSystem.csv")

INF_Appliance = np.array(["lantern","light bulbs","mobile phone","radio","tv","computer","fridge","electrical stove","others"])
INF_Appliance = pd.DataFrame(INF_Appliance)
mkCSV(INF_Appliance,"INF_Appliance.csv")

comercial = dfFix(Business,"Energy:electrical_appliances","Energy:money_electricity")
comercial = set_sector(comercial,"comercial")
residencial = dfFix(HouseHold,"Energy:Appliances","Energy:Elec_expen")
residencial = set_sector(residencial,"residencial")
comunitario = dfFix(ComunalServices,"Energy_Details:Electrical_Appliances:Devices","Construction_Details:Appropiate_Roof")
comunitario = set_sector(comunitario,"comunitario")
INF_Appliance_has_Community = concatDF(comercial.T,concatDF(residencial.T,comunitario.T)).T
mkCSV(INF_Appliance_has_Community,"INF_Appliance_has_Community.csv")

df1 = dfFix(GeneralForm,"Energy:Stove","Energy:Firewood_weight")
df2 = dfFix(GeneralForm,"Energy:fuel_cooking","Energy:technology_street_lighting")
df3 = dfFix(GeneralForm, "Energy:Firewood_weight","Energy:fuel_cooking")
INF_Kitchen = concatDF(df1,concatDF(df2,df3))
mkCSV(INF_Kitchen,"INF_Kitchen.csv")

INF_CookWoman = dfFix(WomenGroup,"Cooking_Details:Cooking_Inside","Street_light")
mkCSV(INF_CookWoman,"INF_CookWoman.csv")

df1 = dfFix(Entities,"ENERGY:Street_Light","Urban_Planning_001:Urban_Planning")
df1 = df1.isin(["yes"])
df2 = dfFix(GeneralForm,"Energy:Distance_ST","Transport:Kind_transport_inside")
df3 = dfFix(WomenGroup,"Feel_Safe:Street_Night","Feel_Safe:Bath_Area")
INF_PublicLighting = concatDF(df1,(concatDF(df2,df3)))
mkCSV(INF_PublicLighting,"INF_PublicLighting.csv")

INF_LightingTech = dfFix(GeneralForm,"Energy:technology_street_lighting","Energy:Distance_ST")
mkCSV(INF_LightingTech,"INF_LightingTech.csv")


df1 = dfFix(EnergyINF,"Item","Sector")
df1 = df1.isin(["street light"])
INF_StreetLamp = dfFix(EnergyINF,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
INF_StreetLamp = get_valueBySector(df1,INF_StreetLamp)
mkCSV(INF_StreetLamp,"INF_StreetLamp.csv")  #Necesario probar con datos

#%%Mobility Infrastructure
#INF_MobilityInfrasctucture = dfFix(Entities,"","") #no se encuentra el dato en origen COMPROBADO 17/04/2020

INF_MobilityPoint = dfFix(MobilityINF,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
mkCSV(INF_MobilityPoint,"INF_MobilityPoint.csv")

INF_MobilityWay = ['walking','motrocycle','bike','truck','animal','car']
INF_MobilityWay = pd.DataFrame(INF_MobilityWay)
mkCSV(INF_MobilityWay,"INF_MobilityWay.csv")

internal = dfFix(GeneralForm,"Transport:Kind_transport_inside","Transport:Kind_transport_outside")
internal = separateValues(internal)
external = dfFix(GeneralForm,"Transport:Kind_transport_outside","meta:instanceID")
external = separateValues(external)
INF_MobilityWay_has_Community = concatDF(internal,external)
mkCSV(INF_MobilityWay_has_Community,"INF_MobilityWay_has_Community.csv")

#%% SERVICIOS DATA
#%%Ceneter

df1 = dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service")
df1 = df1.isin(["educational_center"])
df2 = dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
df3 = dfFix(ComunalServices,"Education_level","education_details:Subjects")
df4 = dfFix(ComunalServices,"education_details:Start_001","Health_Center")
S_EducationalCenter = concatDF(df2,(concatDF(df3,df4)))
S_EducationalCenter = get_valueBySector(df1,S_EducationalCenter)
mkCSV(S_EducationalCenter,"S_EducationalCenter.csv")

df1 = dfFix(ComunalServices,"education_details:Subjects","education_details:Subjects_001")
df1 = df1.dropna()
S_Subject = separateValues(df1)
df2 = dfFix(ComunalServices,"education_details:Subject_needed","education_details:Start_001").dropna()
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
S_Subject = concatDF(S_Subject.T,newSubject.T).T
S_Subject = pd.DataFrame(np.unique(np.array(S_Subject)))
mkCSV(S_Subject,"S_Subject.csv")

df1 = dfFix(ComunalServices,"education_details:Subjects","education_details:Subjects_001")
df1 = df1.dropna()
S_Subject = separateValues(df1)
df2 = dfFix(ComunalServices,"education_details:Subject_needed","education_details:Start_001").dropna()
S_Subject_has_S_EducationalCenter = concatDF(S_Subject,df2)
mkCSV(S_Subject_has_S_EducationalCenter,"S_Subject_has_S_EducationalCentercsv")

df1 = dfFix(ComunalServices,"Health_Center","Health_Center_details:Capacity")
df1 = df1.isin(["primary_care"])
S_PrimaryAttention = dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
S_PrimaryAttention = get_valueBySector(df1,S_PrimaryAttention)
S_PrimaryAttention = set_defaultColumn(S_PrimaryAttention)
mkCSV(S_PrimaryAttention,"S_PrimaryAttention.csv")

df1 = dfFix(ComunalServices,"Health_Center","Health_Center_details:Capacity")
df1 = df1.isin(["hospital"])                                                  
df2 = dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
df3 = dfFix(ComunalServices,"Health_Center_details:Capacity","Associate_infrastructure:Sanitation")
S_Hospital = concatDF(df2,df3)
S_Hospital = get_valueBySector(df1,S_Hospital)
S_Hospital = set_defaultColumn(S_Hospital)
mkCSV(S_Hospital,"S_Hospital.csv")

df1 = dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service")
df1 = df1.isin(["cementary"])
df2 = dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
df3 = dfFix(ComunalServices,"Cementary_Details:Drainage","Education_level")
s_cementery = concatDF(df2,df3)
s_cementery = get_valueBySector(df1,s_cementery)
mkCSV(s_cementery,"s_cementery.csv")

df1 = dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service") 
df1 = df1.isin(["other"])
df2 = dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
df3 = dfFix(ComunalServices,"General_Information:Other_service","General_Information:Sharing_Services")
S_OtherCenter = concatDF(df2,df3)
S_OtherCenter = get_valueBySector(df1,S_OtherCenter)
S_OtherCenter = set_defaultColumn(S_OtherCenter)
mkCSV(S_OtherCenter,"S_OtherCenter.csv")

S_BuildingQuality = dfFix(ComunalServices,"Construction_Details:Appropiate_Roof","meta:instanceID") 
S_BuildingQuality = S_BuildingQuality.isin(["yes"])
mkCSV(S_BuildingQuality,"S_BuildingQuality.csv")

#%%Service
#S_HealthCenterService #información de plano

S_MedicineAccess = dfFix(HouseHold,"health_001:Healthcare","Economy:FamilyHead")
S_MedicineAccess = S_MedicineAccess.isin(["yes"])
mkCSV(S_MedicineAccess,"S_MedicineAccess.csv")

S_DataAccess = dfFix(Entities,"Data_Access","Antenna")
S_DataAccess = separateValues(S_DataAccess)
mkCSV(S_DataAccess,"S_DataAccess.csv")

S_RepeaterAntena = dfFix(Entities,"Antenna","meta:instanceID")
mkCSV(S_RepeaterAntena,"S_RepeaterAntena.csv")

S_NoEducationCause = dfFix(Entities,"Education_Issues","Data_Access")
S_NoEducationCause = separateValues(S_NoEducationCause)
mkCSV(S_NoEducationCause,"S_NoEducationCause.csv")
#%%KnowEledge

S_Tecknowlege = ["Phone Call","Internet","PC","Programming"]
S_Tecknowlege = pd.DataFrame(S_Tecknowlege)
mkCSV(S_Tecknowlege,"S_Tecknowlege.csv")

S_Tecknowlege_has_Community = dfFix(GeneralCitizen,"TICs_Knowledge:Phone_Call","App_USED")
S_Tecknowlege_has_Community = S_Tecknowlege_has_Community.transpose()
mkCSV(S_Tecknowlege_has_Community,"S_Tecknowlege_has_Community.csv")

S_App = ["WhatsApp","Facebook","Skype","Instagram","Google","Youtube","Email","Word","Excel","Otra"]
S_App = pd.DataFrame(S_App)
mkCSV(S_App,"S_App.csv")

S_App_has_Community = dfFix(GeneralCitizen,"App_USED","Type_Food:Meat")
mkCSV(S_App_has_Community,"S_App_has_Community.csv")

#%% SHELTER DATA 

SH_Shelter = dfFix(Entities,"Shelter:Total_shelter","Shelter:Vulnerable_Area:Vunerable_Area")
mkCSV(SH_Shelter,"SH_Shelter.csv")

df1 = dfFix(Shelter,"Location:Latitude","Location:Accuracy")
df2 = dfFix(Shelter,"Construc_tion_Details:Appropiate_Roof","Construc_tion_Details:Picture_Outside")
df2 = df2.isin(["yes"])
SH_Building = concatDF(df1,df2)
mkCSV(SH_Building,"SH_Building.csv")


SH_House = dfFix(HouseHold,"Shelter:No_Rooms","Energy:Access_Y_N_001")
mkCSV(SH_House,"SH_House.csv")

#%%FOOD SECURITY DATA
#%%FOOD

FS_Cause = dfFix(Bibliography,"Cause 1","Affected groups due to food insecurity")
FS_Cause = FS_Cause.transpose()
FS_Cause = FS_Cause.dropna(axis = 1)
mkCSV(FS_Cause,"FS_Cause.csv") #Incompleto falta separar por comunidadades

df1 = dfFix(Bibliography,"Children","Calories of the typical dish")
df1 = df1.isin(["yes"])
df2 = dfFix(Bibliography,"Intake (g) - default value 70g-","GENERAL INFORMATION OF REFUGEES SETTLEMENT")
FS_FoodSafety = concatDF(df1,df2)
mkCSV(FS_FoodSafety,"FS_FoodSafety.csv") #Incompleto falta separar por comunidadades

FS_FoodAccess = ["meat","grain","vegetable","fruit"]
FS_FoodAccess = pd.DataFrame(FS_FoodAccess)
mkCSV(FS_FoodAccess,"FS_FoodAccess.csv")

FS_FoodAccess_has_Community = dfFix(GeneralCitizen,"Type_Food:Meat","times:One_time")
FS_FoodAccess_has_Community = FS_FoodAccess_has_Community.transpose()
mkCSV(FS_FoodAccess_has_Community,"FS_FoodAccess_has_Community.csv")

FS_TimesPerDay = ["one","two","three","Greater than three"]
FS_TimesPerDay = pd.DataFrame(FS_TimesPerDay)
mkCSV(FS_TimesPerDay,"FS_TimesPerDay.csv")

df1 = dfFix(GeneralCitizen,"times:One_time","main_food:Breakfast")
FS_TimesPerDay_has_Community = get_number(df1)
mkCSV(FS_TimesPerDay_has_Community,"FS_TimesPerDay_has_Community.csv")

FS_ImportantMeal = ["Breakfast","lunch","coffe time","dinner"]
FS_ImportantMeal = pd.DataFrame(FS_ImportantMeal)
mkCSV(FS_ImportantMeal,"FS_ImportantMeal.csv")

df1 = dfFix(GeneralCitizen,"main_food:Breakfast","typical_dish:Pork")
FS_ImportantMeal_has_Community = get_number(df1)
mkCSV(FS_ImportantMeal_has_Community,"FS_ImportantMeal_has_Community.csv")

FS_TypicalPlate = ["pork","beef","chicken","lamp","cereals","legumes","fruits"]
FS_TypicalPlate = pd.DataFrame(FS_TypicalPlate)
mkCSV(FS_TypicalPlate,"FS_TypicalPlate.csv")

df1 = dfFix(Bibliography,"Pork (200 kcal/100g)","Intake (g) - default value 70g-")
FS_TypicalPlate_has_Community = get_number(df1)
mkCSV(FS_TypicalPlate_has_Community,"FS_TypicalPlate_has_Community.csv")
#%%Source

FS_FoodSource = ["Humanitarian Aid","Crops","Market"]
FS_FoodSource = pd.DataFrame(FS_FoodSource)
mkCSV(FS_FoodSource,"FS_FoodSource.csv")

df1 = dfFix(GeneralCitizen,"Main_food_source:Humanitarian_Aid","meta:instanceID")
FS_FoodSource_has_Community = get_number(df1)
mkCSV(FS_FoodSource_has_Community,"FS_FoodSource_has_Community.csv")

FS_CultivationSeason = dfFix(LocalLeaders,"Food_security:cultivation_months","Food_security:own_food_months")
FS_CultivationSeason = vectorizeValue(FS_CultivationSeason)
mkCSV(FS_CultivationSeason,"FS_CultivationSeason.csv")

#%%Corral and Crop

df1 = dfFix(LocalLeaders,"Food_security:Grazing_technique","Costs:basic_basket")
df2 = dfFix(LocalLeaders,"Food_security:fertilizers","Food_security:storing_food")
df2 = df2.isin(["yes"])
FS_CorralCropData = concatDF(df1,df2)
mkCSV(FS_CorralCropData,"FS_CorralCropData.csv")

df1 = dfFix(FarmyardCrop,"Item","Property")
df1 = df1.isin(["crop_area"])
df2 = dfFix(FarmyardCrop,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
df3 = dfFix(FarmyardCrop,"Property","Drainage")
df4 = dfFix(FarmyardCrop,"Drainage","Irrigation") #No se ajusta dato a Requisitos
df4 = df4.isin(["yes"])
FS_CorralUbication = concatDF(df2,concatDF(df3,df4))
FS_CorralUbication = get_valueBySector(df1,FS_CorralUbication)
mkCSV(FS_CorralUbication,"FS_CorralUbication.csv")

df1 = dfFix(FarmyardCrop,"Item","Property")
df1 = df1.isin(["farmyard"])
df2 = dfFix(FarmyardCrop,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
df3 = dfFix(FarmyardCrop,"Property","Drainage")
df4 = dfFix(FarmyardCrop,"Irrigation","Irrigation_details:Water_pump")
df4 = df4.isin(["yes"]) #No se ajusta dato a Requisitos
FS_CropUbication = concatDF(df2,concatDF(df3,df4))
FS_CropUbication =get_valueBySector(df1,FS_CropUbication)
mkCSV(FS_CropUbication,"FS_CropUbication.csv")

#%%Continuity

FS_FoodAccessContinuity = dfFix(LocalLeaders,"Food_security:perishable_food","Costs:basic_basket")
mkCSV(FS_FoodAccessContinuity,"FS_FoodAccessContinuity.csv")

FS_SelfSufficiencySeason = dfFix(LocalLeaders,"Food_security:own_food_months","Food_security:kind_food")
FS_SelfSufficiencySeason = vectorizeValue(FS_SelfSufficiencySeason)
mkCSV(FS_SelfSufficiencySeason,"FS_SelfSufficiencySeason.csv")

FS_OwnCultivationFoodType = dfFix(LocalLeaders,"Food_security:kind_food","Food_security:fertilizers")
FS_OwnCultivationFoodType = separateValues(FS_OwnCultivationFoodType)
mkCSV(FS_OwnCultivationFoodType,"FS_OwnCultivationFoodType.csv")

FS_GrainConservation = dfFix(LocalLeaders,"Food_security:dry_food","Food_security:perishable_food")
FS_GrainConservation = separateValues(FS_GrainConservation)
mkCSV(FS_GrainConservation,"FS_GrainConservation.csv")

df1 = dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service")
df1 = df1.isin(["gran_mill"])
df2 = dfFix(ComunalServices,"Grain_Mill_Details:Available","Grain_Mill_Details:Type")
df3 = dfFix(ComunalServices,"Grain_Mill_Details:Engine","Cementary_Details:Drainage")
FS_GrainMill = concatDF(df2,df3)
FS_GrainMill = get_valueBySector(df1,FS_GrainMill)
mkCSV(FS_GrainMill,"FS_GrainMill.csv")