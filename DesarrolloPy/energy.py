# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:49 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAETL as nt

def energy(GeneralForm,Entities,Business,HouseHold,ComunalServices,WomenGroup,EnergyINF):    
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
    nt.mkCSV(INF_StreetLamp,"INF_StreetLamp.csv")
