# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 16:46:02 2020

@author: guill
"""

import numpy as np

def showTables(cursor):
    cursor.execute("SHOW TABLES")
    tablesList = cursor.fetchall()
    return np.array(tablesList)    