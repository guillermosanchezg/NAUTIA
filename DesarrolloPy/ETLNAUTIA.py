# -*- coding: utf-8 -*-
"""
Created on Sun May 31 15:15:44 2020

@author: guill
"""

from DataNAUTIA import DataNAUTIA
import community as com
import camp as camp
import country as ctr
import campData as cd
import generalData as gd
import socioEconomic as se
import government as g
import fisicoAmbiental as fa
import urbanism as u
import infrastructure as inf
import services as s
import shelter as sh
import foodSecurity as fs

def ETLNAUTIA(communityType):
    data = DataNAUTIA(communityType)
    com.community(communityType)
    camp.camp(data.getBibliography(),data.getEntities())
    ctr.country(data.getBibliography())
    cd.campData(data.getBibliography(),data.getEntities(),data.getLocalLeaders())
    gd.generalData(data.getBibliography())
    se.socioEconomic(data)
    g.government(data.getBibliography())
    fa.fisicoAmbiental(data.getBibliography(),data.getEntities())
    u.urbanism(data.getEntities(),data.getGeneralForm(),data.getPublicSpace())
    inf.infrastructure(data)
    s.services(data)
    sh.shelter(data.getEntities(),data.getShelter(),data.getHouseHold())
    fs.foodSecurity(data)   
    
    
    
    
    
    
    
    