# -*- coding: utf-8 -*-
"""
Created on Sun May 31 14:06:42 2020

@author: guill
"""

import NAUTIAETL as nt

def corralCrop(LocalLeaders,FarmyardCrop):
    df1 = nt.dfFix(LocalLeaders,"Food_security:Grazing_technique","Costs:basic_basket")
    df2 = nt.dfFix(LocalLeaders,"Food_security:fertilizers","Food_security:storing_food")
    df2 = df2.isin(["yes"])
    FS_CorralCropData = nt.concatDF(df1,df2)
    nt.mkCSV(FS_CorralCropData,"FS_CorralCropData.csv")
    
    df1 = nt.dfFix(FarmyardCrop,"Item","Property")
    df1 = df1.isin(["crop_area"])
    df2 = nt.dfFix(FarmyardCrop,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
    df3 = nt.dfFix(FarmyardCrop,"Property","Drainage")
    df4 = nt.dfFix(FarmyardCrop,"Drainage","Irrigation") #No se ajusta dato a Requisitos
    df4 = df4.isin(["yes"])
    FS_CorralUbication = nt.concatDF(df2,nt.concatDF(df3,df4))
    FS_CorralUbication = nt.get_valueBySector(df1,FS_CorralUbication)
    nt.mkCSV(FS_CorralUbication,"FS_CorralUbication.csv")
    
    df1 = nt.dfFix(FarmyardCrop,"Item","Property")
    df1 = df1.isin(["farmyard"])
    df2 = nt.dfFix(FarmyardCrop,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
    df3 = nt.dfFix(FarmyardCrop,"Property","Drainage")
    df4 = nt.dfFix(FarmyardCrop,"Irrigation","Irrigation_details:Water_pump")
    df4 = df4.isin(["yes"]) #No se ajusta dato a Requisitos
    FS_CropUbication = nt.concatDF(df2,nt.concatDF(df3,df4))
    FS_CropUbication =nt.get_valueBySector(df1,FS_CropUbication)
    nt.mkCSV(FS_CropUbication,"FS_CropUbication.csv")