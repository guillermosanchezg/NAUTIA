# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 16:27:47 2020

@author: guill
"""
import fwriteInit as fin
import fwriteClose as fc
import sqlBody as body
import showTables as st
from ClassLoadQuery import LoadQuery

def writeNMQuery(communityType,cursor):
    query = LoadQuery()
    if(communityType == 1):
        f = open('LoadDataNMCamp.sql','w+')
    else:
        f = open('LoadDataNMHost.sql','w+')
    fin.writeSetting(f)
    tablesList = st.showTables(cursor)
    body.NMsqlBody(communityType,tablesList,f,cursor,query)
    if(communityType == 0):
        fc.writeHotsNMCamp(f)
    fc.closeSetting(f)
