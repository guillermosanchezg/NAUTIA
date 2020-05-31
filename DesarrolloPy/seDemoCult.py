# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:37 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAETL as nt
import NAUTIAFIXCSV as nfv

def seDemoCult(Entities,HouseHold):
    df1 = nfv.dfFix(Entities,"Population:Women:Infants","Population:Men:Infants_001")
    df2 = nfv.dfFix(Entities,"Population:Men:Infants_001","Fuel_Cost:Main_Fuel")
    df1 = np.array(df1)
    df2 = np.array(df2)
    array = np.array([],dtype = int)
    array = df1+df2
    SE_population = pd.DataFrame(array)
    nt.mkCSV(SE_population,"SE_population.csv")
    
    SE_HouseHoldComposition = nfv.dfFix(HouseHold,"General:Old_women","Shelter:No_Rooms")
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
    
    SE_PersonalHygiene = nfv.dfFix(Entities,"Sanitation:Personal_hygiene","Sanitation:Excreta")
    nt.mkCSV(SE_PersonalHygiene,"SE_PersonalHygiene.csv")
    
    SE_CleaningMaterial = nfv.dfFix(Entities,"Sanitation:Excreta","Sanitation:Open_defecation")
    nt.mkCSV(SE_CleaningMaterial,"SE_CleaningMaterial.csv")