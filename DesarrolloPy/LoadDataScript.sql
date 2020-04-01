LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp.csv'
INTO TABLE camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_climaticregion.csv'
INTO TABLE camp_climaticregion
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_energysource.csv'
INTO TABLE camp_energysource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_energysource_has_camp.csv'
INTO TABLE camp_energysource_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_enviroment.csv'
INTO TABLE camp_enviroment
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_has_country.csv'
INTO TABLE camp_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_integration.csv'
INTO TABLE camp_integration
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_integration_has_camp.csv'
INTO TABLE camp_integration_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localcrop.csv'
INTO TABLE camp_localcrop
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localcrop_has_camp.csv'
INTO TABLE camp_localcrop_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localvegetation.csv'
INTO TABLE camp_localvegetation
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localvegetation_has_camp.csv'
INTO TABLE camp_localvegetation_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_mobility.csv'
INTO TABLE camp_mobility
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_movementreason.csv'
INTO TABLE camp_movementreason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_movementreason_has_camp.csv'
INTO TABLE camp_movementreason_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_naturalhazard.csv'
INTO TABLE camp_naturalhazard
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_naturalhazard_has_camp.csv'
INTO TABLE camp_naturalhazard_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_shelter.csv'
INTO TABLE camp_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/community.csv'
INTO TABLE community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_language.csv'
INTO TABLE comun_language
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_language_has_camp.csv'
INTO TABLE comun_language_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_language_has_country.csv'
INTO TABLE comun_language_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_religion.csv'
INTO TABLE comun_religion
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_religion_has_camp.csv'
INTO TABLE comun_religion_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_religion_has_country.csv'
INTO TABLE comun_religion_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/country.csv'
INTO TABLE country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_geographicidentification.csv'
INTO TABLE fa_geographicidentification
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_naturalresource.csv'
INTO TABLE fa_naturalresource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_topography.csv'
INTO TABLE fa_topography
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cause.csv'
INTO TABLE fs_cause
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralcropdata.csv'
INTO TABLE fs_corralcropdata
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralubication.csv'
INTO TABLE fs_corralubication
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralubication_has_community.csv'
INTO TABLE fs_corralubication_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cropubication.csv'
INTO TABLE fs_cropubication
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cropubication_has_community.csv'
INTO TABLE fs_cropubication_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cultivationseason.csv'
INTO TABLE fs_cultivationseason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cultivationseason_has_community.csv'
INTO TABLE fs_cultivationseason_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccess.csv'
INTO TABLE fs_foodaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccess_has_community.csv'
INTO TABLE fs_foodaccess_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccesscontinuity.csv'
INTO TABLE fs_foodaccesscontinuity
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsafety.csv'
INTO TABLE fs_foodsafety
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsource.csv'
INTO TABLE fs_foodsource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsource_has_community.csv'
INTO TABLE fs_foodsource_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_grainconservation.csv'
INTO TABLE fs_grainconservation
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_grainmill.csv'
INTO TABLE fs_grainmill
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_importantmeal.csv'
INTO TABLE fs_importantmeal
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_owncultivationfoodtype.csv'
INTO TABLE fs_owncultivationfoodtype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_owncultivationfoodtype_has_community.csv'
INTO TABLE fs_owncultivationfoodtype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_selfsufficiencyseason.csv'
INTO TABLE fs_selfsufficiencyseason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_timesperday.csv'
INTO TABLE fs_timesperday
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_typicalplate.csv'
INTO TABLE fs_typicalplate
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_typicalplate_has_community.csv'
INTO TABLE fs_typicalplate_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_politicalactor.csv'
INTO TABLE g_politicalactor
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_politicalactor_has_community.csv'
INTO TABLE g_politicalactor_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_publicpolitic.csv'
INTO TABLE g_publicpolitic
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_demography.csv'
INTO TABLE gd_demography
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_economy.csv'
INTO TABLE gd_economy
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_electricgenerationmix.csv'
INTO TABLE gd_electricgenerationmix
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_ethnicgroup.csv'
INTO TABLE gd_ethnicgroup
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_ethnicgroup_has_country.csv'
INTO TABLE gd_ethnicgroup_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_government.csv'
INTO TABLE gd_government
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_infrastructure.csv'
INTO TABLE gd_infrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_serviceaccess.csv'
INTO TABLE gd_serviceaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_shelter.csv'
INTO TABLE gd_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_urbanism.csv'
INTO TABLE gd_urbanism
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/hostcommunity.csv'
INTO TABLE hostcommunity
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/hostcommunity_has_camp.csv'
INTO TABLE hostcommunity_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_appliance.csv'
INTO TABLE inf_appliance
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_appliance_has_community.csv'
INTO TABLE inf_appliance_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_colletionpoints.csv'
INTO TABLE inf_colletionpoints
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_cookwoman.csv'
INTO TABLE inf_cookwoman
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_energyinfrastructure.csv'
INTO TABLE inf_energyinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_expandplanbeneficiaries.csv'
INTO TABLE inf_expandplanbeneficiaries
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_expandplanbeneficiaries_has_inf_energyinfrastructure.csv'
INTO TABLE inf_expandplanbeneficiaries_has_inf_energyinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsource.csv'
INTO TABLE inf_generationsource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsource_has_community.csv'
INTO TABLE inf_generationsource_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsystem.csv'
INTO TABLE inf_generationsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_irrigatonsystem.csv'
INTO TABLE inf_irrigatonsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_irrigatonsystem_has_community.csv'
INTO TABLE inf_irrigatonsystem_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_kitchen.csv'
INTO TABLE inf_kitchen
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_landfill.csv'
INTO TABLE inf_landfill
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_lightingtech.csv'
INTO TABLE inf_lightingtech
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityinfrastructure.csv'
INTO TABLE inf_mobilityinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityway.csv'
INTO TABLE inf_mobilityway
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityway_has_community.csv'
INTO TABLE inf_mobilityway_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobillitypoint.csv'
INTO TABLE inf_mobillitypoint
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_potabilizationsystem.csv'
INTO TABLE inf_potabilizationsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_potabilizationsystem_has_community.csv'
INTO TABLE inf_potabilizationsystem_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_publiclighting.csv'
INTO TABLE inf_publiclighting
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationaccess.csv'
INTO TABLE inf_sanitationaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationsystemquality.csv'
INTO TABLE inf_sanitationsystemquality
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationsystemquality_has_community.csv'
INTO TABLE inf_sanitationsystemquality_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_streetlamp.csv'
INTO TABLE inf_streetlamp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_timespent.csv'
INTO TABLE inf_timespent
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_wastemanagementginfrastructure.csv'
INTO TABLE inf_wastemanagementginfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_waterinfrastructure.csv'
INTO TABLE inf_waterinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_waterpoint.csv'
INTO TABLE inf_waterpoint
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_womensafety.csv'
INTO TABLE inf_womensafety
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_app.csv'
INTO TABLE s_app
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_app_has_community.csv'
INTO TABLE s_app_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_buildingquality.csv'
INTO TABLE s_buildingquality
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_cementery.csv'
INTO TABLE s_cementery
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_cementery_has_community.csv'
INTO TABLE s_cementery_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_dataaccess.csv'
INTO TABLE s_dataaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_dataaccess_has_community.csv'
INTO TABLE s_dataaccess_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_educationalcenter.csv'
INTO TABLE s_educationalcenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_educationalcenter_has_community.csv'
INTO TABLE s_educationalcenter_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_healthcenterservice.csv'
INTO TABLE s_healthcenterservice
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_hospital.csv'
INTO TABLE s_hospital
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_hospital_has_community.csv'
INTO TABLE s_hospital_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_medicineaccess.csv'
INTO TABLE s_medicineaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_noeducationcause.csv'
INTO TABLE s_noeducationcause
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_noeducationcause_has_community.csv'
INTO TABLE s_noeducationcause_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_othercenter.csv'
INTO TABLE s_othercenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_othercenter_has_community.csv'
INTO TABLE s_othercenter_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_primaryattention.csv'
INTO TABLE s_primaryattention
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_primaryattention_has_community.csv'
INTO TABLE s_primaryattention_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_repeaterantena.csv'
INTO TABLE s_repeaterantena
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_subject.csv'
INTO TABLE s_subject
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_subject_has_s_educationalcenter.csv'
INTO TABLE s_subject_has_s_educationalcenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_tecknowlege.csv'
INTO TABLE s_tecknowlege
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_tecknowlege_has_community.csv'
INTO TABLE s_tecknowlege_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_cleaningmaterial.csv'
INTO TABLE se_cleaningmaterial
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_cleaningmaterial_has_community.csv'
INTO TABLE se_cleaningmaterial_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_conflictarea.csv'
INTO TABLE se_conflictarea
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_economy.csv'
INTO TABLE se_economy
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_expensetype.csv'
INTO TABLE se_expensetype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_expensetype_has_community.csv'
INTO TABLE se_expensetype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_genderdata.csv'
INTO TABLE se_genderdata
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_householdcomposition.csv'
INTO TABLE se_householdcomposition
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_incometype.csv'
INTO TABLE se_incometype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_incometype_has_community.csv'
INTO TABLE se_incometype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_personalhygiene.csv'
INTO TABLE se_personalhygiene
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_population.csv'
INTO TABLE se_population
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_priority.csv'
INTO TABLE se_priority
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_priority_has_community.csv'
INTO TABLE se_priority_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetycommittee.csv'
INTO TABLE se_safetycommittee
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetylatrines.csv'
INTO TABLE se_safetylatrines
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetyplace.csv'
INTO TABLE se_safetyplace
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetyplace_has_community.csv'
INTO TABLE se_safetyplace_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_worktype.csv'
INTO TABLE se_worktype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_worktype_has_community.csv'
INTO TABLE se_worktype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_building.csv'
INTO TABLE sh_building
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_house.csv'
INTO TABLE sh_house
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_shelter.csv'
INTO TABLE sh_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_area.csv'
INTO TABLE u_area
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_landuse.csv'
INTO TABLE u_landuse
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_publicspace.csv'
INTO TABLE u_publicspace
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_recreationalarea.csv'
INTO TABLE u_recreationalarea
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_road.csv'
INTO TABLE u_road
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_urbanism.csv'
INTO TABLE u_urbanism
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'

