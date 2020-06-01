# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 18:24:54 2020

@author: guill
"""

import os
import pandas as pd
import numpy as np
import NAUTIAFIXCSV as nfv
import NAUTIAETL as nt
import NMETL as nm

finalpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales"

def makeNMtable(elem):
    x = nm.getTableName(elem)
    if(nm.is_non_zero_file(nfv.getPath(finalpath,x+".csv"))):
        if(nm.specialTable(elem) == False):
            tablePK = nm.get_tablePK(x)
            communityPK = nm.get_communityPK(elem)
            arrayCommunity = np.array([])
            for index, row in tablePK.iterrows():
                arrayCommunity = np.append(arrayCommunity,communityPK[0][0])
            nmTableFK = nt.concatDF(tablePK,pd.DataFrame(arrayCommunity))
            if(os.path.isfile(finalpath+"/"+elem+".csv")):
                if(nm.is_non_zero_file(nfv.getPath(finalpath,elem+".csv"))):
                    df = np.array(pd.read_csv(finalpath+"/"+elem+".csv"))
                    df = pd.DataFrame(df)
                    nmTableFK = nt.concatDF(nmTableFK,df)
            else:
                nmTableFK = nm.get_specialTable(x,elem)                
            nt.mkCSV(nmTableFK,elem+".csv")

def setNMTables(communityType):
    tablesNM = pd.read_csv("NMtablesCamp.csv",header = None)
    tablesNM = np.array(tablesNM)
    for column in tablesNM:
        for elem in column:
            if(communityType == 0):
                if(elem.find("_has_camp") == -1):
                    makeNMtable(elem)
            else:
                makeNMtable(elem)
                