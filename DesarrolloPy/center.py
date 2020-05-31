# -*- coding: utf-8 -*-
"""
Created on Sun May 31 13:38:32 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAETL as nt
import NAUTIAFIXCSV as nfv

def center(ComunalServices):
    df1 = nfv.dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service")
    df1 = df1.isin(["educational_center"])
    df2 = nfv.dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
    df3 = nfv.dfFix(ComunalServices,"Education_level","education_details:Subjects")
    df4 = nfv.dfFix(ComunalServices,"education_details:Start_001","Health_Center")
    S_EducationalCenter = nt.concatDF(df2,(nt.concatDF(df3,df4)))
    S_EducationalCenter = nt.get_valueBySector(df1,S_EducationalCenter)
    nt.mkCSV(S_EducationalCenter,"S_EducationalCenter.csv")
    
    df1 = nfv.dfFix(ComunalServices,"education_details:Subjects","education_details:Subjects_001")
    df1 = df1.dropna()
    S_Subject = nt.separateValues(df1)
    df2 = nfv.dfFix(ComunalServices,"education_details:Subject_needed","education_details:Start_001").dropna()
    S_Subject = np.array(S_Subject)
    df2 = np.array(df2)
    newSubject = np.array([])
    for column in df2:
        for elem in column:
            flag = False
            for column2 in S_Subject:
                for elem2 in column2:
                    if(elem == elem2):
                        flag = True
            if(flag == False):
                newSubject = np.append(newSubject,elem)
    S_Subject = pd.DataFrame(S_Subject)
    newSubject = pd.DataFrame(newSubject)
    S_Subject = nt.concatDF(S_Subject.T,newSubject.T).T
    S_Subject = pd.DataFrame(np.unique(np.array(S_Subject)))
    nt.mkCSV(S_Subject,"S_Subject.csv")
    
    df1 = nfv.dfFix(ComunalServices,"education_details:Subjects","education_details:Subjects_001")
    df1 = df1.dropna()
    S_Subject = nt.separateValues(df1)
    df2 = nfv.dfFix(ComunalServices,"education_details:Subject_needed","education_details:Start_001").dropna()
    S_Subject_has_S_EducationalCenter = nt.concatDF(S_Subject,df2)
    nt.mkCSV(S_Subject_has_S_EducationalCenter,"S_Subject_has_S_EducationalCenter.csv")
    
    df1 = nfv.dfFix(ComunalServices,"Health_Center","Health_Center_details:Capacity")
    df1 = df1.isin(["primary_care"])
    S_PrimaryAttention = nfv.dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
    S_PrimaryAttention = nt.get_valueBySector(df1,S_PrimaryAttention)
    S_PrimaryAttention = nt.set_defaultColumn(S_PrimaryAttention)
    nt.mkCSV(S_PrimaryAttention,"S_PrimaryAttention.csv")
    
    df1 = nfv.dfFix(ComunalServices,"Health_Center","Health_Center_details:Capacity")
    df1 = df1.isin(["hospital"])                                                  
    df2 = nfv.dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
    df3 = nfv.dfFix(ComunalServices,"Health_Center_details:Capacity","Associate_infrastructure:Sanitation")
    S_Hospital = nt.concatDF(df2,df3)
    S_Hospital = nt.get_valueBySector(df1,S_Hospital)
    S_Hospital = nt.set_defaultColumn(S_Hospital)
    S_Hospital = S_Hospital.dropna(how = 'all')
    S_Hospital[3] = S_Hospital[3].apply(np.int64)
    nt.mkCSV(S_Hospital,"S_Hospital.csv")
    
    df1 = nfv.dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service")
    df1 = df1.isin(["cementary"])
    df2 = nfv.dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
    df3 = nfv.dfFix(ComunalServices,"Cementary_Details:Drainage","Education_level")
    s_cementery = nt.concatDF(df2,df3)
    s_cementery = nt.get_valueBySector(df1,s_cementery)
    nt.mkCSV(s_cementery,"s_cementery.csv")
    
    df1 = nfv.dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service") 
    df1 = df1.isin(["other"])
    df2 = nfv.dfFix(ComunalServices,"General_Information:Record_your_current_location:Latitude","General_Information:Record_your_current_location:Accuracy")
    df3 = nfv.dfFix(ComunalServices,"General_Information:Other_service","General_Information:Sharing_Services")
    S_OtherCenter = nt.concatDF(df2,df3)
    S_OtherCenter = nt.get_valueBySector(df1,S_OtherCenter)
    S_OtherCenter = nt.set_defaultColumn(S_OtherCenter)
    nt.mkCSV(S_OtherCenter,"S_OtherCenter.csv")
    
    S_BuildingQuality = nfv.dfFix(ComunalServices,"Construction_Details:Appropiate_Roof","meta:instanceID") 
    S_BuildingQuality = S_BuildingQuality.isin(["yes"])
    nt.mkCSV(S_BuildingQuality,"S_BuildingQuality.csv")