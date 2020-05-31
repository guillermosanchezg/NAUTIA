# -*- coding: utf-8 -*-
"""
Created on Sun May 31 13:38:32 2020

@author: guill
"""
import center as c
import serv as s
import knoweledge as kn

def services(data):
    c.center(data.getComunalServices())
    s.serv(data.getHouseHold(),data.getEntities())
    kn.knoweledge(data.getGeneralCitizen())