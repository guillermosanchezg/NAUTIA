# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 16:31:31 2020

@author: guill
"""

import numpy as np
import pandas as pd
import NAUTIAFIXCSV as nfv
import NAUTIAETL as nt

from sklearn.feature_extraction.text import CountVectorizer
count_vectorizer = CountVectorizer()

mainpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetOriginales"
finalpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales"

def NMTable(elem):
    result = False
    if(elem.find("_has_") >= 0):
        result = True
    return result

def specialTable(cad):
    result = False
    if(cad == "hostcommunity_has_camp"):
        result = True
    else:
        if(cad == "inf_expandplanbeneficiaries_has_inf_energyinfrastructure"):
            result = True
        else:
            if(cad == "inf_irrigationsystem_has_community"):
                result = True
            else:
                if(cad == "s_subject_has_s_educationalcenter"):
                    result = True
    return result

def validNMTable(elem):
    result = False
    if(elem.find("_has_") != -1):
        if(elem != "hostcommunity_has_camp"):
            if(elem != "s_subject_has_s_educationalcenter"):
                if(elem != "inf_expandplanbeneficiaries_has_inf_energyinfrastructure"):
                    result = True
    return result

def validColumn(column):
    result = False
    if(column[0].find("id") != 0):
        result = True
    return result

def writteExpanPlan(query,f,cursor,communityType):
    Entities = nfv.setDataByIndex(pd.read_csv(nfv.getPath(mainpath,"NAUTIA_1_0_Entities_Interview_results.csv"),float_precision = "high"),communityType)
    inf_expandplanbeneficiaries = nfv.dfFix(Entities,"ENERGY:Covered_services","ENERGY:Power_failure") 
    inf_expandplanbeneficiaries = nt.separateValues(inf_expandplanbeneficiaries)
    cursor.execute("SELECT * FROM inf_expandplanbeneficiaries")
    array = np.array(cursor.fetchall())
    pk = np.array([])
    for row in array:
        for row2 in np.array(inf_expandplanbeneficiaries):
            for elem in row2:
                if(row[1] == elem):
                    pk = np.append(pk,elem)
    cursor.execute("SELECT idINF_EnergyInfrastructure FROM INF_EnergyInfrastructure  ORDER BY idINF_EnergyInfrastructure DESC LIMIT 1")
    pkInf = np.array(cursor.fetchall())
    cursor.execute("SELECT Community_idCommunity FROM INF_EnergyInfrastructure  ORDER BY Community_idCommunity DESC LIMIT 1")
    fkInf = np.array(cursor.fetchall())
    v1 = v2 = np.array([])
    for elem in pk:
        v1 = np.append(v1, pkInf)
        v2 = np.append(v2,fkInf)
    result = nt.concatDF(pd.DataFrame(pk),nt.concatDF(pd.DataFrame(v1),pd.DataFrame(v2)))
    nt.mkCSV(result,"inf_expandplanbeneficiaries_has_inf_energyinfrastructure.csv")
    cursor.execute("SHOW columns FROM inf_expandplanbeneficiaries_has_inf_energyinfrastructure")
    columnList = cursor.fetchall()
    table = "inf_expandplanbeneficiaries_has_inf_energyinfrastructure"
    f.write(query.getquery1()+table+".csv'\n"+query.getquery2()+" "+table+"\n"+query.getquery3()+"\n"+query.getquery4()+"\n")
    pk = True
    string = np.array([],dtype = str)
    for column in columnList:
        if(pk):
            pk = False
        else:
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
                