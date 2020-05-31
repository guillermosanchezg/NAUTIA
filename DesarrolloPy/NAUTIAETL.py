# -*- coding: utf-8 -*-
"""
Created on Fri May 29 18:21:10 2020

@author: guill
"""

import numpy as np
import pandas as pd
import os
import sklearn
import NAUTIAFIXCSV as nfv
#pd.options.mode.chained_assignment = None  # default='warn'


from sklearn.feature_extraction.text import CountVectorizer
count_vectorizer = CountVectorizer()

import nltk
nltk.download("popular") # required to download the stopwords lists
from nltk.corpus import stopwords

spanish_stopwords = stopwords.words('spanish')
english_stopwords = stopwords.words('english')

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"

def concatDF(df1,df2):
    return  pd.concat([df1,df2],axis = 1, ignore_index = True, sort = True)

def mkCSV(df,fileName):
    df = df.dropna(how = 'all')
    df *= 1   
    fileName = fileName.lower()
    df.to_csv('DataSetFinales/'+fileName,sep=',',header = False, index=False, encoding='utf-8')

def replacestr(df,cad1,cad2):
    cols=list(df.columns)
    for col in cols:
        df[col] = df[col].astype(str).str.replace(cad1,cad2)
    return df
    
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
                df2 = nfv.dropRow(df2,i)
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
    df1 = nfv.dfFix(df,0,1)
    df2 = nfv.dfFix(df,1)
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