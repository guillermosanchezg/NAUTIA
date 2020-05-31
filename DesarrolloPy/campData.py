# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:35 2020

@author: guill
"""

import pandas as pd
import NAUTIAETL as nt

def campData(Bibliography,Entities,LocalLeaders):
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