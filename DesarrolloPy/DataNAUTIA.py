# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:04:18 2020

@author: guill
"""

import pandas as pd
import NAUTIAFIXCSV as nfv

class DataNAUTIA:
    
    Bibliography = pd.DataFrame()
    Entities = pd.DataFrame()
    LocalLeaders = pd.DataFrame()
    HouseHold = pd.DataFrame()
    WomenGroup = pd.DataFrame()
    SanitationInfra = pd.DataFrame()
    Priorities = pd.DataFrame()
    GeneralForm = pd.DataFrame()
    PublicSpace = pd.DataFrame()
    WaterInf = pd.DataFrame()
    SanitationInf = pd.DataFrame()
    WasteManagementInf = pd.DataFrame()
    EnergyINF = pd.DataFrame()
    Business = pd.DataFrame()
    MobilityINF = pd.DataFrame()
    ComunalServices = pd.DataFrame()
    GeneralCitizen = pd.DataFrame()
    Shelter = pd.DataFrame()
    FarmyardCrop = pd.DataFrame()
    
    def __init__(self,communityType):
        Bibliography = pd.read_excel(nfv.getPath(nfv.mainpath,"Bibliography_120220.xlsx"))
        Bibliography = nfv.fixBibliography(Bibliography)
        self.Bibliography = nfv.setDataByIndex(Bibliography,communityType)
        self.Entities = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Entities_Interview_results.csv"),float_precision = "high"),communityType)
        self.LocalLeaders = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Local_leaders_v3_results.csv"),float_precision = "high"),communityType)
        self.HouseHold = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Survey_household_v6_results.csv"),float_precision = "high"),communityType)
        self.WomenGroup = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Women_Focus_Group2_results.csv"),float_precision = "high"),communityType)
        self.SanitationInfra = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_V1_0_Sanitation_Infrastructre_results.csv"),float_precision = "high"),communityType)
        self.Priorities = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Priorities_v3_results.csv"),float_precision = "high"),communityType)
        self.GeneralForm = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_General_form_v3_results.csv"),float_precision = "high"),communityType)
        self.PublicSpace = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Public_Space_results.csv"),float_precision = "high"),communityType)
        self.WaterInf = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Water_Infrastructure_results.csv"),float_precision = "high"),communityType)
        self.SanitationInf = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_V1_0_Sanitation_Infrastructre_results.csv"),float_precision = "high"),communityType)
        self.WasteManagementInf = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Waste_Management_Infrastructure_results.csv"),float_precision = "high"),communityType)
        self.EnergyINF = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Energy_Infrastructure_results.csv"),float_precision = "high"),communityType)
        self.Business = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA1_0_Business_surveys_v3_results.csv"),float_precision = "high"),communityType)
        self.MobilityINF = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0__Transport_servicesaccess_points_results.csv"),float_precision = "high"),communityType) 
        self.ComunalServices = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Communal_Services_results.csv"),float_precision = "high"),communityType) 
        self.GeneralCitizen = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_General_Citizen_Focus_Group_results.csv"),float_precision = "high"),communityType)
        self.Shelter = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Shelter_results.csv"),float_precision = "high"),communityType)
        self.FarmyardCrop = nfv.setDataByIndex(pd.read_csv(nfv.getPath(nfv.mainpath,"NAUTIA_1_0_Farmyard_and_Crops_results.csv"),float_precision = "high"),communityType)
        
    def getBibliography(self):
        return self.Bibliography
    
    def getEntities(self):
        return self.Entities
    
    def getLocalLeaders(self):
        return self.LocalLeaders
    
    def getHouseHold(self):
        return self.HouseHold
    
    def getWomenGroup(self):
        return self.WomenGroup
    
    def getSanitationInfra(self):
        return self.SanitationInfra
    
    def getPriorities(self):
        return self.Priorities
    
    def getGeneralForm(self):
        return self.GeneralForm
    
    def getPublicSpace(self):
        return self.PublicSpace
    
    def getWaterInf(self):
        return self.WaterInf
    
    def getSanitationInf(self):
        return self.SanitationInf
    
    def getWasteManagementInf(self):
        return self.WasteManagementInf
    
    def getEnergyINF(self):
        return self.EnergyINF
    
    def getBusiness(self):
        return self.Business
    
    def getMobilityINF(self):
        return self.MobilityINF
    
    def getComunalServices(self):
        return self.ComunalServices
        
    def getGeneralCitizen(self):
        return self.GeneralCitizen
    
    def getShelter(self):
        return self.Shelter
    
    def getFarmyardCrop(self):
        return self.FarmyardCrop
        
        