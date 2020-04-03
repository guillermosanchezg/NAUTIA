LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/community.csv'
INTO TABLE community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (Name);

SET @CommunityID = (SELECT idCommunity FROM community ORDER BY idCommunity DESC LIMIT 1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp.csv'
INTO TABLE camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vStabilisationDate,@vMigrationRate,@vCommunity_idCommunity);
SET     StabilisationDate = if(@vStabilisationDate='',null,@vStabilisationDate),
    MigrationRate = if(@vMigrationRate='',null,@vMigrationRate);

UPDATE camp SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_climaticregion.csv'
INTO TABLE camp_climaticregion
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vRegion,@vMaxTemp,@vMinTemp,@vAVGTemp,@vRelativeHumidity,@vMaxRainfall,@vMinRainfall,@vIrradiance,@vWindSpeed,@vCamp_idCamp);
SET     Region = if(@vRegion='',null,@vRegion),
    MaxTemp = if(@vMaxTemp='',null,@vMaxTemp),
    MinTemp = if(@vMinTemp='',null,@vMinTemp),
    AVGTemp = if(@vAVGTemp='',null,@vAVGTemp),
    RelativeHumidity = if(@vRelativeHumidity='',null,@vRelativeHumidity),
    MaxRainfall = if(@vMaxRainfall='',null,@vMaxRainfall),
    MinRainfall = if(@vMinRainfall='',null,@vMinRainfall),
    Irradiance = if(@vIrradiance='',null,@vIrradiance),
    WindSpeed = if(@vWindSpeed='',null,@vWindSpeed),
    Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_energysource.csv'
INTO TABLE camp_energysource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSource);
SET     Source = if(@vSource='',null,@vSource);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_energysource_has_camp.csv'
INTO TABLE camp_energysource_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCamp_idCamp,@vCost);
SET     Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp),
    Cost = if(@vCost='',null,@vCost);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_enviroment.csv'
INTO TABLE camp_enviroment
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vEnviromentValueArea,@vDeforestedArea,@vCamp_idCamp);
SET     EnviromentValueArea = if(@vEnviromentValueArea='',null,@vEnviromentValueArea),
    DeforestedArea = if(@vDeforestedArea='',null,@vDeforestedArea),
    Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_has_country.csv'
INTO TABLE camp_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCountry_idCountry);
SET     Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_integration.csv'
INTO TABLE camp_integration
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vRelationshipCause);
SET     RelationshipCause = if(@vRelationshipCause='',null,@vRelationshipCause);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_integration_has_camp.csv'
INTO TABLE camp_integration_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCamp_idCamp);
SET     Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localcrop.csv'
INTO TABLE camp_localcrop
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vType);
SET     Type = if(@vType='',null,@vType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localcrop_has_camp.csv'
INTO TABLE camp_localcrop_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCamp_idCamp);
SET     Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localvegetation.csv'
INTO TABLE camp_localvegetation
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSpecies);
SET     Species = if(@vSpecies='',null,@vSpecies);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localvegetation_has_camp.csv'
INTO TABLE camp_localvegetation_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCamp_idCamp);
SET     Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_mobility.csv'
INTO TABLE camp_mobility
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vConstentOutCamp,@vMaxDistance,@vCamp_idCamp);
SET     ConstentOutCamp = if(@vConstentOutCamp='',null,@vConstentOutCamp),
    MaxDistance = if(@vMaxDistance='',null,@vMaxDistance),
    Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_movementreason.csv'
INTO TABLE camp_movementreason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vReason);
SET     Reason = if(@vReason='',null,@vReason);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_movementreason_has_camp.csv'
INTO TABLE camp_movementreason_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCamp_idCamp);
SET     Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_naturalhazard.csv'
INTO TABLE camp_naturalhazard
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vHazardType);
SET     HazardType = if(@vHazardType='',null,@vHazardType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_naturalhazard_has_camp.csv'
INTO TABLE camp_naturalhazard_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCamp_idCamp,@vTimes10Year);
SET     Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp),
    Times10Year = if(@vTimes10Year='',null,@vTimes10Year);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_shelter.csv'
INTO TABLE camp_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vUpgradingPosibility,@vCamp_idCamp);
SET     UpgradingPosibility = if(@vUpgradingPosibility='',null,@vUpgradingPosibility),
    Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_language.csv'
INTO TABLE comun_language
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLanguage);
SET     Language = if(@vLanguage='',null,@vLanguage);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_language_has_camp.csv'
INTO TABLE comun_language_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCamp_idCamp);
SET     Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_language_has_country.csv'
INTO TABLE comun_language_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCountry_idCountry);
SET     Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_religion.csv'
INTO TABLE comun_religion
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vReligion);
SET     Religion = if(@vReligion='',null,@vReligion);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_religion_has_camp.csv'
INTO TABLE comun_religion_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCamp_idCamp);
SET     Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_religion_has_country.csv'
INTO TABLE comun_religion_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCountry_idCountry);
SET     Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/country.csv'
INTO TABLE country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCountryName);
SET     CountryName = if(@vCountryName='',null,@vCountryName);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_geographicidentification.csv'
INTO TABLE fa_geographicidentification
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vPhreaticLevel,@vArea,@vCommunity_idCommunity);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    PhreaticLevel = if(@vPhreaticLevel='',null,@vPhreaticLevel),
    Area = if(@vArea='',null,@vArea);

UPDATE fa_geographicidentification SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_naturalresource.csv'
INTO TABLE fa_naturalresource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vType,@vBound,@vCommunity_idCommunity);
SET     Type = if(@vType='',null,@vType),
    Bound = if(@vBound='',null,@vBound);

UPDATE fa_naturalresource SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_topography.csv'
INTO TABLE fa_topography
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vUpperBound,@vLowerBound,@vCommunity_idCommunity);
SET     UpperBound = if(@vUpperBound='',null,@vUpperBound),
    LowerBound = if(@vLowerBound='',null,@vLowerBound);

UPDATE fa_topography SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cause.csv'
INTO TABLE fs_cause
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCause,@vCommunity_idCommunity);
SET     Cause = if(@vCause='',null,@vCause);

UPDATE fs_cause SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralcropdata.csv'
INTO TABLE fs_corralcropdata
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vPastoralismTechnique,@vFertilizationSystem,@vCommunity_idCommunity);
SET     PastoralismTechnique = if(@vPastoralismTechnique='',null,@vPastoralismTechnique),
    FertilizationSystem = if(@vFertilizationSystem='',null,@vFertilizationSystem);

UPDATE fs_corralcropdata SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralubication.csv'
INTO TABLE fs_corralubication
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vType,@vDrainageSystem);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude),
    Type = if(@vType='',null,@vType),
    DrainageSystem = if(@vDrainageSystem='',null,@vDrainageSystem);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralubication_has_community.csv'
INTO TABLE fs_corralubication_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vFS_CorralUbication_idFS_CorralUbication,@vCommunity_idCommunity);
SET     FS_CorralUbication_idFS_CorralUbication = if(@vFS_CorralUbication_idFS_CorralUbication='',null,@vFS_CorralUbication_idFS_CorralUbication);

UPDATE fs_corralubication_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cropubication.csv'
INTO TABLE fs_cropubication
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vType,@vIrrigationSystem);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude),
    Type = if(@vType='',null,@vType),
    IrrigationSystem = if(@vIrrigationSystem='',null,@vIrrigationSystem);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cropubication_has_community.csv'
INTO TABLE fs_cropubication_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vFS_CropUbication_idFS_CropUbication,@vCommunity_idCommunity);
SET     FS_CropUbication_idFS_CropUbication = if(@vFS_CropUbication_idFS_CropUbication='',null,@vFS_CropUbication_idFS_CropUbication);

UPDATE fs_cropubication_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cultivationseason.csv'
INTO TABLE fs_cultivationseason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vjanuary,@vfebruary,@vmarch,@vapril,@vmay,@vjune,@vjuly,@vaugust,@vseptember,@voctuber,@vnovember,@vdecember,@vCommunity_idCommunity);
SET     january = if(@vjanuary='',null,@vjanuary),
    february = if(@vfebruary='',null,@vfebruary),
    march = if(@vmarch='',null,@vmarch),
    april = if(@vapril='',null,@vapril),
    may = if(@vmay='',null,@vmay),
    june = if(@vjune='',null,@vjune),
    july = if(@vjuly='',null,@vjuly),
    august = if(@vaugust='',null,@vaugust),
    september = if(@vseptember='',null,@vseptember),
    octuber = if(@voctuber='',null,@voctuber),
    november = if(@vnovember='',null,@vnovember),
    december = if(@vdecember='',null,@vdecember);

UPDATE fs_cultivationseason SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cultivationseason_has_community.csv'
INTO TABLE fs_cultivationseason_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCommunity_idCommunity);
SET     Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccess.csv'
INTO TABLE fs_foodaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vFoodType);
SET     FoodType = if(@vFoodType='',null,@vFoodType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccess_has_community.csv'
INTO TABLE fs_foodaccess_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCommunity_idCommunity,@vNumberPeople);
SET     Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    NumberPeople = if(@vNumberPeople='',null,@vNumberPeople);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccesscontinuity.csv'
INTO TABLE fs_foodaccesscontinuity
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vNoProcessedFoodDuration,@vFoodConservationTec,@vCommunity_idCommunity);
SET     NoProcessedFoodDuration = if(@vNoProcessedFoodDuration='',null,@vNoProcessedFoodDuration),
    FoodConservationTec = if(@vFoodConservationTec='',null,@vFoodConservationTec);

UPDATE fs_foodaccesscontinuity SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsafety.csv'
INTO TABLE fs_foodsafety
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vkids,@vwomen,@vmen,@vsenior,@vintake,@vCommunity_idCommunity);
SET     kids = if(@vkids='',null,@vkids),
    women = if(@vwomen='',null,@vwomen),
    men = if(@vmen='',null,@vmen),
    senior = if(@vsenior='',null,@vsenior),
    intake = if(@vintake='',null,@vintake);

UPDATE fs_foodsafety SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsource.csv'
INTO TABLE fs_foodsource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSource,@vNumberPeople);
SET     Source = if(@vSource='',null,@vSource),
    NumberPeople = if(@vNumberPeople='',null,@vNumberPeople);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsource_has_community.csv'
INTO TABLE fs_foodsource_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vFS_FoodSource_idFS_FoodSource,@vCommunity_idCommunity);
SET     FS_FoodSource_idFS_FoodSource = if(@vFS_FoodSource_idFS_FoodSource='',null,@vFS_FoodSource_idFS_FoodSource);

UPDATE fs_foodsource_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_grainconservation.csv'
INTO TABLE fs_grainconservation
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vConservationTec,@vCommunity_idCommunity);
SET     ConservationTec = if(@vConservationTec='',null,@vConservationTec);

UPDATE fs_grainconservation SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_grainmill.csv'
INTO TABLE fs_grainmill
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vEnginePower,@vOperative,@vGoodUbication,@vCommunity_idCommunity);
SET     EnginePower = if(@vEnginePower='',null,@vEnginePower),
    Operative = if(@vOperative='',null,@vOperative),
    GoodUbication = if(@vGoodUbication='',null,@vGoodUbication);

UPDATE fs_grainmill SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_importantmeal.csv'
INTO TABLE fs_importantmeal
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vmeal,@vnumberPeople,@vCommunity_idCommunity);
SET     meal = if(@vmeal='',null,@vmeal),
    numberPeople = if(@vnumberPeople='',null,@vnumberPeople);

UPDATE fs_importantmeal SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_owncultivationfoodtype.csv'
INTO TABLE fs_owncultivationfoodtype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vType);
SET     Type = if(@vType='',null,@vType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_owncultivationfoodtype_has_community.csv'
INTO TABLE fs_owncultivationfoodtype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCommunity_idCommunity);
SET     Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_selfsufficiencyseason.csv'
INTO TABLE fs_selfsufficiencyseason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vjanuary,@vfebruary,@vmarch,@vapril,@vmay,@vjune,@vjuly,@vaugust,@vseptember,@voctuber,@vnovember,@vdecember,@vCommunity_idCommunity);
SET     january = if(@vjanuary='',null,@vjanuary),
    february = if(@vfebruary='',null,@vfebruary),
    march = if(@vmarch='',null,@vmarch),
    april = if(@vapril='',null,@vapril),
    may = if(@vmay='',null,@vmay),
    june = if(@vjune='',null,@vjune),
    july = if(@vjuly='',null,@vjuly),
    august = if(@vaugust='',null,@vaugust),
    september = if(@vseptember='',null,@vseptember),
    octuber = if(@voctuber='',null,@voctuber),
    november = if(@vnovember='',null,@vnovember),
    december = if(@vdecember='',null,@vdecember);

UPDATE fs_selfsufficiencyseason SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_timesperday.csv'
INTO TABLE fs_timesperday
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vtimes,@vnumberPeople,@vCommunity_idCommunity);
SET     times = if(@vtimes='',null,@vtimes),
    numberPeople = if(@vnumberPeople='',null,@vnumberPeople);

UPDATE fs_timesperday SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_typicalplate.csv'
INTO TABLE fs_typicalplate
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vPlate,@vKcal_100g);
SET     Plate = if(@vPlate='',null,@vPlate),
    Kcal_100g = if(@vKcal_100g='',null,@vKcal_100g);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_typicalplate_has_community.csv'
INTO TABLE fs_typicalplate_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vFS_TypicalPlate_idFS_TypicalPlate,@vCommunity_idCommunity);
SET     FS_TypicalPlate_idFS_TypicalPlate = if(@vFS_TypicalPlate_idFS_TypicalPlate='',null,@vFS_TypicalPlate_idFS_TypicalPlate);

UPDATE fs_typicalplate_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_politicalactor.csv'
INTO TABLE g_politicalactor
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vActorName,@vActorType);
SET     ActorName = if(@vActorName='',null,@vActorName),
    ActorType = if(@vActorType='',null,@vActorType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_politicalactor_has_community.csv'
INTO TABLE g_politicalactor_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCommunity_idCommunity);
SET     Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_publicpolitic.csv'
INTO TABLE g_publicpolitic
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vDocumentTittle,@vPath,@vCommunity_idCommunity);
SET     DocumentTittle = if(@vDocumentTittle='',null,@vDocumentTittle),
    Path = if(@vPath='',null,@vPath);

UPDATE g_publicpolitic SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_demography.csv'
INTO TABLE gd_demography
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vFemale_LT_5,@vMale_LT_5,@vFemale_BT_5_17,@vMale_BT_5_17,@vFemale_BT_18_59,@vMale_BT_18_59,@vFemale_GT_59,@vMale_GT_59,@vGrowthRate,@vRefugeePopulation,@vIDH,@vLifeExpectancy,@vCountry_idCountry);
SET     Female_LT_5 = if(@vFemale_LT_5='',null,@vFemale_LT_5),
    Male_LT_5 = if(@vMale_LT_5='',null,@vMale_LT_5),
    Female_BT_5_17 = if(@vFemale_BT_5_17='',null,@vFemale_BT_5_17),
    Male_BT_5_17 = if(@vMale_BT_5_17='',null,@vMale_BT_5_17),
    Female_BT_18_59 = if(@vFemale_BT_18_59='',null,@vFemale_BT_18_59),
    Male_BT_18_59 = if(@vMale_BT_18_59='',null,@vMale_BT_18_59),
    Female_GT_59 = if(@vFemale_GT_59='',null,@vFemale_GT_59),
    Male_GT_59 = if(@vMale_GT_59='',null,@vMale_GT_59),
    GrowthRate = if(@vGrowthRate='',null,@vGrowthRate),
    RefugeePopulation = if(@vRefugeePopulation='',null,@vRefugeePopulation),
    IDH = if(@vIDH='',null,@vIDH),
    LifeExpectancy = if(@vLifeExpectancy='',null,@vLifeExpectancy),
    Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_economy.csv'
INTO TABLE gd_economy
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vFarming,@vCattelRaising,@vIndustry,@vServiceSector,@vPovertyPopulation,@vGINI,@vGDPPerCapita,@vPovertyLine,@vLocalCoin,@vExchangeRate,@vCountry_idCountry);
SET     Farming = if(@vFarming='',null,@vFarming),
    CattelRaising = if(@vCattelRaising='',null,@vCattelRaising),
    Industry = if(@vIndustry='',null,@vIndustry),
    ServiceSector = if(@vServiceSector='',null,@vServiceSector),
    PovertyPopulation = if(@vPovertyPopulation='',null,@vPovertyPopulation),
    GINI = if(@vGINI='',null,@vGINI),
    GDPPerCapita = if(@vGDPPerCapita='',null,@vGDPPerCapita),
    PovertyLine = if(@vPovertyLine='',null,@vPovertyLine),
    LocalCoin = if(@vLocalCoin='',null,@vLocalCoin),
    ExchangeRate = if(@vExchangeRate='',null,@vExchangeRate),
    Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_electricgenerationmix.csv'
INTO TABLE gd_electricgenerationmix
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vHydro,@vDiesel,@vGas,@vCoal,@vFotovoltaic,@vWind,@vBiofuel,@vCountry_idCountry);
SET     Hydro = if(@vHydro='',null,@vHydro),
    Diesel = if(@vDiesel='',null,@vDiesel),
    Gas = if(@vGas='',null,@vGas),
    Coal = if(@vCoal='',null,@vCoal),
    Fotovoltaic = if(@vFotovoltaic='',null,@vFotovoltaic),
    Wind = if(@vWind='',null,@vWind),
    Biofuel = if(@vBiofuel='',null,@vBiofuel),
    Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_ethnicgroup.csv'
INTO TABLE gd_ethnicgroup
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vEthnicGroup);
SET     EthnicGroup = if(@vEthnicGroup='',null,@vEthnicGroup);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_ethnicgroup_has_country.csv'
INTO TABLE gd_ethnicgroup_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCountry_idCountry);
SET     Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_government.csv'
INTO TABLE gd_government
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vRegimeType,@vCountry_idCountry);
SET     RegimeType = if(@vRegimeType='',null,@vRegimeType),
    Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_infrastructure.csv'
INTO TABLE gd_infrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vRuralWaterAccess,@vUrbanWaterAccess,@vRuralSanitationAccess,@vUrbanSanitationAccess,@vRuralElectricityAccess,@vUrbanElectricityAccess,@vNationalElectricityTariff,@vCountry_idCountry);
SET     RuralWaterAccess = if(@vRuralWaterAccess='',null,@vRuralWaterAccess),
    UrbanWaterAccess = if(@vUrbanWaterAccess='',null,@vUrbanWaterAccess),
    RuralSanitationAccess = if(@vRuralSanitationAccess='',null,@vRuralSanitationAccess),
    UrbanSanitationAccess = if(@vUrbanSanitationAccess='',null,@vUrbanSanitationAccess),
    RuralElectricityAccess = if(@vRuralElectricityAccess='',null,@vRuralElectricityAccess),
    UrbanElectricityAccess = if(@vUrbanElectricityAccess='',null,@vUrbanElectricityAccess),
    NationalElectricityTariff = if(@vNationalElectricityTariff='',null,@vNationalElectricityTariff),
    Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_serviceaccess.csv'
INTO TABLE gd_serviceaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vIlliteracyRate,@vInternetAccessRate,@vCountry_idCountry);
SET     IlliteracyRate = if(@vIlliteracyRate='',null,@vIlliteracyRate),
    InternetAccessRate = if(@vInternetAccessRate='',null,@vInternetAccessRate),
    Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_shelter.csv'
INTO TABLE gd_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vPeopleInSlum,@vCountry_idCountry);
SET     PeopleInSlum = if(@vPeopleInSlum='',null,@vPeopleInSlum),
    Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_urbanism.csv'
INTO TABLE gd_urbanism
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vUrbanPopulation,@vRuralPopulation,@vUrbanDensity,@vRuralDensity,@vCountry_idCountry);
SET     UrbanPopulation = if(@vUrbanPopulation='',null,@vUrbanPopulation),
    RuralPopulation = if(@vRuralPopulation='',null,@vRuralPopulation),
    UrbanDensity = if(@vUrbanDensity='',null,@vUrbanDensity),
    RuralDensity = if(@vRuralDensity='',null,@vRuralDensity),
    Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/hostcommunity.csv'
INTO TABLE hostcommunity
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCommunity_idCommunity,@vCountry_idCountry);
SET     Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    Country_idCountry = if(@vCountry_idCountry='',null,@vCountry_idCountry);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/hostcommunity_has_camp.csv'
INTO TABLE hostcommunity_has_camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCamp_idCamp);
SET     Camp_idCamp = if(@vCamp_idCamp='',null,@vCamp_idCamp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_appliance.csv'
INTO TABLE inf_appliance
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vApplianceType);
SET     ApplianceType = if(@vApplianceType='',null,@vApplianceType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_appliance_has_community.csv'
INTO TABLE inf_appliance_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vINF_Appliance_idINF_Appliance,@vCommunity_idCommunity,@vSector,@vPower,@vTimeUse);
SET     INF_Appliance_idINF_Appliance = if(@vINF_Appliance_idINF_Appliance='',null,@vINF_Appliance_idINF_Appliance),
    Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    Sector = if(@vSector='',null,@vSector),
    Power = if(@vPower='',null,@vPower),
    TimeUse = if(@vTimeUse='',null,@vTimeUse);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_colletionpoints.csv'
INTO TABLE inf_colletionpoints
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vCommunity_idCommunity);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude);

UPDATE inf_colletionpoints SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_cookwoman.csv'
INTO TABLE inf_cookwoman
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCookingInside,@vCookingOutside,@vCookingHours,@vHealthFirewood,@vWeeklyFirewood,@vFirewoodHours,@vCommunity_idCommunity);
SET     CookingInside = if(@vCookingInside='',null,@vCookingInside),
    CookingOutside = if(@vCookingOutside='',null,@vCookingOutside),
    CookingHours = if(@vCookingHours='',null,@vCookingHours),
    HealthFirewood = if(@vHealthFirewood='',null,@vHealthFirewood),
    WeeklyFirewood = if(@vWeeklyFirewood='',null,@vWeeklyFirewood),
    FirewoodHours = if(@vFirewoodHours='',null,@vFirewoodHours);

UPDATE inf_cookwoman SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_energyinfrastructure.csv'
INTO TABLE inf_energyinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vElectricServiceByElectricityGrid,@vExpandPlan,@vBlackoutElectricityPerDay,@vCurveOfDemand,@vStreetLight,@vDistanceToElectricityGrid,@vCommunity_idCommunity);
SET     ElectricServiceByElectricityGrid = if(@vElectricServiceByElectricityGrid='',null,@vElectricServiceByElectricityGrid),
    ExpandPlan = if(@vExpandPlan='',null,@vExpandPlan),
    BlackoutElectricityPerDay = if(@vBlackoutElectricityPerDay='',null,@vBlackoutElectricityPerDay),
    CurveOfDemand = if(@vCurveOfDemand='',null,@vCurveOfDemand),
    StreetLight = if(@vStreetLight='',null,@vStreetLight),
    DistanceToElectricityGrid = if(@vDistanceToElectricityGrid='',null,@vDistanceToElectricityGrid);

UPDATE inf_energyinfrastructure SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_expandplanbeneficiaries.csv'
INTO TABLE inf_expandplanbeneficiaries
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vBeneficiary);
SET     Beneficiary = if(@vBeneficiary='',null,@vBeneficiary);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_expandplanbeneficiaries_has_inf_energyinfrastructure.csv'
INTO TABLE inf_expandplanbeneficiaries_has_inf_energyinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vINF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries,@vINF_EnergyInfrastructure_idINF_EnergyInfrastructure,@vINF_EnergyInfrastructure_Community_idCommunity);
SET     INF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries = if(@vINF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries='',null,@vINF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries),
    INF_EnergyInfrastructure_idINF_EnergyInfrastructure = if(@vINF_EnergyInfrastructure_idINF_EnergyInfrastructure='',null,@vINF_EnergyInfrastructure_idINF_EnergyInfrastructure),
    INF_EnergyInfrastructure_Community_idCommunity = if(@vINF_EnergyInfrastructure_Community_idCommunity='',null,@vINF_EnergyInfrastructure_Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsource.csv'
INTO TABLE inf_generationsource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSource);
SET     Source = if(@vSource='',null,@vSource);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsource_has_community.csv'
INTO TABLE inf_generationsource_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vINF_GenerationSource_idINF_GenerationSource,@vCommunity_idCommunity,@vSector,@vTimeAccessDay,@vTimeAccessNight,@vCost);
SET     INF_GenerationSource_idINF_GenerationSource = if(@vINF_GenerationSource_idINF_GenerationSource='',null,@vINF_GenerationSource_idINF_GenerationSource),
    Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    Sector = if(@vSector='',null,@vSector),
    TimeAccessDay = if(@vTimeAccessDay='',null,@vTimeAccessDay),
    TimeAccessNight = if(@vTimeAccessNight='',null,@vTimeAccessNight),
    Cost = if(@vCost='',null,@vCost);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsystem.csv'
INTO TABLE inf_generationsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSystemType,@vCapacity,@vCommunity_idCommunity);
SET     SystemType = if(@vSystemType='',null,@vSystemType),
    Capacity = if(@vCapacity='',null,@vCapacity);

UPDATE inf_generationsystem SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_irrigatonsystem.csv'
INTO TABLE inf_irrigatonsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vOperating,@vWaterPumpPower,@vEnergySource);
SET     Operating = if(@vOperating='',null,@vOperating),
    WaterPumpPower = if(@vWaterPumpPower='',null,@vWaterPumpPower),
    EnergySource = if(@vEnergySource='',null,@vEnergySource);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_irrigatonsystem_has_community.csv'
INTO TABLE inf_irrigatonsystem_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vINF_IrrigatonSystem_idIrrigatonSystem,@vCommunity_idCommunity);
SET     INF_IrrigatonSystem_idIrrigatonSystem = if(@vINF_IrrigatonSystem_idIrrigatonSystem='',null,@vINF_IrrigatonSystem_idIrrigatonSystem);

UPDATE inf_irrigatonsystem_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_kitchen.csv'
INTO TABLE inf_kitchen
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vMainKitchenType,@vMainFuel,@vFirewoodConsumption,@vCommunity_idCommunity);
SET     MainKitchenType = if(@vMainKitchenType='',null,@vMainKitchenType),
    MainFuel = if(@vMainFuel='',null,@vMainFuel),
    FirewoodConsumption = if(@vFirewoodConsumption='',null,@vFirewoodConsumption);

UPDATE inf_kitchen SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_landfill.csv'
INTO TABLE inf_landfill
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vDistanceToHouses,@vDistanceToWaterResource,@vFertilEnviromentLocation,@vCommunity_idCommunity);
SET     DistanceToHouses = if(@vDistanceToHouses='',null,@vDistanceToHouses),
    DistanceToWaterResource = if(@vDistanceToWaterResource='',null,@vDistanceToWaterResource),
    FertilEnviromentLocation = if(@vFertilEnviromentLocation='',null,@vFertilEnviromentLocation);

UPDATE inf_landfill SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_lightingtech.csv'
INTO TABLE inf_lightingtech
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vTechType,@vTechPower,@vINF_PublicLighting_idINF_PublicLighting,@vINF_PublicLighting_Community_idCommunity);
SET     TechType = if(@vTechType='',null,@vTechType),
    TechPower = if(@vTechPower='',null,@vTechPower),
    INF_PublicLighting_idINF_PublicLighting = if(@vINF_PublicLighting_idINF_PublicLighting='',null,@vINF_PublicLighting_idINF_PublicLighting),
    INF_PublicLighting_Community_idCommunity = if(@vINF_PublicLighting_Community_idCommunity='',null,@vINF_PublicLighting_Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityinfrastructure.csv'
INTO TABLE inf_mobilityinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vDistanceToWorkstation,@vCommunity_idCommunity);
SET     DistanceToWorkstation = if(@vDistanceToWorkstation='',null,@vDistanceToWorkstation);

UPDATE inf_mobilityinfrastructure SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityway.csv'
INTO TABLE inf_mobilityway
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vWay);
SET     Way = if(@vWay='',null,@vWay);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityway_has_community.csv'
INTO TABLE inf_mobilityway_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vINF_MobilityWay_idINF_MobilityWay,@vCommunity_idCommunity,@vInternal_external);
SET     INF_MobilityWay_idINF_MobilityWay = if(@vINF_MobilityWay_idINF_MobilityWay='',null,@vINF_MobilityWay_idINF_MobilityWay),
    Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    Internal_external = if(@vInternal_external='',null,@vInternal_external);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobillitypoint.csv'
INTO TABLE inf_mobillitypoint
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vCommunity_idCommunity);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude);

UPDATE inf_mobillitypoint SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_potabilizationsystem.csv'
INTO TABLE inf_potabilizationsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vType);
SET     Type = if(@vType='',null,@vType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_potabilizationsystem_has_community.csv'
INTO TABLE inf_potabilizationsystem_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCommunity_idCommunity);
SET     Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_publiclighting.csv'
INTO TABLE inf_publiclighting
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vStreetLightWorking,@vLightPointsDistance,@vInfluenceInWomensSafety,@vCommunity_idCommunity);
SET     StreetLightWorking = if(@vStreetLightWorking='',null,@vStreetLightWorking),
    LightPointsDistance = if(@vLightPointsDistance='',null,@vLightPointsDistance),
    InfluenceInWomensSafety = if(@vInfluenceInWomensSafety='',null,@vInfluenceInWomensSafety);

UPDATE inf_publiclighting SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationaccess.csv'
INTO TABLE inf_sanitationaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vOutdoorsLatrine,@vlatrineType,@vCommunity_idCommunity);
SET     OutdoorsLatrine = if(@vOutdoorsLatrine='',null,@vOutdoorsLatrine),
    latrineType = if(@vlatrineType='',null,@vlatrineType);

UPDATE inf_sanitationaccess SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationsystemquality.csv'
INTO TABLE inf_sanitationsystemquality
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vslab,@vventilated,@vdurableStructure,@vwall_Roof,@vdoor);
SET     slab = if(@vslab='',null,@vslab),
    ventilated = if(@vventilated='',null,@vventilated),
    durableStructure = if(@vdurableStructure='',null,@vdurableStructure),
    wall_Roof = if(@vwall_Roof='',null,@vwall_Roof),
    door = if(@vdoor='',null,@vdoor);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationsystemquality_has_community.csv'
INTO TABLE inf_sanitationsystemquality_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vINF_SanitationSystemQuality_idINF_SanitationSystemQuality,@vCommunity_idCommunity);
SET     INF_SanitationSystemQuality_idINF_SanitationSystemQuality = if(@vINF_SanitationSystemQuality_idINF_SanitationSystemQuality='',null,@vINF_SanitationSystemQuality_idINF_SanitationSystemQuality);

UPDATE inf_sanitationsystemquality_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_streetlamp.csv'
INTO TABLE inf_streetlamp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vCommunity_idCommunity);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude);

UPDATE inf_streetlamp SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_timespent.csv'
INTO TABLE inf_timespent
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vDailyTimeSpent,@vINF_WaterInfrastructure_idINF_WaterInfrastructure,@vINF_WaterInfrastructure_Community_idCommunity);
SET     DailyTimeSpent = if(@vDailyTimeSpent='',null,@vDailyTimeSpent),
    INF_WaterInfrastructure_idINF_WaterInfrastructure = if(@vINF_WaterInfrastructure_idINF_WaterInfrastructure='',null,@vINF_WaterInfrastructure_idINF_WaterInfrastructure),
    INF_WaterInfrastructure_Community_idCommunity = if(@vINF_WaterInfrastructure_Community_idCommunity='',null,@vINF_WaterInfrastructure_Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_wastemanagementginfrastructure.csv'
INTO TABLE inf_wastemanagementginfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCollectionServicePerMonth,@vCommunity_idCommunity);
SET     CollectionServicePerMonth = if(@vCollectionServicePerMonth='',null,@vCollectionServicePerMonth);

UPDATE inf_wastemanagementginfrastructure SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_waterinfrastructure.csv'
INTO TABLE inf_waterinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vWaterQuality,@vConsumptionPerCapita,@vSourceType,@vCommunity_idCommunity);
SET     WaterQuality = if(@vWaterQuality='',null,@vWaterQuality),
    ConsumptionPerCapita = if(@vConsumptionPerCapita='',null,@vConsumptionPerCapita),
    SourceType = if(@vSourceType='',null,@vSourceType);

UPDATE inf_waterinfrastructure SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_waterpoint.csv'
INTO TABLE inf_waterpoint
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vWorking,@vCommunity_idCommunity);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude),
    Working = if(@vWorking='',null,@vWorking);

UPDATE inf_waterpoint SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_womensafety.csv'
INTO TABLE inf_womensafety
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vInfluence,@vINF_PublicLighting_idINF_PublicLighting,@vINF_PublicLighting_Community_idCommunity);
SET     Influence = if(@vInfluence='',null,@vInfluence),
    INF_PublicLighting_idINF_PublicLighting = if(@vINF_PublicLighting_idINF_PublicLighting='',null,@vINF_PublicLighting_idINF_PublicLighting),
    INF_PublicLighting_Community_idCommunity = if(@vINF_PublicLighting_Community_idCommunity='',null,@vINF_PublicLighting_Community_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_app.csv'
INTO TABLE s_app
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vApp);
SET     App = if(@vApp='',null,@vApp);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_app_has_community.csv'
INTO TABLE s_app_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vS_App_idS_App,@vCommunity_idCommunity,@vUse_Necesity);
SET     S_App_idS_App = if(@vS_App_idS_App='',null,@vS_App_idS_App),
    Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    Use_Necesity = if(@vUse_Necesity='',null,@vUse_Necesity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_buildingquality.csv'
INTO TABLE s_buildingquality
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vNoFiltrationRoof,@vSecureStructured,@vClimaticHazard,@vThermalConfort);
SET     NoFiltrationRoof = if(@vNoFiltrationRoof='',null,@vNoFiltrationRoof),
    SecureStructured = if(@vSecureStructured='',null,@vSecureStructured),
    ClimaticHazard = if(@vClimaticHazard='',null,@vClimaticHazard),
    ThermalConfort = if(@vThermalConfort='',null,@vThermalConfort);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_cementery.csv'
INTO TABLE s_cementery
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vDrainage,@vUpperBound,@vNoAccessArea);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude),
    Drainage = if(@vDrainage='',null,@vDrainage),
    UpperBound = if(@vUpperBound='',null,@vUpperBound),
    NoAccessArea = if(@vNoAccessArea='',null,@vNoAccessArea);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_cementery_has_community.csv'
INTO TABLE s_cementery_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vS_Cementery_idS_Cementery,@vCommunity_idCommunity);
SET     S_Cementery_idS_Cementery = if(@vS_Cementery_idS_Cementery='',null,@vS_Cementery_idS_Cementery);

UPDATE s_cementery_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_dataaccess.csv'
INTO TABLE s_dataaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vDataType);
SET     DataType = if(@vDataType='',null,@vDataType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_dataaccess_has_community.csv'
INTO TABLE s_dataaccess_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCommunity_idCommunity);
SET     Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_educationalcenter.csv'
INTO TABLE s_educationalcenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vEducationType,@vStudents,@vWorkingpoints,@vTeachers,@vMaterial,@vTimeStart,@vTimeFinish,@vS_BuildingQuality_idS_BuildingQuality);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude),
    EducationType = if(@vEducationType='',null,@vEducationType),
    Students = if(@vStudents='',null,@vStudents),
    Workingpoints = if(@vWorkingpoints='',null,@vWorkingpoints),
    Teachers = if(@vTeachers='',null,@vTeachers),
    Material = if(@vMaterial='',null,@vMaterial),
    TimeStart = if(@vTimeStart='',null,@vTimeStart),
    TimeFinish = if(@vTimeFinish='',null,@vTimeFinish),
    S_BuildingQuality_idS_BuildingQuality = if(@vS_BuildingQuality_idS_BuildingQuality='',null,@vS_BuildingQuality_idS_BuildingQuality);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_educationalcenter_has_community.csv'
INTO TABLE s_educationalcenter_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vS_EducationalCenter_idS_EducationalCenter,@vCommunity_idCommunity);
SET     S_EducationalCenter_idS_EducationalCenter = if(@vS_EducationalCenter_idS_EducationalCenter='',null,@vS_EducationalCenter_idS_EducationalCenter);

UPDATE s_educationalcenter_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_healthcenterservice.csv'
INTO TABLE s_healthcenterservice
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vPrimaryAttention2kms,@vHospital5kms,@vCommunity_idCommunity);
SET     PrimaryAttention2kms = if(@vPrimaryAttention2kms='',null,@vPrimaryAttention2kms),
    Hospital5kms = if(@vHospital5kms='',null,@vHospital5kms);

UPDATE s_healthcenterservice SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_hospital.csv'
INTO TABLE s_hospital
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vBeds,@vNoAccessArea,@vS_BuildingQuality_idS_BuildingQuality);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude),
    Beds = if(@vBeds='',null,@vBeds),
    NoAccessArea = if(@vNoAccessArea='',null,@vNoAccessArea),
    S_BuildingQuality_idS_BuildingQuality = if(@vS_BuildingQuality_idS_BuildingQuality='',null,@vS_BuildingQuality_idS_BuildingQuality);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_hospital_has_community.csv'
INTO TABLE s_hospital_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vS_Hospital_idS_Hospital,@vCommunity_idCommunity);
SET     S_Hospital_idS_Hospital = if(@vS_Hospital_idS_Hospital='',null,@vS_Hospital_idS_Hospital);

UPDATE s_hospital_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_medicineaccess.csv'
INTO TABLE s_medicineaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vAccess,@vCommunity_idCommunity);
SET     Access = if(@vAccess='',null,@vAccess);

UPDATE s_medicineaccess SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_noeducationcause.csv'
INTO TABLE s_noeducationcause
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCause);
SET     Cause = if(@vCause='',null,@vCause);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_noeducationcause_has_community.csv'
INTO TABLE s_noeducationcause_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCommunity_idCommunity);
SET     Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_othercenter.csv'
INTO TABLE s_othercenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vCenterType,@vCenterName,@vNoAccessArea);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude),
    CenterType = if(@vCenterType='',null,@vCenterType),
    CenterName = if(@vCenterName='',null,@vCenterName),
    NoAccessArea = if(@vNoAccessArea='',null,@vNoAccessArea);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_othercenter_has_community.csv'
INTO TABLE s_othercenter_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vS_OtherCenter_idS_OtherCenter,@vCommunity_idCommunity);
SET     S_OtherCenter_idS_OtherCenter = if(@vS_OtherCenter_idS_OtherCenter='',null,@vS_OtherCenter_idS_OtherCenter);

UPDATE s_othercenter_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_primaryattention.csv'
INTO TABLE s_primaryattention
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vNoAccesArea,@vS_BuildingQuality_idS_BuildingQuality);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude),
    NoAccesArea = if(@vNoAccesArea='',null,@vNoAccesArea),
    S_BuildingQuality_idS_BuildingQuality = if(@vS_BuildingQuality_idS_BuildingQuality='',null,@vS_BuildingQuality_idS_BuildingQuality);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_primaryattention_has_community.csv'
INTO TABLE s_primaryattention_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vS_PrimaryAttention_idS_PrimaryAttention,@vCommunity_idCommunity);
SET     S_PrimaryAttention_idS_PrimaryAttention = if(@vS_PrimaryAttention_idS_PrimaryAttention='',null,@vS_PrimaryAttention_idS_PrimaryAttention);

UPDATE s_primaryattention_has_community SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_repeaterantena.csv'
INTO TABLE s_repeaterantena
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vNumber,@vCommunity_idCommunity);
SET     Number = if(@vNumber='',null,@vNumber);

UPDATE s_repeaterantena SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_subject.csv'
INTO TABLE s_subject
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSubject);
SET     Subject = if(@vSubject='',null,@vSubject);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_subject_has_s_educationalcenter.csv'
INTO TABLE s_subject_has_s_educationalcenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vS_Subject_idS_Subject,@vS_EducationalCenter_idS_EducationalCenter,@vSubjectType);
SET     S_Subject_idS_Subject = if(@vS_Subject_idS_Subject='',null,@vS_Subject_idS_Subject),
    S_EducationalCenter_idS_EducationalCenter = if(@vS_EducationalCenter_idS_EducationalCenter='',null,@vS_EducationalCenter_idS_EducationalCenter),
    SubjectType = if(@vSubjectType='',null,@vSubjectType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_tecknowlege.csv'
INTO TABLE s_tecknowlege
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vknowlegeType);
SET     knowlegeType = if(@vknowlegeType='',null,@vknowlegeType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_tecknowlege_has_community.csv'
INTO TABLE s_tecknowlege_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vS_Tecknowlege_idS_Tecknowlege,@vCommunity_idCommunity,@vNumberPersons);
SET     S_Tecknowlege_idS_Tecknowlege = if(@vS_Tecknowlege_idS_Tecknowlege='',null,@vS_Tecknowlege_idS_Tecknowlege),
    Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    NumberPersons = if(@vNumberPersons='',null,@vNumberPersons);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_cleaningmaterial.csv'
INTO TABLE se_cleaningmaterial
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vMaterial);
SET     Material = if(@vMaterial='',null,@vMaterial);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_cleaningmaterial_has_community.csv'
INTO TABLE se_cleaningmaterial_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCommunity_idCommunity);
SET     Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_conflictarea.csv'
INTO TABLE se_conflictarea
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vCommunity_idCommunity);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude);

UPDATE se_conflictarea SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_economy.csv'
INTO TABLE se_economy
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vBasicBasketCost,@vCommunity_idCommunity);
SET     BasicBasketCost = if(@vBasicBasketCost='',null,@vBasicBasketCost);

UPDATE se_economy SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_expensetype.csv'
INTO TABLE se_expensetype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vType);
SET     Type = if(@vType='',null,@vType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_expensetype_has_community.csv'
INTO TABLE se_expensetype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSE_ExpenseType_idSE_ExpenseType,@vCommunity_idCommunity,@vSex,@vExpenseValue);
SET     SE_ExpenseType_idSE_ExpenseType = if(@vSE_ExpenseType_idSE_ExpenseType='',null,@vSE_ExpenseType_idSE_ExpenseType),
    Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    Sex = if(@vSex='',null,@vSex),
    ExpenseValue = if(@vExpenseValue='',null,@vExpenseValue);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_genderdata.csv'
INTO TABLE se_genderdata
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLeadingWomen,@vCommunity_idCommunity);
SET     LeadingWomen = if(@vLeadingWomen='',null,@vLeadingWomen);

UPDATE se_genderdata SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_householdcomposition.csv'
INTO TABLE se_householdcomposition
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vWomen,@vMen,@vTeenagers,@vKids,@vCommunity_idCommunity);
SET     Women = if(@vWomen='',null,@vWomen),
    Men = if(@vMen='',null,@vMen),
    Teenagers = if(@vTeenagers='',null,@vTeenagers),
    Kids = if(@vKids='',null,@vKids);

UPDATE se_householdcomposition SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_incometype.csv'
INTO TABLE se_incometype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vType);
SET     Type = if(@vType='',null,@vType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_incometype_has_community.csv'
INTO TABLE se_incometype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSE_IncomeType_idSE_IncomeType,@vCommunity_idCommunity,@vSex,@vIncomeValue);
SET     SE_IncomeType_idSE_IncomeType = if(@vSE_IncomeType_idSE_IncomeType='',null,@vSE_IncomeType_idSE_IncomeType),
    Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    Sex = if(@vSex='',null,@vSex),
    IncomeValue = if(@vIncomeValue='',null,@vIncomeValue);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_personalhygiene.csv'
INTO TABLE se_personalhygiene
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vTimesPerWeek,@vCommunity_idCommunity);
SET     TimesPerWeek = if(@vTimesPerWeek='',null,@vTimesPerWeek);

UPDATE se_personalhygiene SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_population.csv'
INTO TABLE se_population
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLT_5,@vBT_5_17,@vBT_18_59,@vGT_59,@vDiferentAbilitiesPeople,@vCommunity_idCommunity);
SET     LT_5 = if(@vLT_5='',null,@vLT_5),
    BT_5_17 = if(@vBT_5_17='',null,@vBT_5_17),
    BT_18_59 = if(@vBT_18_59='',null,@vBT_18_59),
    GT_59 = if(@vGT_59='',null,@vGT_59),
    DiferentAbilitiesPeople = if(@vDiferentAbilitiesPeople='',null,@vDiferentAbilitiesPeople);

UPDATE se_population SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_priority.csv'
INTO TABLE se_priority
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vType);
SET     Type = if(@vType='',null,@vType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_priority_has_community.csv'
INTO TABLE se_priority_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSE_Priority_idSE_Priority,@vCommunity_idCommunity,@vtotalAnswer,@vpriorityLevel);
SET     SE_Priority_idSE_Priority = if(@vSE_Priority_idSE_Priority='',null,@vSE_Priority_idSE_Priority),
    Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    totalAnswer = if(@vtotalAnswer='',null,@vtotalAnswer),
    priorityLevel = if(@vpriorityLevel='',null,@vpriorityLevel);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetycommittee.csv'
INTO TABLE se_safetycommittee
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSafetyCommittee,@vWomenPatrol,@vCommunity_idCommunity);
SET     SafetyCommittee = if(@vSafetyCommittee='',null,@vSafetyCommittee),
    WomenPatrol = if(@vWomenPatrol='',null,@vWomenPatrol);

UPDATE se_safetycommittee SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetylatrines.csv'
INTO TABLE se_safetylatrines
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSeparatedBySex,@vLight,@vCommunity_idCommunity);
SET     SeparatedBySex = if(@vSeparatedBySex='',null,@vSeparatedBySex),
    Light = if(@vLight='',null,@vLight);

UPDATE se_safetylatrines SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetyplace.csv'
INTO TABLE se_safetyplace
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vPlace_Time);
SET     Place_Time = if(@vPlace_Time='',null,@vPlace_Time);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetyplace_has_community.csv'
INTO TABLE se_safetyplace_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vSE_SafetyPlace_idSE_SafetyPlace,@vCommunity_idCommunity,@vAnswer);
SET     SE_SafetyPlace_idSE_SafetyPlace = if(@vSE_SafetyPlace_idSE_SafetyPlace='',null,@vSE_SafetyPlace_idSE_SafetyPlace),
    Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    Answer = if(@vAnswer='',null,@vAnswer);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_worktype.csv'
INTO TABLE se_worktype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vWorkType);
SET     WorkType = if(@vWorkType='',null,@vWorkType);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_worktype_has_community.csv'
INTO TABLE se_worktype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vCommunity_idCommunity,@vchildNumber,@vwomenNumber,@vmenNumber);
SET     Community_idCommunity = if(@vCommunity_idCommunity='',null,@vCommunity_idCommunity),
    childNumber = if(@vchildNumber='',null,@vchildNumber),
    womenNumber = if(@vwomenNumber='',null,@vwomenNumber),
    menNumber = if(@vmenNumber='',null,@vmenNumber);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_building.csv'
INTO TABLE sh_building
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vLatitude,@vLongitude,@vAltitude,@vApropiateRoof,@vSecureStructured,@vClimateThreatProtect,@vWindowsAllRooms,@vNoHumidity,@vNoAnimals,@vLT30Dregrees,@vCommunity_idCommunity);
SET     Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude),
    ApropiateRoof = if(@vApropiateRoof='',null,@vApropiateRoof),
    SecureStructured = if(@vSecureStructured='',null,@vSecureStructured),
    ClimateThreatProtect = if(@vClimateThreatProtect='',null,@vClimateThreatProtect),
    WindowsAllRooms = if(@vWindowsAllRooms='',null,@vWindowsAllRooms),
    NoHumidity = if(@vNoHumidity='',null,@vNoHumidity),
    NoAnimals = if(@vNoAnimals='',null,@vNoAnimals),
    LT30Dregrees = if(@vLT30Dregrees='',null,@vLT30Dregrees);

UPDATE sh_building SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_house.csv'
INTO TABLE sh_house
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vRooms,@vPosibleUpgrading,@vCommunity_idCommunity);
SET     Rooms = if(@vRooms='',null,@vRooms),
    PosibleUpgrading = if(@vPosibleUpgrading='',null,@vPosibleUpgrading);

UPDATE sh_house SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_shelter.csv'
INTO TABLE sh_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vTotalHouses,@vConstructionCost,@vConstructionType,@vCommunity_idCommunity);
SET     TotalHouses = if(@vTotalHouses='',null,@vTotalHouses),
    ConstructionCost = if(@vConstructionCost='',null,@vConstructionCost),
    ConstructionType = if(@vConstructionType='',null,@vConstructionType);

UPDATE sh_shelter SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_area.csv'
INTO TABLE u_area
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vAreaType,@vLatitude,@vLongitude,@vAltitude,@vCommunity_idCommunity);
SET     AreaType = if(@vAreaType='',null,@vAreaType),
    Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude);

UPDATE u_area SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_landuse.csv'
INTO TABLE u_landuse
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vPrivateLandArea,@vUrbanFloodingArea,@vUrbanSlopeRiskAre,@vCommunity_idCommunity);
SET     PrivateLandArea = if(@vPrivateLandArea='',null,@vPrivateLandArea),
    UrbanFloodingArea = if(@vUrbanFloodingArea='',null,@vUrbanFloodingArea),
    UrbanSlopeRiskAre = if(@vUrbanSlopeRiskAre='',null,@vUrbanSlopeRiskAre);

UPDATE u_landuse SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_publicspace.csv'
INTO TABLE u_publicspace
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vTotalArea,@vCommunity_idCommunity);
SET     TotalArea = if(@vTotalArea='',null,@vTotalArea);

UPDATE u_publicspace SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_recreationalarea.csv'
INTO TABLE u_recreationalarea
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vAreaName,@vLatitude,@vLongitude,@vAltitude,@vWoodland_ShadedArea,@vUrbanFurniture,@vFloor_DrainageSystem,@vPSTrush,@vCommunity_idCommunity);
SET     AreaName = if(@vAreaName='',null,@vAreaName),
    Latitude = if(@vLatitude='',null,@vLatitude),
    Longitude = if(@vLongitude='',null,@vLongitude),
    Altitude = if(@vAltitude='',null,@vAltitude),
    Woodland_ShadedArea = if(@vWoodland_ShadedArea='',null,@vWoodland_ShadedArea),
    UrbanFurniture = if(@vUrbanFurniture='',null,@vUrbanFurniture),
    Floor_DrainageSystem = if(@vFloor_DrainageSystem='',null,@vFloor_DrainageSystem),
    PSTrush = if(@vPSTrush='',null,@vPSTrush);

UPDATE u_recreationalarea SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_road.csv'
INTO TABLE u_road
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vRoadsLength,@vDrainageSystem,@vConditioning,@vCommunity_idCommunity);
SET     RoadsLength = if(@vRoadsLength='',null,@vRoadsLength),
    DrainageSystem = if(@vDrainageSystem='',null,@vDrainageSystem),
    Conditioning = if(@vConditioning='',null,@vConditioning);

UPDATE u_road SET Community_idCommunity = (SELECT @CommunityID);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_urbanism.csv'
INTO TABLE u_urbanism
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@vUrbanPlan,@vUrbanPlanDuratrion,@vCampLimits,@vLandManagement,@vPlannedGrowth,@vGrowthForecast,@vUrbanPlanRiskInstruments,@vRiskType,@vAVG_PlotArea,@vPlotDelimitation,@vCommunity_idCommunity);
SET     UrbanPlan = if(@vUrbanPlan='',null,@vUrbanPlan),
    UrbanPlanDuratrion = if(@vUrbanPlanDuratrion='',null,@vUrbanPlanDuratrion),
    CampLimits = if(@vCampLimits='',null,@vCampLimits),
    LandManagement = if(@vLandManagement='',null,@vLandManagement),
    PlannedGrowth = if(@vPlannedGrowth='',null,@vPlannedGrowth),
    GrowthForecast = if(@vGrowthForecast='',null,@vGrowthForecast),
    UrbanPlanRiskInstruments = if(@vUrbanPlanRiskInstruments='',null,@vUrbanPlanRiskInstruments),
    RiskType = if(@vRiskType='',null,@vRiskType),
    AVG_PlotArea = if(@vAVG_PlotArea='',null,@vAVG_PlotArea),
    PlotDelimitation = if(@vPlotDelimitation='',null,@vPlotDelimitation);

UPDATE u_urbanism SET Community_idCommunity = (SELECT @CommunityID);

