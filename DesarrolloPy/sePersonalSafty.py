# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:37 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAETL as nt

def sePersonalSafty(WomenGroup,LocalLeaders,SanitationInfra,Entities):
    SE_SafetyPlace = nt.dfFix(WomenGroup,"Feel_Safe:Street_morning","Feel_Safe:Firewood_collection_001")
    SE_SafetyPlace = nt.getSubColumnNames(SE_SafetyPlace,10)
    nt.mkCSV(SE_SafetyPlace,"SE_SafetyPlace.csv") 
    
    SE_SafetyPlace_has_Community = nt.dfFix(WomenGroup,"Feel_Safe:Street_morning","Feel_Safe:Firewood_collection_001")
    SE_SafetyPlace = pd.DataFrame()
    SE_SafetyPlace = nt.getSubColumnNames(SE_SafetyPlace_has_Community,10)
    array1 = np.array([])
    for row in np.array(SE_SafetyPlace_has_Community):
        for row2 in np.array(SE_SafetyPlace):
            for elem2 in row2:
                array1 = np.append(array1,elem2)
    SE_SafetyPlace_has_Community = pd.DataFrame(np.array(SE_SafetyPlace_has_Community))
    SE_SafetyPlace_has_Community = nt.concatDF(SE_SafetyPlace_has_Community.T,pd.DataFrame(array1))
    nt.mkCSV(SE_SafetyPlace_has_Community,"SE_SafetyPlace_has_Community.csv") 
    
    SE_ConflictArea = nt.dfFix(WomenGroup,"Trouble_Spots","Cooking_Details:INSTRUCTION_001")
    SE_ConflictArea = SE_ConflictArea.dropna()
    SE_ConflictArea = nt.separateValues(SE_ConflictArea)
    nt.mkCSV(SE_ConflictArea,"SE_ConflictArea.csv") #IMPORRANTE Los datos entran como string de lugares, pero se quiere guardar coordenadas.
    
    df1 = nt.dfFix(LocalLeaders,"Settlement_security:secur_committees","Food_security:cultivation_months")
    df1 = df1.isin(["yes"])
    df2 = nt.dfFix(Entities,"Women_Patrol","Education_Issues")
    df2 = df2.isin(["Yes"])
    SE_SafetyCommittee = nt.concatDF(df1,df2)
    nt.mkCSV(SE_SafetyCommittee,"SE_SafetyCommittee.csv") 
    
    SE_SafetyLatrines = nt.dfFix(SanitationInfra, "Public_Latrines:Sex_segregated","Slab")
    SE_SafetyLatrines = SE_SafetyLatrines.isin(["yes"])
    nt.mkCSV(SE_SafetyLatrines,"SE_SafetyLatrines.csv") 
    