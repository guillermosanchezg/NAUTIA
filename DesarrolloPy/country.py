# -*- coding: utf-8 -*-
"""
Created on Sun May 31 12:38:34 2020

@author: guill
"""

import NAUTIAETL as nt

def country(Bibliography):
    Country = nt.dfFix(Bibliography,"Country's name", "Number of inhabitants (#)")
    nt.mkCSV(Country,"Country.csv")