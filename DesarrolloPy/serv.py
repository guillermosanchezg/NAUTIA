# -*- coding: utf-8 -*-
"""
Created on Sun May 31 13:38:33 2020

@author: guill
"""

import NAUTIAETL as nt
import NAUTIAFIXCSV as nfv

def serv(HouseHold,Entities):
    #S_HealthCenterService #información de plano
    
    S_MedicineAccess = nfv.dfFix(HouseHold,"health_001:Healthcare","Economy:FamilyHead")
    S_MedicineAccess = S_MedicineAccess.isin(["yes"])
    nt.mkCSV(S_MedicineAccess,"S_MedicineAccess.csv")
    
    S_DataAccess = nfv.dfFix(Entities,"Data_Access","Antenna")
    S_DataAccess = nt.separateValues(S_DataAccess)
    nt.mkCSV(S_DataAccess,"S_DataAccess.csv")
    
    S_RepeaterAntena = nfv.dfFix(Entities,"Antenna","meta:instanceID")
    nt.mkCSV(S_RepeaterAntena,"S_RepeaterAntena.csv")
    
    S_NoEducationCause = nfv.dfFix(Entities,"Education_Issues","Data_Access")
    S_NoEducationCause = nt.separateValues(S_NoEducationCause)
    nt.mkCSV(S_NoEducationCause,"S_NoEducationCause.csv")