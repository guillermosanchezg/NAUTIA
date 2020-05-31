# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:40 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAETL as nt
import NAUTIAFIXCSV as nfv

def fisicoAmbiental(Bibliography,Entities):
    df1 = nfv.dfFix(Bibliography,"Latitude","Topography")
    df2 = nfv.dfFix(Entities,"Water_table","Sanitation:Personal_hygiene")
    FA_geographicIdentification = nt.concatDF(df1,df2)
    nt.mkCSV(FA_geographicIdentification,"FA_geographicIdentification.csv")
    
    FA_Topography = nfv.dfFix(Bibliography,"Upper bound (m)","FOOD SECURITY")
    nt.mkCSV(FA_Topography,"FA_Topography.csv")
    
    FA_NaturalResource = nfv.dfFix(Bibliography,"r.1","ACTORS (PARTNERS) IDENTIFICATION")
    FA_NaturalResource = FA_NaturalResource.dropna(axis = 1)
    FA_NaturalResource = np.array(FA_NaturalResource)
    bound = []
    resource = []
    for row in FA_NaturalResource:
        for elem in row:
            bound = np.append(bound,elem)
            resource = np.append(resource,'river')       
    bound = pd.DataFrame(bound)
    bound = bound.reset_index(drop = True)
    resource = pd.DataFrame(resource)
    resource = resource.reset_index(drop = True)
    FA_NaturalResource = nt.concatDF(bound,resource)
    nt.mkCSV(FA_NaturalResource,"FA_NaturalResource.csv")