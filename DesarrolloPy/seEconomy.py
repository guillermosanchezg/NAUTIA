# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:39 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAETL as nt

def seEconomy(LocalLeaders,HouseHold,Priorities):
    SE_Economy = nt.dfFix(LocalLeaders, "Costs:cost_basic_basket","Costs:cost_firewood")
    nt.mkCSV(SE_Economy,"SE_Economy.csv") 
    
    SE_Incometype = nt.dfFix(HouseHold, "Economy:Main_inco","Economy:Money")
    nt.mkCSV(SE_Incometype,"SE_Incometype.csv") 
    
    df1 = nt.dfFix(HouseHold, "General:Gender","General:Settlement")
    df2 = nt.dfFix(HouseHold, "Economy:Money","Economy:Food")
    SE_IncomeTtype_has_Community = nt.concatDF(df1,df2)
    nt.mkCSV(SE_IncomeTtype_has_Community,"SE_IncomeTtype_has_Community.csv")
    
    SE_ExpenseType = ['food','clothes','water','education','transport','health','energy']
    SE_ExpenseType = pd.DataFrame(SE_ExpenseType)
    nt.mkCSV(SE_ExpenseType,"SE_ExpenseType.csv")
    
    df1 = nt.dfFix(HouseHold, "General:Gender","General:Settlement")
    df2 = nt.dfFix(HouseHold, "Economy:Food","meta:instanceID")
    df3 = pd.DataFrame(['food','clothes','water','education','transport','health','energy'])
    SE_ExpenseType_has_Community = nt.get_claveValor(df1,df2,df3)
    nt.mkCSV(SE_ExpenseType_has_Community,"SE_ExpenseType_has_Community.csv")
    
    priority = ['energy','shelter','water access','sanitation','education','health','public space','food','TIC','work','waste management','public transport','religious center','socio cultural center','market']
    priority = pd.DataFrame(priority)
    nt.mkCSV(priority,"se_priority.csv")
    
    df1 = nt.dfFix(Priorities,"group_yf0yl72:Energy_1","Priority_2:Instruction")
    df2 = nt.dfFix(Priorities,"Priority_2:Energy_2","Priority_3:Instruction_001")
    df3 = nt.dfFix(Priorities,"Priority_3:Energy_3","Priority_4:Instruction_002")
    df4 = nt.dfFix(Priorities,"Priority_4:Energy_4_001","Priority_5:Instruction_003")
    df5 = nt.dfFix(Priorities,"Priority_5:Energy_4","meta:instanceID")
    SE_Priority_has_Community = nt.concatDF(df1,(nt.concatDF(df2,nt.concatDF(df3,nt.concatDF(df4,df5)))))
    SE_Priority_has_Community = pd.DataFrame(SE_Priority_has_Community.sum())
    priority = np.array(['energy','shelter','water access','sanitation','education','health','public space','food','TIC','work','waste management','public transport','religious center','socio cultural center','market'])
    array1 = np.array([])
    array2 = np.array([])
    for i in range(5):
        for elem in priority:
            array1 = np.append(array1,elem)
            array2 = np.append(array2,i+1)
    SE_Priority_has_Community = nt.concatDF(SE_Priority_has_Community,nt.concatDF(pd.DataFrame(array1),pd.DataFrame(array2)))
    nt.mkCSV(SE_Priority_has_Community,"SE_Priority_has_Community.csv")