# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:40 2020

@author: guill
"""

import NAUTIAETL as nt

def infWater(Entities,HouseHold,WaterInf):
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