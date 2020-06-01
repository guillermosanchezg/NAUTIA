# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 12:09:42 2020

@author: guill
"""

class LoadQuery:
    query1 = ""
    query2 = "" 
    query3 = ""
    query4 = ""
    
    def __init__(self):
        self.query1 = "LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/"
        self.query2 = "INTO TABLE" 
        self.query3 = "FIELDS TERMINATED BY ','"
        self.query4 = "LINES TERMINATED BY '\\n'"
    
    def getQuery1(self):
        return self.query1
    
    def getQuery2(self):
        return self.query2
    
    def getQuery3(self):
        return self.query3
    
    def getQuery4(self):
        return self.query4