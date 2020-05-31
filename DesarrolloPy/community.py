# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:27:08 2020

@author: guill
"""

import pandas as pd
import NAUTIAETL as nt

def community(communityType):
    if(communityType == 1):
        community = ["Shimelba"]
    else: 
        community = ["Tigray"]
    community = pd.DataFrame(community)
    nt.mkCSV(community,"community.csv")