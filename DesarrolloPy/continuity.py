# -*- coding: utf-8 -*-
"""
Created on Sun May 31 14:06:43 2020

@author: guill
"""

import NAUTIAETL as nt
import NAUTIAFIXCSV as nfv

def continuity(LocalLeaders,ComunalServices):
    FS_FoodAccessContinuity = nfv.dfFix(LocalLeaders,"Food_security:perishable_food","Costs:basic_basket")
    nt.mkCSV(FS_FoodAccessContinuity,"FS_FoodAccessContinuity.csv")
    
    FS_SelfSufficiencySeason = nfv.dfFix(LocalLeaders,"Food_security:own_food_months","Food_security:kind_food")
    FS_SelfSufficiencySeason = nt.vectorizeValue(FS_SelfSufficiencySeason)
    nt.mkCSV(FS_SelfSufficiencySeason,"FS_SelfSufficiencySeason.csv")
    
    FS_OwnCultivationFoodType = nfv.dfFix(LocalLeaders,"Food_security:kind_food","Food_security:fertilizers")
    FS_OwnCultivationFoodType = nt.separateValues(FS_OwnCultivationFoodType)
    nt.mkCSV(FS_OwnCultivationFoodType,"FS_OwnCultivationFoodType.csv")
    
    FS_GrainConservation = nfv.dfFix(LocalLeaders,"Food_security:dry_food","Food_security:perishable_food")
    FS_GrainConservation = nt.separateValues(FS_GrainConservation)
    nt.mkCSV(FS_GrainConservation,"FS_GrainConservation.csv")
    
    df1 = nfv.dfFix(ComunalServices,"General_Information:Type_of_service","General_Information:Other_service")
    df1 = df1.isin(["gran_mill"])
    df2 = nfv.dfFix(ComunalServices,"Grain_Mill_Details:Available","Grain_Mill_Details:Type")
    df3 = nfv.dfFix(ComunalServices,"Grain_Mill_Details:Engine","Cementary_Details:Drainage")
    FS_GrainMill = nt.concatDF(df2,df3)
    FS_GrainMill = nt.get_valueBySector(df1,FS_GrainMill)
    nt.mkCSV(FS_GrainMill,"FS_GrainMill.csv")