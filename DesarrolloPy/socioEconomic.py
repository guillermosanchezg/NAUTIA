# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:36 2020

@author: guill
"""

import DataNAUTIA
import seDemoCult as dc
import sePersonalSafty as ps
import seEconomy as ec
import seGenderData as gen

def socioEconomic(communityType):
    data = DataNAUTIA(communityType)
    dc.seDemoCult(data.getEntties(),data.getHouseHold())
    ps.sePersonalSafty(data.getWomenGroup(),data.getLocalLeaders(),data.getSanitationInfra(),data.getEntities())    
    ec.seEconomy(data.getLocalLeaders(),data.getHouseHold(), data.getPriorities())
    gen.seGenderData(data.getGeneralCitizen)
    