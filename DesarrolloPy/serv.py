# -*- coding: utf-8 -*-
"""
Created on Sun May 31 13:38:33 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAETL as nt

def serv(HouseHold,Entities):
    #%%Service
    #S_HealthCenterService #información de plano
    
    S_MedicineAccess = nt.dfFix(HouseHold,"health_001:Healthcare","Economy:FamilyHead")
    S_MedicineAccess = S_MedicineAccess.isin(["yes"])
    nt.mkCSV(S_MedicineAccess,"S_MedicineAccess.csv")
    
    S_DataAccess = nt.dfFix(Entities,"Data_Access","Antenna")
    S_DataAccess = nt.separateValues(S_DataAccess)
    nt.mkCSV(S_DataAccess,"S_DataAccess.csv")
    
    S_RepeaterAntena = nt.dfFix(Entities,"Antenna","meta:instanceID")
    nt.mkCSV(S_RepeaterAntena,"S_RepeaterAntena.csv")
    
    S_NoEducationCause = nt.dfFix(Entities,"Education_Issues","Data_Access")
    S_NoEducationCause = nt.separateValues(S_NoEducationCause)
    nt.mkCSV(S_NoEducationCause,"S_NoEducationCause.csv")