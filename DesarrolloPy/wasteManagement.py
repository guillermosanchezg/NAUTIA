# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:41 2020

@author: guill
"""

import NAUTIAETL as nt
import NAUTIAFIXCSV as nfv

def wasteManagement(Entities,WasteManagementInf):
    INF_WasteManagementgInfrastructure = nfv.dfFix(Entities,"Waste_Managment:Waste_Collection","Waste_Managment:Landfill_Details:Location_1")
    nt.mkCSV(INF_WasteManagementgInfrastructure,"INF_WasteManagementgInfrastructure.csv")
    
    INF_landFill = nfv.dfFix(Entities,"Waste_Managment:Landfill_Details:Location_1","Water:Quality")
    nt.mkCSV(INF_landFill,"INF_landFill.csv")
    
    INF_CollectionPoints = nfv.dfFix(WasteManagementInf,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
    nt.mkCSV(INF_CollectionPoints,"INF_CollectionPoints.csv")