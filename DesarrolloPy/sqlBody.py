# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 16:22:18 2020

@author: guill
"""

import NAUTIABD as nbd
import numpy as np

def sqlBody(communityType,tablesList,f,cursor,query,g = None):
    for row in tablesList:
        for elem in row:
            if(nbd.validElem(elem,communityType)):
                f.write(query.getQuery1()+elem+".csv'\n"+query.getQuery2()+" "+elem+"\n"+query.getQuery3()+"\n"+query.getQuery4()+"\n")
                cursor.execute("SHOW columns FROM "+elem)
                columnList = cursor.fetchall()
                pk = True
                string = np.array([],dtype = str)
                for column in columnList:
                    if(pk):
                       pk = False
                    else:
                        if(nbd.validColumn(column,communityType)):
                                 string = np.append(string,column[0])
                f.write("    (")
                for column in string:
                    if(column != string[-1]):
                       f.write("@"+column+",")
                    else:
                       f.write("@"+column+")\n")
                f.write("SET ")
                for column in string:
                    if(column != string[-1]):
                        if(column == string[0]):
                            f.write(column+" = NULLIF(@"+column+",''),\n")
                        else:
                            f.write("    "+column+" = NULLIF(@"+column+",''),\n")
                    else:
                        if(column == string[0]):
                            f.write(column+" = NULLIF(@"+column+",'');\n\n")
                        else:
                            f.write("    "+column+" = NULLIF(@"+column+",'');\n\n")
            else:
                if(communityType == 1):
                    if(nbd.validNMTable(elem)):
                        g.write(elem+"\n") 