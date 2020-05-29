# -*- coding: utf-8 -*-
"""
Created on Fri May 29 18:21:10 2020

@author: guill
"""

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

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"

def getPath(mainpath,filename):
    return os.path.join(mainpath, filename)

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

def dropRow(df,i):
    return df.drop(index = i)

def concatDF(df1,df2):
    return  pd.concat([df1,df2],axis = 1, ignore_index = True, sort = True)

def mkCSV(df,fileName):
    df = df.dropna(how = 'all')
    df *= 1   
    fileName = fileName.lower()
    df.to_csv('DataSetFinales/'+fileName,sep=',',header = False, index=False, encoding='utf-8')

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


def replacestr(df,cad1,cad2):
    cols=list(df.columns)
    for col in cols:
        df[col] = df[col].astype(str).str.replace(cad1,cad2)
    return df

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


def get_claveValor(df1,df2,df3):
    array1 = np.array(df2)
    array2 = np.array(df1)
    result1 = []
    result2 = []
    result3 = []
    i = 0
    for row in array1:
        var = array2[i]
        for elem in row:
            result1 = np.append(result1,elem)
            result2 = np.append(result2,var)
        for r in np.array(df3):
            for l in r:
                result3 = np.append(result3,l)
        i+=1
    result2 = pd.DataFrame(result2)
    result2 = result2.reset_index(drop = True)
    result1 = pd.DataFrame(result1)
    result1 = result1.reset_index(drop = True)
    result3 = pd.DataFrame(result3)
    result3 = result3.reset_index(drop = True)
    return concatDF(result2,concatDF(result1,result3))

def get_number(df,df2):
    df = np.array(df)
    df2 = np.array(df2)
    array = np.array([])
    array2 = np.array([])
    for row in df:
        for elem in row:
            array = np.append(array,elem)
        for row2 in df2:
            for elem2 in row2:
                array2 = np.append(array2,elem2)
    array = (pd.DataFrame(array)).fillna(0) 
    array2 = pd.DataFrame(array2)
    return concatDF(array,array2) 

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
    df = df.dropna(how = 'all')
    season = pd.DataFrame()
    year = ['january','february','march','april','may','june','july','august','september','october','november','december']
    for row in np.array(df):
        corpus = np.array([])
        count_vectorizer = CountVectorizer(stop_words = spanish_stopwords+english_stopwords)
        for elem in row:
            corpus = np.append(corpus,[elem])
        X = count_vectorizer.fit_transform(corpus)
        array = count_vectorizer.get_feature_names()
        season = concatDF(season,pd.DataFrame(array))
    season = season.T
    result = pd.DataFrame()
    for row in np.array(season):
        vect = np.array([],dtype = bool)
        for elem in year:
            flag = False
            for month in row:
                if(month == elem):
                    flag = True
            if(flag):
                vect = np.append(vect,True)
            else:
                vect = np.append(vect,False)
        result = concatDF(result, pd.DataFrame(vect))
    return result.T

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

def dropNaAndResetIndex(df):
    df = df.dropna(how = 'all')
    df = np.array(df)
    return pd.DataFrame(df)
    
def get_applianceDF(df):
    df1 = dfFix(df,0,1)
    df2 = dfFix(df,1)
    array = np.array([])
    appliance = np.array([])
    for row in np.array(df1):
        corpus = np.array([])
        for elem in row:
            corpus = np.append(corpus,[elem])
        count_vectorizer = CountVectorizer(stop_words = spanish_stopwords+english_stopwords, vocabulary = ['light_bulbs','mobile_phone','radio_music_pl','tv_dvd','laptop_tablet_','fridge','electrical_sto','others'])
        X = count_vectorizer.fit_transform(corpus)
        array = count_vectorizer.get_feature_names()
        for elem in array:
            appliance = np.append(appliance,elem)
    appliance = pd.DataFrame(appliance)
    hours = np.array([])
    for row in np.array(df2):
        for elem in row:
            hours = np.append(hours,elem)
    hours = pd.DataFrame(hours)
    hours = (hours.dropna())
    return concatDF(appliance,hours)