LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp.csv'
INTO TABLE camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(StabilisationDate,MigrationRate,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_climaticregion.csv'
INTO TABLE camp_climaticregion
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Region,MaxTemp,MinTemp,AVGTemp,RelativeHumidity,MaxRainfall,MinRainfall,Irradiance,WindSpeed,Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_energysource.csv'
INTO TABLE camp_energysource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Source);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_energysource_has_camp.csv'
INTO TABLE camp_energysource_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Camp_idCamp,Cost);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_enviroment.csv'
INTO TABLE camp_enviroment
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(EnviromentValueArea,DeforestedArea,Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_has_country.csv'
INTO TABLE camp_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_integration.csv'
INTO TABLE camp_integration
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(RelationshipCause);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_integration_has_camp.csv'
INTO TABLE camp_integration_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localcrop.csv'
INTO TABLE camp_localcrop
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Type);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localcrop_has_camp.csv'
INTO TABLE camp_localcrop_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localvegetation.csv'
INTO TABLE camp_localvegetation
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Species);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localvegetation_has_camp.csv'
INTO TABLE camp_localvegetation_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_mobility.csv'
INTO TABLE camp_mobility
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(ConstentOutCamp,MaxDistance,Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_movementreason.csv'
INTO TABLE camp_movementreason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Reason);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_movementreason_has_camp.csv'
INTO TABLE camp_movementreason_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_naturalhazard.csv'
INTO TABLE camp_naturalhazard
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(HazardType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_naturalhazard_has_camp.csv'
INTO TABLE camp_naturalhazard_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Camp_idCamp,Times10Year);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_shelter.csv'
INTO TABLE camp_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(UpgradingPosibility,Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/community.csv'
INTO TABLE community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Name);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_language.csv'
INTO TABLE comun_language
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Language);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_language_has_camp.csv'
INTO TABLE comun_language_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_language_has_country.csv'
INTO TABLE comun_language_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_religion.csv'
INTO TABLE comun_religion
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Religion);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_religion_has_camp.csv'
INTO TABLE comun_religion_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_religion_has_country.csv'
INTO TABLE comun_religion_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/country.csv'
INTO TABLE country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(CountryName);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_geographicidentification.csv'
INTO TABLE fa_geographicidentification
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,PhreaticLevel,Area,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_naturalresource.csv'
INTO TABLE fa_naturalresource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Type,Bound,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_topography.csv'
INTO TABLE fa_topography
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(UpperBound,LowerBound,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cause.csv'
INTO TABLE fs_cause
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Cause,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralcropdata.csv'
INTO TABLE fs_corralcropdata
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(PastoralismTechnique,FertilizationSystem,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralubication.csv'
INTO TABLE fs_corralubication
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,Type,DrainageSystem);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralubication_has_community.csv'
INTO TABLE fs_corralubication_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(FS_CorralUbication_idFS_CorralUbication,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cropubication.csv'
INTO TABLE fs_cropubication
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,Type,IrrigationSystem);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cropubication_has_community.csv'
INTO TABLE fs_cropubication_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(FS_CropUbication_idFS_CropUbication,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cultivationseason.csv'
INTO TABLE fs_cultivationseason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(january,february,march,april,may,june,july,august,september,octuber,november,december,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cultivationseason_has_community.csv'
INTO TABLE fs_cultivationseason_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccess.csv'
INTO TABLE fs_foodaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(FoodType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccess_has_community.csv'
INTO TABLE fs_foodaccess_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Community_idCommunity,NumberPeople);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccesscontinuity.csv'
INTO TABLE fs_foodaccesscontinuity
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(NoProcessedFoodDuration,FoodConservationTec,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsafety.csv'
INTO TABLE fs_foodsafety
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(kids,women,men,senior,intake,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsource.csv'
INTO TABLE fs_foodsource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Source,NumberPeople);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsource_has_community.csv'
INTO TABLE fs_foodsource_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(FS_FoodSource_idFS_FoodSource,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_grainconservation.csv'
INTO TABLE fs_grainconservation
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(ConservationTec,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_grainmill.csv'
INTO TABLE fs_grainmill
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(EnginePower,Operative,GoodUbication,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_importantmeal.csv'
INTO TABLE fs_importantmeal
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(meal,numberPeople,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_owncultivationfoodtype.csv'
INTO TABLE fs_owncultivationfoodtype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Type);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_owncultivationfoodtype_has_community.csv'
INTO TABLE fs_owncultivationfoodtype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_selfsufficiencyseason.csv'
INTO TABLE fs_selfsufficiencyseason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(january,february,march,april,may,june,july,august,september,octuber,november,december,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_timesperday.csv'
INTO TABLE fs_timesperday
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(times,numberPeople,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_typicalplate.csv'
INTO TABLE fs_typicalplate
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Plate,Kcal_100g);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_typicalplate_has_community.csv'
INTO TABLE fs_typicalplate_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(FS_TypicalPlate_idFS_TypicalPlate,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_politicalactor.csv'
INTO TABLE g_politicalactor
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(ActorName,ActorType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_politicalactor_has_community.csv'
INTO TABLE g_politicalactor_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_publicpolitic.csv'
INTO TABLE g_publicpolitic
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(DocumentTittle,Path,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_demography.csv'
INTO TABLE gd_demography
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Female_LT_5,Male_LT_5,Female_BT_5_17,Male_BT_5_17,Female_BT_18_59,Male_BT_18_59,Female_GT_59,Male_GT_59,GrowthRate,RefugeePopulation,IDH,LifeExpectancy,Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_economy.csv'
INTO TABLE gd_economy
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Farming,CattelRaising,Industry,ServiceSector,PovertyPopulation,GINI,GDPPerCapita,PovertyLine,LocalCoin,ExchangeRate,Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_electricgenerationmix.csv'
INTO TABLE gd_electricgenerationmix
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Hydro,Diesel,Gas,Coal,Fotovoltaic,Wind,Biofuel,Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_ethnicgroup.csv'
INTO TABLE gd_ethnicgroup
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(EthnicGroup);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_ethnicgroup_has_country.csv'
INTO TABLE gd_ethnicgroup_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_government.csv'
INTO TABLE gd_government
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(RegimeType,Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_infrastructure.csv'
INTO TABLE gd_infrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(RuralWaterAccess,UrbanWaterAccess,RuralSanitationAccess,UrbanSanitationAccess,RuralElectricityAccess,UrbanElectricityAccess,NationalElectricityTariff,Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_serviceaccess.csv'
INTO TABLE gd_serviceaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(IlliteracyRate,InternetAccessRate,Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_shelter.csv'
INTO TABLE gd_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(PeopleInSlum,Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_urbanism.csv'
INTO TABLE gd_urbanism
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(UrbanPopulation,RuralPopulation,UrbanDensity,RuralDensity,Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/hostcommunity.csv'
INTO TABLE hostcommunity
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Community_idCommunity,Country_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/hostcommunity_has_camp.csv'
INTO TABLE hostcommunity_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Camp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_appliance.csv'
INTO TABLE inf_appliance
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(ApplianceType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_appliance_has_community.csv'
INTO TABLE inf_appliance_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(INF_Appliance_idINF_Appliance,Community_idCommunity,Sector,Power,TimeUse);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_colletionpoints.csv'
INTO TABLE inf_colletionpoints
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_cookwoman.csv'
INTO TABLE inf_cookwoman
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(CookingInside,CookingOutside,CookingHours,HealthFirewood,WeeklyFirewood,FirewoodHours,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_energyinfrastructure.csv'
INTO TABLE inf_energyinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(ElectricServiceByElectricityGrid,ExpandPlan,BlackoutElectricityPerDay,CurveOfDemand,StreetLight,DistanceToElectricityGrid,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_expandplanbeneficiaries.csv'
INTO TABLE inf_expandplanbeneficiaries
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Beneficiary);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_expandplanbeneficiaries_has_inf_energyinfrastructure.csv'
INTO TABLE inf_expandplanbeneficiaries_has_inf_energyinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(INF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries,INF_EnergyInfrastructure_idINF_EnergyInfrastructure,INF_EnergyInfrastructure_Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsource.csv'
INTO TABLE inf_generationsource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Source);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsource_has_community.csv'
INTO TABLE inf_generationsource_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(INF_GenerationSource_idINF_GenerationSource,Community_idCommunity,Sector,TimeAccessDay,TimeAccessNight,Cost);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsystem.csv'
INTO TABLE inf_generationsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(SystemType,Capacity,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_irrigatonsystem.csv'
INTO TABLE inf_irrigatonsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Operating,WaterPumpPower,EnergySource);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_irrigatonsystem_has_community.csv'
INTO TABLE inf_irrigatonsystem_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(INF_IrrigatonSystem_idIrrigatonSystem,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_kitchen.csv'
INTO TABLE inf_kitchen
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(MainKitchenType,MainFuel,FirewoodConsumption,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_landfill.csv'
INTO TABLE inf_landfill
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(DistanceToHouses,DistanceToWaterResource,FertilEnviromentLocation,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_lightingtech.csv'
INTO TABLE inf_lightingtech
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(TechType,TechPower,INF_PublicLighting_idINF_PublicLighting,INF_PublicLighting_Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityinfrastructure.csv'
INTO TABLE inf_mobilityinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(DistanceToWorkstation,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityway.csv'
INTO TABLE inf_mobilityway
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Way);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityway_has_community.csv'
INTO TABLE inf_mobilityway_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(INF_MobilityWay_idINF_MobilityWay,Community_idCommunity,Internal_external);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobillitypoint.csv'
INTO TABLE inf_mobillitypoint
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_potabilizationsystem.csv'
INTO TABLE inf_potabilizationsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Type);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_potabilizationsystem_has_community.csv'
INTO TABLE inf_potabilizationsystem_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_publiclighting.csv'
INTO TABLE inf_publiclighting
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(StreetLightWorking,LightPointsDistance,InfluenceInWomensSafety,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationaccess.csv'
INTO TABLE inf_sanitationaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(OutdoorsLatrine,latrineType,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationsystemquality.csv'
INTO TABLE inf_sanitationsystemquality
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(slab,ventilated,durableStructure,wall_Roof,door);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationsystemquality_has_community.csv'
INTO TABLE inf_sanitationsystemquality_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(INF_SanitationSystemQuality_idINF_SanitationSystemQuality,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_streetlamp.csv'
INTO TABLE inf_streetlamp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_timespent.csv'
INTO TABLE inf_timespent
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(DailyTimeSpent,INF_WaterInfrastructure_idINF_WaterInfrastructure,INF_WaterInfrastructure_Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_wastemanagementginfrastructure.csv'
INTO TABLE inf_wastemanagementginfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(CollectionServicePerMonth,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_waterinfrastructure.csv'
INTO TABLE inf_waterinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(WaterQuality,ConsumptionPerCapita,SourceType,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_waterpoint.csv'
INTO TABLE inf_waterpoint
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,Working,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_womensafety.csv'
INTO TABLE inf_womensafety
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Influence,INF_PublicLighting_idINF_PublicLighting,INF_PublicLighting_Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_app.csv'
INTO TABLE s_app
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(App);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_app_has_community.csv'
INTO TABLE s_app_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(S_App_idS_App,Community_idCommunity,Use_Necesity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_buildingquality.csv'
INTO TABLE s_buildingquality
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(NoFiltrationRoof,SecureStructured,ClimaticHazard,ThermalConfort);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_cementery.csv'
INTO TABLE s_cementery
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,Drainage,UpperBound,NoAccessArea);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_cementery_has_community.csv'
INTO TABLE s_cementery_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(S_Cementery_idS_Cementery,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_dataaccess.csv'
INTO TABLE s_dataaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(DataType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_dataaccess_has_community.csv'
INTO TABLE s_dataaccess_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_educationalcenter.csv'
INTO TABLE s_educationalcenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,EducationType,Students,Workingpoints,Teachers,Material,TimeStart,TimeFinish,S_BuildingQuality_idS_BuildingQuality);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_educationalcenter_has_community.csv'
INTO TABLE s_educationalcenter_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(S_EducationalCenter_idS_EducationalCenter,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_healthcenterservice.csv'
INTO TABLE s_healthcenterservice
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(PrimaryAttention2kms,Hospital5kms,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_hospital.csv'
INTO TABLE s_hospital
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,Beds,NoAccessArea,S_BuildingQuality_idS_BuildingQuality);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_hospital_has_community.csv'
INTO TABLE s_hospital_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(S_Hospital_idS_Hospital,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_medicineaccess.csv'
INTO TABLE s_medicineaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Access,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_noeducationcause.csv'
INTO TABLE s_noeducationcause
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Cause);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_noeducationcause_has_community.csv'
INTO TABLE s_noeducationcause_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_othercenter.csv'
INTO TABLE s_othercenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,CenterType,CenterName,NoAccessArea);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_othercenter_has_community.csv'
INTO TABLE s_othercenter_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(S_OtherCenter_idS_OtherCenter,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_primaryattention.csv'
INTO TABLE s_primaryattention
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,NoAccesArea,S_BuildingQuality_idS_BuildingQuality);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_primaryattention_has_community.csv'
INTO TABLE s_primaryattention_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(S_PrimaryAttention_idS_PrimaryAttention,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_repeaterantena.csv'
INTO TABLE s_repeaterantena
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Number,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_subject.csv'
INTO TABLE s_subject
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Subject);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_subject_has_s_educationalcenter.csv'
INTO TABLE s_subject_has_s_educationalcenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(S_Subject_idS_Subject,S_EducationalCenter_idS_EducationalCenter,SubjectType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_tecknowlege.csv'
INTO TABLE s_tecknowlege
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(knowlegeType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_tecknowlege_has_community.csv'
INTO TABLE s_tecknowlege_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(S_Tecknowlege_idS_Tecknowlege,Community_idCommunity,NumberPersons);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_cleaningmaterial.csv'
INTO TABLE se_cleaningmaterial
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Material);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_cleaningmaterial_has_community.csv'
INTO TABLE se_cleaningmaterial_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_conflictarea.csv'
INTO TABLE se_conflictarea
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_economy.csv'
INTO TABLE se_economy
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(BasicBasketCost,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_expensetype.csv'
INTO TABLE se_expensetype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Type);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_expensetype_has_community.csv'
INTO TABLE se_expensetype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(SE_ExpenseType_idSE_ExpenseType,Community_idCommunity,Sex,ExpenseValue);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_genderdata.csv'
INTO TABLE se_genderdata
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(LeadingWomen,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_householdcomposition.csv'
INTO TABLE se_householdcomposition
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Women,Men,Teenagers,Kids,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_incometype.csv'
INTO TABLE se_incometype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Type);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_incometype_has_community.csv'
INTO TABLE se_incometype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(SE_IncomeType_idSE_IncomeType,Community_idCommunity,Sex,IncomeValue);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_personalhygiene.csv'
INTO TABLE se_personalhygiene
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(TimesPerWeek,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_population.csv'
INTO TABLE se_population
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(LT_5,BT_5_17,BT_18_59,GT_59,DiferentAbilitiesPeople,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_priority.csv'
INTO TABLE se_priority
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Type);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_priority_has_community.csv'
INTO TABLE se_priority_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(SE_Priority_idSE_Priority,Community_idCommunity,totalAnswer,priorityLevel);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetycommittee.csv'
INTO TABLE se_safetycommittee
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(SafetyCommittee,WomenPatrol,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetylatrines.csv'
INTO TABLE se_safetylatrines
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(SeparatedBySex,Light,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetyplace.csv'
INTO TABLE se_safetyplace
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Place_Time);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetyplace_has_community.csv'
INTO TABLE se_safetyplace_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(SE_SafetyPlace_idSE_SafetyPlace,Community_idCommunity,Answer);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_worktype.csv'
INTO TABLE se_worktype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(WorkType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_worktype_has_community.csv'
INTO TABLE se_worktype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Community_idCommunity,childNumber,womenNumber,menNumber);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_building.csv'
INTO TABLE sh_building
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Latitude,Longitude,Altitude,ApropiateRoof,SecureStructured,ClimateThreatProtect,WindowsAllRooms,NoHumidity,NoAnimals,LT30Dregrees,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_house.csv'
INTO TABLE sh_house
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(Rooms,PosibleUpgrading,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_shelter.csv'
INTO TABLE sh_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(TotalHouses,ConstructionCost,ConstructionType,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_area.csv'
INTO TABLE u_area
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(AreaType,Latitude,Longitude,Altitude,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_landuse.csv'
INTO TABLE u_landuse
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(PrivateLandArea,UrbanFloodingArea,UrbanSlopeRiskAre,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_publicspace.csv'
INTO TABLE u_publicspace
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(TotalArea,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_recreationalarea.csv'
INTO TABLE u_recreationalarea
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(AreaName,Latitude,Longitude,Altitude,Woodland_ShadedArea,UrbanFurniture,Floor_DrainageSystem,PSTrush,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_road.csv'
INTO TABLE u_road
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(RoadsLength,DrainageSystem,Conditioning,Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_urbanism.csv'
INTO TABLE u_urbanism
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(UrbanPlan,UrbanPlanDuratrion,CampLimits,LandManagement,PlannedGrowth,GrowthForecast,UrbanPlanRiskInstruments,RiskType,AVG_PlotArea,PlotDelimitation,Community_idCommunity);

