# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 16:32:39 2020

@author: guill
"""

def fwriteClose(communityType,f,g = None):
    f.write("SET SQL_MODE=@OLD_SQL_MODE;\n")
    f.write("SET FOREIGN_KEY_CHECKS = 1;\n")
    f.write("SET SQL_SAFE_UPDATES = 1;\n\n")
    f.close()
    if(communityType == 1):
        g.close()
