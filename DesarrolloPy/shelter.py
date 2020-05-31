# -*- coding: utf-8 -*-
"""
Created on Sun May 31 13:38:33 2020

@author: guill
"""

import NAUTIAETL as nt

def shelter(Entities,Shelter,HouseHold):   
    SH_Shelter = nt.dfFix(Entities,"Shelter:Total_shelter","Shelter:Vulnerable_Area:Vunerable_Area")
    nt.mkCSV(SH_Shelter,"SH_Shelter.csv")
    
    df1 = nt.dfFix(Shelter,"Location:Latitude","Location:Accuracy")
    df2 = nt.dfFix(Shelter,"Construc_tion_Details:Appropiate_Roof","Construc_tion_Details:Picture_Outside")
    df2 = df2.isin(["yes"])
    SH_Building = nt.concatDF(df1,df2)
    nt.mkCSV(SH_Building,"SH_Building.csv")
    
    SH_House = nt.dfFix(HouseHold,"Shelter:No_Rooms","Energy:Access_Y_N_001")
    nt.mkCSV(SH_House,"SH_House.csv")