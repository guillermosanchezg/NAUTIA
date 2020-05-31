# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:30:38 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAETL as nt
import NAUTIAFIXCSV as nfv

def camp(Bibliography,Entities):
    df1 = nfv.dfFix(Bibliography,"Implementation date of the refugee camp (year)","Migration reasons")
    df2 = nfv.dfFix(Entities,"GENERAL_INFORMATION:Secondary_movement","GENERAL_INFORMATION:Relationship")
    df2 = df2['GENERAL_INFORMATION:Secondary_movement'].mean()
    array = np.array([df2])
    camp = nt.concatDF(df1,pd.DataFrame(array))
    nt.mkCSV(camp,"camp.csv") 