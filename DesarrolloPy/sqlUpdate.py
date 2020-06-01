# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 16:29:32 2020

@author: guill
"""
import numpy as np

def sqlUpdate(communityType,tablesList,f,cursor,query):
    for row in tablesList:
        for elem in row:
            cursor.execute("SHOW columns FROM "+elem)
            columnList = cursor.fetchall()
            pk = True
            string = np.array([],dtype = str)
            for column in columnList:
                if(pk):
                    pk = False
                else:
                    string = np.append(string,column[0])
                for column in string:
                    if(column == "Community_idCommunity"):
                        f.write("UPDATE "+elem+" SET Community_idCommunity = (SELECT @CommunityID)\nWHERE "+elem+".Community_idCommunity = 0;\n\n")  
                    else:
                        if(communityType == 1):
                            if(column == "Camp_idCamp"):
                                f.write("UPDATE "+elem+" SET Camp_idCamp = (SELECT @campID)\nWHERE "+elem+".Camp_idCamp = 0;\n\n")
                        else:
                            if(column == "Country_idCountry"):
                                f.write("UPDATE "+elem+" SET Country_idCountry = (SELECT @CountryID)\nWHERE "+elem+".Country_idCountry = 0;\n\n")