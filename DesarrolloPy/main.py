# -*- coding: utf-8 -*-
"""
Created on Sun May 31 15:37:55 2020

@author: guill
"""

import ETLNAUTIA as nautia
import writeQuery as q
import setNMTables as setnm
import cocectBD as bd
    
cursor = bd.cocectBD()

#borrar dirctorio
nautia.ETLNAUTIA(1)
q.writeQuery(1,cursor)
# ejecución de sql
#setnm.setNMTables(1)
#ejecutar sql NM
#Borrar directorio
#nautia.ETLNAUTIA(0)
#q.writeQuery(0,cursor)
# ejecución de sql
#setnm.setNMTables(0)
#ejecutar sql NM
