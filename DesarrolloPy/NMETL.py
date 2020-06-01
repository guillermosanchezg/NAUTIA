# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 18:27:30 2020

@author: guill
"""

import os
import pandas as pd
import numpy as np
import NAUTIAFIXCSV as nfv
import NAUTIAETL as nt

finalpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales"

def is_non_zero_file(fpath):
    return os.path.isfile(fpath) and os.path.getsize(fpath)

def getTableName(elem):
    if(elem.find("_has_camp") != -1):
        x = elem.replace("_has_camp","")
    else:
        if(elem.find("_has_country") != -1):
            x = elem.replace("_has_country","")
        else:
            if(elem.find("_has_community") != -1):
                x = elem.replace("_has_community","")
    return x
def serviceTable(cad):
    result = False
    if(cad == "s_educationalcenter"):
        result = True
    else:
        if(cad == "s_primaryattention"):
            result = True
        else:
            if(cad == "s_hospital"):
                result = True
            else:
                if(cad == "s_othercenter"):
                    result = True
    return result

def isEducationalCenter(cad):
    result = False
    if(cad == "s_educationalcenter"):
        result = True           
    return result

def isOtherCenter(cad):
    result = False
    if(cad == "s_othercenter"):
        result = True           
    return result

def get_communityPK(elem,cursor):
    if(elem.find("_has_camp") != -1):
        cursor.execute("SELECT idCamp FROM camp ORDER BY idCamp DESC LIMIT 1")
    else:
        if(elem.find("_has_country") != -1):
            cursor.execute("SELECT idCountry FROM Country ORDER BY idCountry DESC LIMIT 1")
        else:
            if(elem.find("_has_community") != -1):
                cursor.execute("SELECT idCommunity FROM community ORDER BY idCommunity DESC LIMIT 1")
    return cursor.fetchall()

def get_tableFK(table,cursor):
    cursor.execute("SELECT id"+table+" FROM "+table+" ORDER BY id"+table+" DESC LIMIT 1")
    return cursor.fetchall()

def replacestr(df,cad1,cad2):
    cols=list(df.columns)
    for col in cols:
        df[col] = df[col].astype(str).str.replace(cad1,cad2)
    return df

def uniFormatTable(df):
    df = replacestr(df,"\r","")
    df = replacestr(df,"NaN","nan")
    df = replacestr(df,"None","nan")
    return df

def uniFormatDF(df):
    df = replacestr(df,"NaN","nan")
    df = replacestr(df,"None","nan")
    return df

def get_specialTableFKs(table,tableHas,x,y,cursor):
    cursor.execute("SELECT * FROM "+table)
    df1 = uniFormatTable(pd.DataFrame(cursor.fetchall()))
    df2 = pd.read_csv(nfv.getPath(finalpath,tableHas+".csv"),header = None, float_precision = "high")
    df2 = uniFormatDF(df2)
    df1 = np.array(df1)
    pk = np.array([])
    arrayCommunity = np.array([])
    communityPK = get_communityPK(tableHas)
    for index, row in df2.iterrows():
        for row2 in df1:
            if(row[x] == row2[1]):
                pk = np.append(pk,row2[0])
    pk = pd.DataFrame(pk)
    for index, row in pk.iterrows():
        arrayCommunity = np.append(arrayCommunity,communityPK[0][0])
    arrayCommunity = pd.DataFrame(arrayCommunity)
    result = nt.concatDF(pk,nt.concatDF(arrayCommunity,df2))
    result = result.drop(result.columns[[y]], axis = 1)
    return result

    
def get_specialTable(table,tableHas):
    result = pd.DataFrame()
    if(tableHas == 'se_expensetype_has_community'):
        result = get_specialTableFKs(table,tableHas,2,4)
    else:
        if(tableHas == 'se_worktype_has_community' or tableHas == 'u_area_has_community'):
            result = get_specialTableFKs(table,tableHas,3,5)
        else:
            result = get_specialTableFKs(table,tableHas,1,3)
    return result


def specialTable(cad):
    result = False
    if(cad == "camp_naturalhazard_has_camp"):
        result = True
    else:
        if(cad == "inf_appliance_has_community"):
            result = True
        else:
            if(cad == "inf_generationsource_has_community"):
                result = True
            else:
                if(cad == "se_expensetype_has_community"):
                    result = True
                else:
                    if(cad == "fs_foodsource_has_community"):
                        result = True
                    else:
                        if(cad == "fs_importantmeal_has_community"):
                            result = True
                        else:
                            if(cad == "fs_timesperday_has_community"):
                                result = True
                            else:
                                if(cad == "fs_typicalplate_has_community"):
                                    result = True
                                else:
                                    if(cad == "inf_mobilityway_has_community"):
                                        result = True
                                    else:
                                        if(cad == "s_app_has_community"):
                                            result = True
                                        else:
                                            if(cad == "se_priority_has_community"):
                                                result = True
                                            else:
                                                if(cad == "se_safetyplace_has_community"):
                                                    result = True
                                                else:
                                                    if(cad == "se_worktype_has_community"):
                                                        result = True
                                                    else:
                                                        if(cad == "u_area_has_community"):
                                                            result = True
                                                        else:
                                                            if(cad == "camp_energysource_has_camp"):
                                                                result = True
    return result

def get_tablePK(table,cursor):
    cursor.execute("SELECT * FROM "+table)
    df1 = uniFormatTable(pd.DataFrame(cursor.fetchall()))
    df2 = pd.read_csv(nfv.getPath(finalpath,table+".csv"), float_precision = "high")
    df2 = uniFormatDF(df2)
    df1 = np.array(df1)
    pk = np.array([])
    for index, row in df2.iterrows():
        if(serviceTable(table) == False):
            for row2 in df1:
                if((np.equal(np.array(row),np.array(row2[1:]))).all()):
                    pk = np.append(pk,row2[0])
        else:
            if(isEducationalCenter(table)):
                for row2 in df1:
                    if((np.equal(np.array(row[:-2]),row2[1:-3])).all()):
                        pk = np.append(pk,row2[0])
            else:
                if(isOtherCenter(table) == False):
                    for row2 in df1:
                        if((np.equal(np.array(row[:-1]),row2[1:-2])).all()):
                            pk = np.append(pk,row2[0])
                else:
                    for row2 in df1:
                        if((np.equal(np.array(row[:-1]),row2[1:-1])).all()):
                            pk = np.append(pk,row2[0])
    return pd.DataFrame(pk)