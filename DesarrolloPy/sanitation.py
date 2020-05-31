# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:41 2020

@author: guill
"""

import NAUTIAETL as nt

def sanitation(Entities,SanitationInf):
    df1 = nt.dfFix(Entities,"Sanitation:Open_defecation","Sanitation:Type_of_Latrine")
    df1 = df1.isin(["yes"])
    df2 = nt.dfFix(Entities,"Sanitation:Type_of_Latrine","Sanitation:Individual_Latrines")
    INF_SanitationAccess = nt.concatDF(df1,df2)
    nt.mkCSV(INF_SanitationAccess,"INF_SanitationAccess.csv")
    
    inf_sanitationsystemquality = nt.dfFix(SanitationInf,"Slab","meta:instanceID")
    inf_sanitationsystemquality = inf_sanitationsystemquality.isin(["yes"])
    nt.mkCSV(inf_sanitationsystemquality,"inf_sanitationsystemquality.csv")