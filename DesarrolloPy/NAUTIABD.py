# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 12:19:01 2020

@author: guill
"""

def validElemCamp(elem):
    result = False
    if(elem != "community"):
        if(elem != "camp"):
            if(elem != "country"):
                if(elem.find("_has_") == -1):
                    if(elem != "hostcommunity"):
                        if(elem != "g_publicpolitic"):
                            if(elem != "inf_irrigationsystem"):
                                if(elem!= "inf_mobilityinfrastructure"):
                                    if(elem != "s_healthcenterservice"):
                                        if(elem != "u_landuse"):
                                            if(elem != "u_publicspace"):
                                                result = True
    return result

def validElemHost(elem):
    result = False
    if(validElemCamp(elem)):
        if(elem.find("camp_") == -1):
            result = True
    return result                                                                             

def validElem(elem,communityType):
    if(communityType == 0):
        result = validElemHost(elem)
    else:
        result = validElemCamp(elem)
    return result

def validColumn(column,communityType):
    result = False
    flag = False
    if(communityType == 0):
        if(column[0] != "Community_idCommunity"):
            flag = True
    else:
        if(column[0] != "    "):
            flag = True
    if(flag == True):
        if(column[0] != "Camp_idCamp"):
            if(column[0] != "Country_idCountry"):
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