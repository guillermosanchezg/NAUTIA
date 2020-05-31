# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:40 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAETL as nt
import NAUTIAFIXCSV as nfv

def urbanism(Entities,GeneralForm,PublicSpace):
    df1 = nfv.dfFix(Entities,"Urban_Planning_001:Urban_Planning","Urban_Planning_001:Growth_area")
    df2 = nfv.dfFix(GeneralForm,"Urban_information:Boundary_limits","Urban_information:Drain_system") 
    df3 = nfv.dfFix(Entities,"Urban_Planning_001:Land_Managment","Urban_Planning_001:Risk_Managment")
    df4 = nfv.dfFix(Entities,"Urban_Planning_001:Growth_area","Urban_Planning_001:Land_Managment")
    df5 = nfv.dfFix(Entities,"Urban_Planning_001:Risk_Managment","Shelter:Housing_Improvement")
    U_Urbanism = nt.concatDF(df1,nt.concatDF(df2,nt.concatDF(df3,nt.concatDF(df4,df5))))
    nt.mkCSV(U_Urbanism,"U_Urbanism.csv")
    
    u_area = nfv.dfFix(PublicSpace,"Details:Shade_Areas","meta:instanceID")
    u_area = nt.getSubColumnNames(u_area,8)
    u_area = pd.DataFrame(u_area)
    nt.mkCSV(u_area,"u_area.csv")
    
    df1 = nfv.dfFix(PublicSpace,"Details:Shade_Areas","meta:instanceID")
    df1 = df1.isin(["yes"])
    u_area = nt.getSubColumnNames(df1,8)
    df = pd.DataFrame()
    U_Area_has_Community = nfv.dfFix(PublicSpace,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
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
    
    U_Road = nfv.dfFix(GeneralForm,"Urban_information:Drain_system","Energy:electrical_grid") 
    nt.mkCSV(U_Road,"U_Road.csv") #Falta la información que sale de Plano
    
    df1 = nfv.dfFix(PublicSpace,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy") 
    df2 = nfv.dfFix(PublicSpace,"Details:Shade_Areas","meta:instanceID") 
    df2 = df2.isin(["yes"])
    U_RecreationalArea = nt.concatDF(df1,df2)
    nt.mkCSV(U_RecreationalArea,"U_RecreationalArea.csv")
    
    #U_PublicSpace dato , no corresponde a la ETL