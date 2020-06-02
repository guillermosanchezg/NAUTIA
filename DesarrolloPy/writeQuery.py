# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 16:33:30 2020

@author: guill
"""

import fwriteInit as fin
import fwriteClose as fc
import sqlBody as body
import sqlUpdate as up
import showTables as st
from ClassLoadQuery import LoadQuery

def writeQuery(communityType,cursor):
    query = LoadQuery()
    if(communityType == 1):
        f = open('LoadDataCamp.sql','w+')
        g = open('NMtablesCamp.csv','w+')
    else:
        f = open('LoadDataHost.sql','w+')
    fin.fwriteInit(f,query,communityType)
    tablesList = st.showTables(cursor)
    if(communityType == 1):
        body.sqlBody(communityType,tablesList,f,cursor,query,g = g)
    else:
        body.sqlBody(communityType,tablesList,f,cursor,query)
    tablesList = st.showTables(cursor)
    up.sqlUpdate(communityType,tablesList,f,cursor,query)
    if(communityType == 1):
        fc.fwriteClose(communityType,f,g = g)
    else:
        fc.fwriteClose(communityType,f)