# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 16:32:39 2020

@author: guill
"""

def writeHotsNMCamp(f):
    f.write("SET @idCommunity = (SELECT idCommunity FROM Community ORDER BY idCommunity DESC LIMIT 1);\n")
    f.write("SET @idCountry = (SELECT idCountry FROM Country ORDER BY idCountry DESC LIMIT 1);\n")
    f.write("INSERT INTO HostCommunity (Community_idCommunity,Country_idCountry)")
    f.write("VALUES ((SELECT @CommunityID), (SELECT @idCountry));\n")
    f.write("SET @idCamp = (SELECT idCamp FROM Camp ORDER BY idCamp DESC LIMIT 1);\n")
    f.write("SET @idHostCommunity = (SELECT idHostCommunity FROM HostCommunity ORDER BY idHostCommunity DESC LIMIT 1);\n")
    f.write("INSERT INTO HostCommunity_has_Camp (HostCommunity_idHostCommunity,Camp_idCamp)")
    f.write("VALUES ((SELECT @idHostCommunity), (SELECT @idCamp));\n")

def closeSetting(f):
    f.write("SET SQL_MODE=@OLD_SQL_MODE;\n")
    f.write("SET FOREIGN_KEY_CHECKS = 1;\n")
    f.write("SET SQL_SAFE_UPDATES = 1;\n\n")
    f.close()

def fwriteClose(communityType,f,g = None):
    closeSetting(f)
    if(communityType == 1):
        g.close()
