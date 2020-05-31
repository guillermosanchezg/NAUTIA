# -*- coding: utf-8 -*-
"""
Created on Sun May 31 13:38:33 2020

@author: guill
"""

import food as f
import source as s
import corralCrop as cc
import continuity as con

def foodSecurity(data):
    f.food(data.getBibliography(),data.getGeneralCitizen())
    s.source(data.getGeneralCitizen(),data.getLocalLeaders())
    cc.corralCrop(data.getLocalLeaders(),data.getFarmyardCrop())
    con.continuity(data.getLocalLeaders(),data.getComunalServices())
    