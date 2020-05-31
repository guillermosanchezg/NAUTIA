# -*- coding: utf-8 -*-
"""
Created on Sun May 31 14:05:53 2020

@author: guill
"""

import pandas as pd
import NAUTIAETL as nt

def food(Bibliography,GeneralCitizen):
    FS_Cause = nt.dfFix(Bibliography,"Cause 1","Affected groups due to food insecurity")
    FS_Cause = FS_Cause.transpose()
    FS_Cause = FS_Cause.dropna(axis = 1)
    nt.mkCSV(FS_Cause,"FS_Cause.csv") #Incompleto falta separar por comunidadades
    
    df1 = nt.dfFix(Bibliography,"Children","Calories of the typical dish")
    df1 = df1.isin(["yes"])
    df2 = nt.dfFix(Bibliography,"Intake (g) - default value 70g-","GENERAL INFORMATION OF REFUGEES SETTLEMENT")
    FS_FoodSafety = nt.concatDF(df1,df2)
    nt.mkCSV(FS_FoodSafety,"FS_FoodSafety.csv") #Incompleto falta separar por comunidadades
    
    FS_FoodAccess = ["meat","grain","vegetable","fruit"]
    FS_FoodAccess = pd.DataFrame(FS_FoodAccess)
    nt.mkCSV(FS_FoodAccess,"FS_FoodAccess.csv")
    
    FS_FoodAccess_has_Community = nt.dfFix(GeneralCitizen,"Type_Food:Meat","times:One_time")
    FS_FoodAccess_has_Community = FS_FoodAccess_has_Community.transpose()
    nt.mkCSV(FS_FoodAccess_has_Community,"FS_FoodAccess_has_Community.csv")
    
    FS_TimesPerDay = ["one","two","three","Greater than three"]
    FS_TimesPerDay = pd.DataFrame(FS_TimesPerDay)
    nt.mkCSV(FS_TimesPerDay,"FS_TimesPerDay.csv")
    
    df1 = nt.dfFix(GeneralCitizen,"times:One_time","main_food:Breakfast")
    times = pd.DataFrame([["one","two","three","Greater than three"]])
    FS_TimesPerDay_has_Community = nt.get_number(df1,times)
    nt.mkCSV(FS_TimesPerDay_has_Community,"FS_TimesPerDay_has_Community.csv")
    
    FS_ImportantMeal = ["Breakfast","lunch","coffe time","dinner"]
    FS_ImportantMeal = pd.DataFrame(FS_ImportantMeal)
    nt.mkCSV(FS_ImportantMeal,"FS_ImportantMeal.csv")
    
    df1 = nt.dfFix(GeneralCitizen,"main_food:Breakfast","typical_dish:Pork")
    meal = pd.DataFrame(["Breakfast","lunch","coffe time","dinner"])
    FS_ImportantMeal_has_Community = nt.get_number(df1,meal)
    nt.mkCSV(FS_ImportantMeal_has_Community,"FS_ImportantMeal_has_Community.csv")
    
    FS_TypicalPlate = ["pork","beef","chicken","lamp","cereals","legumes","fruits"]
    FS_TypicalPlate = pd.DataFrame(FS_TypicalPlate)
    nt.mkCSV(FS_TypicalPlate,"FS_TypicalPlate.csv")
    
    df1 = nt.dfFix(Bibliography,"Pork (200 kcal/100g)","Intake (g) - default value 70g-")
    plate = pd.DataFrame(["pork","beef","chicken","lamp","cereals","legumes","fruits"])
    FS_TypicalPlate_has_Community = nt.get_number(df1,plate)
    nt.mkCSV(FS_TypicalPlate_has_Community,"FS_TypicalPlate_has_Community.csv")
