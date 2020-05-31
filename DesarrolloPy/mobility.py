# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:49 2020

@author: guill
"""

import pandas as pd
import NAUTIAETL as nt
import NAUTIAFIXCSV as nfv

def mobility(MobilityINF,GeneralForm):
    #INF_MobilityInfrasctucture = nfv.dfFix(Entities,"","") #no se encuentra el dato en origen COMPROBADO 17/04/2020
    
    INF_MobilityPoint = nfv.dfFix(MobilityINF,"Record_your_current_location:Latitude","Record_your_current_location:Accuracy")
    nt.mkCSV(INF_MobilityPoint,"INF_MobilityPoint.csv")
    
    INF_MobilityWay = ['walking','motorcycle','bike','truck_lorry_va','animals','car']
    INF_MobilityWay = pd.DataFrame(INF_MobilityWay)
    nt.mkCSV(INF_MobilityWay,"INF_MobilityWay.csv")
    
    internal = nfv.dfFix(GeneralForm,"Transport:Kind_transport_inside","Transport:Kind_transport_outside")
    internal = nt.separateValues(internal)
    internal = nt.set_sector(internal,"internal")
    external = nfv.dfFix(GeneralForm,"Transport:Kind_transport_outside","meta:instanceID")
    external = nt.separateValues(external)
    external = nt.set_sector(external,"external")
    INF_MobilityWay_has_Community = nt.concatDF(internal.T,external.T).T
    nt.mkCSV(INF_MobilityWay_has_Community,"INF_MobilityWay_has_Community.csv")
        