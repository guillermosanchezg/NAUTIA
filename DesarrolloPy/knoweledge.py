# -*- coding: utf-8 -*-
"""
Created on Sun May 31 13:38:33 2020

@author: guill
"""

import pandas as pd
import NAUTIAETL as nt

def knoweledge(GeneralCitizen):
    S_Tecknowlege = ["Phone Call","Internet","PC","Programming"]
    S_Tecknowlege = pd.DataFrame(S_Tecknowlege)
    nt.mkCSV(S_Tecknowlege,"S_Tecknowlege.csv")
    
    S_Tecknowlege_has_Community = nt.dfFix(GeneralCitizen,"TICs_Knowledge:Phone_Call","App_USED")
    S_Tecknowlege_has_Community = S_Tecknowlege_has_Community.transpose()
    nt.mkCSV(S_Tecknowlege_has_Community,"S_Tecknowlege_has_Community.csv")
    
    S_App = ["whatsapp","facebook","skype","instagram","google","youtube","email","word","excel","otra"]
    S_App = pd.DataFrame(S_App)
    nt.mkCSV(S_App,"S_App.csv")
    
    df1 = nt.dfFix(GeneralCitizen,"App_USED","App_needed")
    df1 = nt.set_sector(df1,"Used")
    df2 = nt.dfFix(GeneralCitizen,"App_needed","Type_Food:Meat")
    df2 = nt.set_sector(df2,"Necesity")
    S_App_has_Community = nt.concatDF(df1.T,df2.T).T
    nt.mkCSV(S_App_has_Community,"S_App_has_Community.csv")