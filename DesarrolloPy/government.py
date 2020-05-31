# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:40 2020

@author: guill
"""

import NAUTIAETL as nt

def government(Bibliography):
    #G_PublicPolitic no forma parte ETL
    dfPublic = nt.dfFix(Bibliography,"Public institutions","Private institutions")
    dfPrivate = nt.dfFix(Bibliography,"Private institutions","Non-profit organizations/NGOs")
    dfNonProfit = nt.dfFix(Bibliography,"Non-profit organizations/NGOs","International cooperation agencies")
    dfInternational = nt.dfFix(Bibliography,"International cooperation agencies","Local representatives/local committees/ local liders")
    dfLocal = nt.dfFix(Bibliography,"Local representatives/local committees/ local liders")
    politicalActor = nt.politicalActor(dfPublic,dfPrivate,dfNonProfit,dfInternational,dfLocal)
    nt.mkCSV(politicalActor,"politicalActor.csv")