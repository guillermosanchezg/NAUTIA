# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 11:58:47 2020

@author: guill
"""

import mysql.connector

mydb = mysql.connector.connect(
  port = 3309,
  host="127.0.0.1",
  user="root",
  passwd="",
  database = 'nautiatoolkit'
)

def cocectBD():
    return mydb.cursor()
