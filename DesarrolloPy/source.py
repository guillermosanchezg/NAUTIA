# -*- coding: utf-8 -*-
"""
Created on Sun May 31 14:06:42 2020

@author: guill
"""

import pandas as pd
import NAUTIAETL as nt

def source(GeneralCitizen,LocalLeaders):
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