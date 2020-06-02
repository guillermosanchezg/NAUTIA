# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 16:22:18 2020

@author: guill
"""

import NAUTIABD as nbd
import NAUTIAFIXCSV as nfv
import NMwriteFunctions as nmw
import NMETL as nmt
import numpy as np

finalpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales"

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

def NMsqlBody(communityType,tablesList,f,cursor,query):
    otherTable = np.array([])  
    for row in tablesList:
        for elem in row:
            if((communityType == 0 and elem.find("_has_camp") == -1) or (communityType == 1)):
                if(nmw.NMTable(elem)):
                    x = nmt.getTableName(elem)
                    if(nmt.is_non_zero_file(nfv.getPath(finalpath,x+".csv"))):
                        if(nmw.specialTable(elem) == False):
                            f.write(query.getQuery1()+elem+".csv'\n"+query.getQuery2()+" "+elem+"\n"+query.getQuery3()+"\n"+query.getQuery4()+"\n")
                            cursor.execute("SHOW columns FROM "+elem)
                            columnList = cursor.fetchall()
                            string = np.array([],dtype = str)
                            for column in columnList:
                                if(nmw.validColumn(column)):
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
                            otherTable = np.append(otherTable,elem)
    
    for elem in otherTable:
        if(elem == "inf_expandplanbeneficiaries_has_inf_energyinfrastructure"):
            nmw.writteExpanPlan(query,f,cursor,communityType)