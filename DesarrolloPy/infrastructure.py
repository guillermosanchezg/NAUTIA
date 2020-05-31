# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:40 2020

@author: guill
"""

import DataNAUTIA
import infWater as w
import sanitation as s
import wasteManagement as wm
import energy as e
import mobility as mb

def infrastructure(communityType):
    data = DataNAUTIA(communityType)
    w.infWater(data.getEntities(),data.getHouseHold(),data.getWaterInf())
    s.sanitation(data.getEntities(),data.getSanitationInf())
    wm.wasteManagement(data.getEntities(),data.getWasteManagementInf())
    e.energy(data.getGeneralForm(),data.getEntities(),data.getBusiness(),data.getHouseHold(),data.getComunalServices(),data.getWomenGroup(),data.getEnergyINF())
    mb.mobility(data.getMobilityINF(),data.getGeneralForm())

    