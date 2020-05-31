# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:40 2020

@author: guill
"""

import pandas as pd
import NAUTIAETL as nt

def seGenderData(GeneralCitizen):
    #SE_GenderData = nt.dfFix(Entities,"","")
    #nt.mkCSV(SE_GenderData,"SE_GenderData.csv") No existe dicho dato en los formularios
    
    SE_WorkType = ["Firewood Collection", "Cooking"]
    SE_WorkType = pd.DataFrame(SE_WorkType)
    nt.mkCSV(SE_WorkType,"SE_WorkType.csv")
    
    df1 = nt.dfFix(GeneralCitizen,"Firewood_collection:Childs","Cooking:Childs_001")
    df2 = nt.dfFix(GeneralCitizen,"Cooking:Childs_001","TICs_Knowledge:Phone_Call")
    df1 = df1.transpose()
    df2 = df2.transpose()
    df1 = df1.reset_index(drop = True)
    df2 = df2.reset_index(drop = True)
    SE_WorkType_has_Community = nt.concatDF(df1,df2).T
    SE_WorkType = ["Firewood Collection", "Cooking"]
    SE_WorkType_has_Community = nt.concatDF(SE_WorkType_has_Community,pd.DataFrame(SE_WorkType))
    nt.mkCSV(SE_WorkType_has_Community,"SE_WorkType_has_Community.csv")