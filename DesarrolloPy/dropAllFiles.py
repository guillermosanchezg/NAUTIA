# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 18:38:22 2020

@author: guill
"""

import os

def dropAllFiles():
    finalpath = "C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales"
    path_to_dir  = finalpath
    files_in_dir = os.listdir(path_to_dir)     
    
    for file in files_in_dir:                  
        os.remove(f'{path_to_dir}/{file}')