# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 16:15:18 2020

@author: guill
"""

def fwriteInit(f,query,communityType):
    f.write("SET FOREIGN_KEY_CHECKS=0;\n")
    f.write("SET SQL_SAFE_UPDATES = 0;\n")
    f.write("SET @OLD_SQL_MODE=@@SQL_MODE, sql_mode='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';\n\n")
    
    f.write(query.getQuery1()+"community.csv'\n"+query.getQuery2()+" community\n"+query.getQuery3()+"\n"+query.getQuery4()+"\n")
    f.write("    (@Name)\n")
    f.write("SET Name = NULLIF(@Name,'');\n")
    f.write("SET @CommunityID = (SELECT idCommunity FROM community ORDER BY idCommunity DESC LIMIT 1);\n\n")
    
    if(communityType == 1):
        f.write(query.getQuery1()+"camp.csv'\n"+query.getQuery2()+" camp\n"+query.getQuery3()+"\n"+query.getQuery4()+"\n")
        f.write("    (@StabilisationDate,@MigrationRate)\n")
        f.write("SET StabilisationDate = NULLIF(@StabilisationDate,''),\n    MigrationRate = NULLIF(@MigrationRate,'');\n")
        f.write("SET @campID = (SELECT idCamp FROM camp ORDER BY idCamp DESC LIMIT 1);\n\n")
    
    f.write(query.getQuery1()+"Country.csv'\n"+query.getQuery2()+" Country\n"+query.getQuery3()+"\n"+query.getQuery4()+"\n")
    f.write("    (@CountryName)\n")
    f.write("SET CountryName = NULLIF(@CountryName,'');\n")
    f.write("SET @CountryID = (SELECT idCountry FROM Country ORDER BY idCountry DESC LIMIT 1);\n\n")