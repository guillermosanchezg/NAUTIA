SET FOREIGN_KEY_CHECKS=0;
SET SQL_SAFE_UPDATES = 0;
SET @OLD_SQL_MODE=@@SQL_MODE, sql_mode='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/community.csv'
INTO TABLE community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Name)
SET Name = NULLIF(@Name,'');
SET @CommunityID = (SELECT idCommunity FROM community ORDER BY idCommunity DESC LIMIT 1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp.csv'
INTO TABLE camp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@StabilisationDate,@MigrationRate)
SET StabilisationDate = NULLIF(@StabilisationDate,''),
    MigrationRate = NULLIF(@MigrationRate,'');
SET @campID = (SELECT idCamp FROM camp ORDER BY idCamp DESC LIMIT 1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/Country.csv'
INTO TABLE Country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@CountryName)
SET CountryName = NULLIF(@CountryName,'');
SET @CountryID = (SELECT idCountry FROM Country ORDER BY idCountry DESC LIMIT 1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_climaticregion.csv'
INTO TABLE camp_climaticregion
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Region,@MaxTemp,@MinTemp,@AVGTemp,@RelativeHumidity,@MaxRainfall,@MinRainfall,@Irradiance,@WindSpeed)
SET Region = NULLIF(@Region,''),
    MaxTemp = NULLIF(@MaxTemp,''),
    MinTemp = NULLIF(@MinTemp,''),
    AVGTemp = NULLIF(@AVGTemp,''),
    RelativeHumidity = NULLIF(@RelativeHumidity,''),
    MaxRainfall = NULLIF(@MaxRainfall,''),
    MinRainfall = NULLIF(@MinRainfall,''),
    Irradiance = NULLIF(@Irradiance,''),
    WindSpeed = NULLIF(@WindSpeed,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_energysource.csv'
INTO TABLE camp_energysource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Source)
SET Source = NULLIF(@Source,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_enviroment.csv'
INTO TABLE camp_enviroment
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@EnviromentValueArea,@DeforestedArea)
SET EnviromentValueArea = NULLIF(@EnviromentValueArea,''),
    DeforestedArea = NULLIF(@DeforestedArea,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_integration.csv'
INTO TABLE camp_integration
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@RelationshipCause)
SET RelationshipCause = NULLIF(@RelationshipCause,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localcrop.csv'
INTO TABLE camp_localcrop
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localvegetation.csv'
INTO TABLE camp_localvegetation
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Species)
SET Species = NULLIF(@Species,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_mobility.csv'
INTO TABLE camp_mobility
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@ConstentOutCamp,@MaxDistance)
SET ConstentOutCamp = NULLIF(@ConstentOutCamp,''),
    MaxDistance = NULLIF(@MaxDistance,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_movementreason.csv'
INTO TABLE camp_movementreason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Reason)
SET Reason = NULLIF(@Reason,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_naturalhazard.csv'
INTO TABLE camp_naturalhazard
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@HazardType)
SET HazardType = NULLIF(@HazardType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_shelter.csv'
INTO TABLE camp_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@UpgradingPosibility)
SET UpgradingPosibility = NULLIF(@UpgradingPosibility,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_geographicidentification.csv'
INTO TABLE fa_geographicidentification
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@PhreaticLevel,@Area)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    PhreaticLevel = NULLIF(@PhreaticLevel,''),
    Area = NULLIF(@Area,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_naturalresource.csv'
INTO TABLE fa_naturalresource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Type,@Bound)
SET Type = NULLIF(@Type,''),
    Bound = NULLIF(@Bound,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_topography.csv'
INTO TABLE fa_topography
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@UpperBound,@LowerBound)
SET UpperBound = NULLIF(@UpperBound,''),
    LowerBound = NULLIF(@LowerBound,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cause.csv'
INTO TABLE fs_cause
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Cause)
SET Cause = NULLIF(@Cause,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralcropdata.csv'
INTO TABLE fs_corralcropdata
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@PastoralismTechnique,@FertilizationSystem)
SET PastoralismTechnique = NULLIF(@PastoralismTechnique,''),
    FertilizationSystem = NULLIF(@FertilizationSystem,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralubication.csv'
INTO TABLE fs_corralubication
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@Type,@DrainageSystem)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,''),
    Type = NULLIF(@Type,''),
    DrainageSystem = NULLIF(@DrainageSystem,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cropubication.csv'
INTO TABLE fs_cropubication
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@Type,@IrrigationSystem)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,''),
    Type = NULLIF(@Type,''),
    IrrigationSystem = NULLIF(@IrrigationSystem,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cultivationseason.csv'
INTO TABLE fs_cultivationseason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@january,@february,@march,@april,@may,@june,@july,@august,@september,@octuber,@november,@december)
SET january = NULLIF(@january,''),
    february = NULLIF(@february,''),
    march = NULLIF(@march,''),
    april = NULLIF(@april,''),
    may = NULLIF(@may,''),
    june = NULLIF(@june,''),
    july = NULLIF(@july,''),
    august = NULLIF(@august,''),
    september = NULLIF(@september,''),
    octuber = NULLIF(@octuber,''),
    november = NULLIF(@november,''),
    december = NULLIF(@december,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccess.csv'
INTO TABLE fs_foodaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@FoodType)
SET FoodType = NULLIF(@FoodType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccesscontinuity.csv'
INTO TABLE fs_foodaccesscontinuity
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@NoProcessedFoodDuration,@FoodConservationTec)
SET NoProcessedFoodDuration = NULLIF(@NoProcessedFoodDuration,''),
    FoodConservationTec = NULLIF(@FoodConservationTec,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsafety.csv'
INTO TABLE fs_foodsafety
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@kids,@women,@men,@senior,@intake)
SET kids = NULLIF(@kids,''),
    women = NULLIF(@women,''),
    men = NULLIF(@men,''),
    senior = NULLIF(@senior,''),
    intake = NULLIF(@intake,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsource.csv'
INTO TABLE fs_foodsource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Source)
SET Source = NULLIF(@Source,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_grainconservation.csv'
INTO TABLE fs_grainconservation
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@ConservationTec)
SET ConservationTec = NULLIF(@ConservationTec,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_grainmill.csv'
INTO TABLE fs_grainmill
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Operative,@EnginePower,@GoodUbication)
SET Operative = NULLIF(@Operative,''),
    EnginePower = NULLIF(@EnginePower,''),
    GoodUbication = NULLIF(@GoodUbication,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_importantmeal.csv'
INTO TABLE fs_importantmeal
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@meal)
SET meal = NULLIF(@meal,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_owncultivationfoodtype.csv'
INTO TABLE fs_owncultivationfoodtype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_selfsufficiencyseason.csv'
INTO TABLE fs_selfsufficiencyseason
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@january,@february,@march,@april,@may,@june,@july,@august,@september,@octuber,@november,@december)
SET january = NULLIF(@january,''),
    february = NULLIF(@february,''),
    march = NULLIF(@march,''),
    april = NULLIF(@april,''),
    may = NULLIF(@may,''),
    june = NULLIF(@june,''),
    july = NULLIF(@july,''),
    august = NULLIF(@august,''),
    september = NULLIF(@september,''),
    octuber = NULLIF(@octuber,''),
    november = NULLIF(@november,''),
    december = NULLIF(@december,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_timesperday.csv'
INTO TABLE fs_timesperday
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@times)
SET times = NULLIF(@times,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_typicalplate.csv'
INTO TABLE fs_typicalplate
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Plate)
SET Plate = NULLIF(@Plate,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_politicalactor.csv'
INTO TABLE g_politicalactor
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@ActorName,@ActorType)
SET ActorName = NULLIF(@ActorName,''),
    ActorType = NULLIF(@ActorType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_demography.csv'
INTO TABLE gd_demography
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Female_LT_5,@Male_LT_5,@Female_BT_5_17,@Male_BT_5_17,@Female_BT_18_59,@Male_BT_18_59,@Female_GT_59,@Male_GT_59,@GrowthRate,@RefugeePopulation,@IDH,@LifeExpectancy)
SET Female_LT_5 = NULLIF(@Female_LT_5,''),
    Male_LT_5 = NULLIF(@Male_LT_5,''),
    Female_BT_5_17 = NULLIF(@Female_BT_5_17,''),
    Male_BT_5_17 = NULLIF(@Male_BT_5_17,''),
    Female_BT_18_59 = NULLIF(@Female_BT_18_59,''),
    Male_BT_18_59 = NULLIF(@Male_BT_18_59,''),
    Female_GT_59 = NULLIF(@Female_GT_59,''),
    Male_GT_59 = NULLIF(@Male_GT_59,''),
    GrowthRate = NULLIF(@GrowthRate,''),
    RefugeePopulation = NULLIF(@RefugeePopulation,''),
    IDH = NULLIF(@IDH,''),
    LifeExpectancy = NULLIF(@LifeExpectancy,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_economy.csv'
INTO TABLE gd_economy
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Farming,@CattelRaising,@Industry,@ServiceSector,@PovertyPopulation,@GINI,@GDPPerCapita,@PovertyLine,@LocalCoin,@ExchangeRate)
SET Farming = NULLIF(@Farming,''),
    CattelRaising = NULLIF(@CattelRaising,''),
    Industry = NULLIF(@Industry,''),
    ServiceSector = NULLIF(@ServiceSector,''),
    PovertyPopulation = NULLIF(@PovertyPopulation,''),
    GINI = NULLIF(@GINI,''),
    GDPPerCapita = NULLIF(@GDPPerCapita,''),
    PovertyLine = NULLIF(@PovertyLine,''),
    LocalCoin = NULLIF(@LocalCoin,''),
    ExchangeRate = NULLIF(@ExchangeRate,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_electricgenerationmix.csv'
INTO TABLE gd_electricgenerationmix
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Hydro,@Diesel,@Gas,@Coal,@Fotovoltaic,@Wind,@Biofuel)
SET Hydro = NULLIF(@Hydro,''),
    Diesel = NULLIF(@Diesel,''),
    Gas = NULLIF(@Gas,''),
    Coal = NULLIF(@Coal,''),
    Fotovoltaic = NULLIF(@Fotovoltaic,''),
    Wind = NULLIF(@Wind,''),
    Biofuel = NULLIF(@Biofuel,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_ethnicgroup.csv'
INTO TABLE gd_ethnicgroup
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@EthnicGroup)
SET EthnicGroup = NULLIF(@EthnicGroup,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_government.csv'
INTO TABLE gd_government
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@RegimeType)
SET RegimeType = NULLIF(@RegimeType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_infrastructure.csv'
INTO TABLE gd_infrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@RuralWaterAccess,@UrbanWaterAccess,@RuralSanitationAccess,@UrbanSanitationAccess,@RuralElectricityAccess,@UrbanElectricityAccess,@NationalElectricityTariff)
SET RuralWaterAccess = NULLIF(@RuralWaterAccess,''),
    UrbanWaterAccess = NULLIF(@UrbanWaterAccess,''),
    RuralSanitationAccess = NULLIF(@RuralSanitationAccess,''),
    UrbanSanitationAccess = NULLIF(@UrbanSanitationAccess,''),
    RuralElectricityAccess = NULLIF(@RuralElectricityAccess,''),
    UrbanElectricityAccess = NULLIF(@UrbanElectricityAccess,''),
    NationalElectricityTariff = NULLIF(@NationalElectricityTariff,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_language.csv'
INTO TABLE gd_language
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Language)
SET Language = NULLIF(@Language,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_religion.csv'
INTO TABLE gd_religion
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Religion)
SET Religion = NULLIF(@Religion,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_serviceaccess.csv'
INTO TABLE gd_serviceaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@IlliteracyRate,@InternetAccessRate)
SET IlliteracyRate = NULLIF(@IlliteracyRate,''),
    InternetAccessRate = NULLIF(@InternetAccessRate,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_shelter.csv'
INTO TABLE gd_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@PeopleInSlum)
SET PeopleInSlum = NULLIF(@PeopleInSlum,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_urbanism.csv'
INTO TABLE gd_urbanism
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@UrbanPopulation,@RuralPopulation,@UrbanDensity,@RuralDensity)
SET UrbanPopulation = NULLIF(@UrbanPopulation,''),
    RuralPopulation = NULLIF(@RuralPopulation,''),
    UrbanDensity = NULLIF(@UrbanDensity,''),
    RuralDensity = NULLIF(@RuralDensity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_appliance.csv'
INTO TABLE inf_appliance
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@ApplianceType)
SET ApplianceType = NULLIF(@ApplianceType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_collectionpoints.csv'
INTO TABLE inf_collectionpoints
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_cookwoman.csv'
INTO TABLE inf_cookwoman
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@CookingInside,@CookingOutside,@CookingHours,@HealthFirewood,@WeeklyFirewood,@FirewoodHours)
SET CookingInside = NULLIF(@CookingInside,''),
    CookingOutside = NULLIF(@CookingOutside,''),
    CookingHours = NULLIF(@CookingHours,''),
    HealthFirewood = NULLIF(@HealthFirewood,''),
    WeeklyFirewood = NULLIF(@WeeklyFirewood,''),
    FirewoodHours = NULLIF(@FirewoodHours,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_energyinfrastructure.csv'
INTO TABLE inf_energyinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@ElectricServiceByElectricityGrid,@ExpandPlan,@BlackoutElectricityPerDay,@CurveOfDemand,@StreetLight,@DistanceToElectricityGrid)
SET ElectricServiceByElectricityGrid = NULLIF(@ElectricServiceByElectricityGrid,''),
    ExpandPlan = NULLIF(@ExpandPlan,''),
    BlackoutElectricityPerDay = NULLIF(@BlackoutElectricityPerDay,''),
    CurveOfDemand = NULLIF(@CurveOfDemand,''),
    StreetLight = NULLIF(@StreetLight,''),
    DistanceToElectricityGrid = NULLIF(@DistanceToElectricityGrid,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_expandplanbeneficiaries.csv'
INTO TABLE inf_expandplanbeneficiaries
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Beneficiary)
SET Beneficiary = NULLIF(@Beneficiary,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsource.csv'
INTO TABLE inf_generationsource
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Source)
SET Source = NULLIF(@Source,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsystem.csv'
INTO TABLE inf_generationsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@SystemType,@Capacity)
SET SystemType = NULLIF(@SystemType,''),
    Capacity = NULLIF(@Capacity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_kitchen.csv'
INTO TABLE inf_kitchen
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@MainKitchenType,@MainFuel,@FirewoodConsumption)
SET MainKitchenType = NULLIF(@MainKitchenType,''),
    MainFuel = NULLIF(@MainFuel,''),
    FirewoodConsumption = NULLIF(@FirewoodConsumption,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_landfill.csv'
INTO TABLE inf_landfill
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@DistanceToHouses,@DistanceToWaterResource,@FertilEnviromentLocation)
SET DistanceToHouses = NULLIF(@DistanceToHouses,''),
    DistanceToWaterResource = NULLIF(@DistanceToWaterResource,''),
    FertilEnviromentLocation = NULLIF(@FertilEnviromentLocation,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_lightingtech.csv'
INTO TABLE inf_lightingtech
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@TechType,@TechPower,@INF_PublicLighting_idINF_PublicLighting,@INF_PublicLighting_Community_idCommunity)
SET TechType = NULLIF(@TechType,''),
    TechPower = NULLIF(@TechPower,''),
    INF_PublicLighting_idINF_PublicLighting = NULLIF(@INF_PublicLighting_idINF_PublicLighting,''),
    INF_PublicLighting_Community_idCommunity = NULLIF(@INF_PublicLighting_Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilitypoint.csv'
INTO TABLE inf_mobilitypoint
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityway.csv'
INTO TABLE inf_mobilityway
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Way)
SET Way = NULLIF(@Way,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_publiclighting.csv'
INTO TABLE inf_publiclighting
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@StreetLightWorking,@LightPointsDistance,@InfluenceInWomensSafety)
SET StreetLightWorking = NULLIF(@StreetLightWorking,''),
    LightPointsDistance = NULLIF(@LightPointsDistance,''),
    InfluenceInWomensSafety = NULLIF(@InfluenceInWomensSafety,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_purificationsystem.csv'
INTO TABLE inf_purificationsystem
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationaccess.csv'
INTO TABLE inf_sanitationaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@OutdoorsLatrine,@latrineType)
SET OutdoorsLatrine = NULLIF(@OutdoorsLatrine,''),
    latrineType = NULLIF(@latrineType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationsystemquality.csv'
INTO TABLE inf_sanitationsystemquality
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@slab,@ventilated,@durableStructure,@wall_Roof,@door)
SET slab = NULLIF(@slab,''),
    ventilated = NULLIF(@ventilated,''),
    durableStructure = NULLIF(@durableStructure,''),
    wall_Roof = NULLIF(@wall_Roof,''),
    door = NULLIF(@door,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_streetlamp.csv'
INTO TABLE inf_streetlamp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_timespent.csv'
INTO TABLE inf_timespent
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@DailyTimeSpent,@INF_WaterInfrastructure_idINF_WaterInfrastructure,@INF_WaterInfrastructure_Community_idCommunity)
SET DailyTimeSpent = NULLIF(@DailyTimeSpent,''),
    INF_WaterInfrastructure_idINF_WaterInfrastructure = NULLIF(@INF_WaterInfrastructure_idINF_WaterInfrastructure,''),
    INF_WaterInfrastructure_Community_idCommunity = NULLIF(@INF_WaterInfrastructure_Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_wastemanagementginfrastructure.csv'
INTO TABLE inf_wastemanagementginfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@CollectionServicePerMonth)
SET CollectionServicePerMonth = NULLIF(@CollectionServicePerMonth,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_waterinfrastructure.csv'
INTO TABLE inf_waterinfrastructure
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@WaterQuality,@ConsumptionPerCapita,@SourceType)
SET WaterQuality = NULLIF(@WaterQuality,''),
    ConsumptionPerCapita = NULLIF(@ConsumptionPerCapita,''),
    SourceType = NULLIF(@SourceType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_waterpoint.csv'
INTO TABLE inf_waterpoint
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@Working)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,''),
    Working = NULLIF(@Working,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_app.csv'
INTO TABLE s_app
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@App)
SET App = NULLIF(@App,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_buildingquality.csv'
INTO TABLE s_buildingquality
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@NoFiltrationRoof,@SecureStructured,@ClimaticHazard,@ThermalConfort)
SET NoFiltrationRoof = NULLIF(@NoFiltrationRoof,''),
    SecureStructured = NULLIF(@SecureStructured,''),
    ClimaticHazard = NULLIF(@ClimaticHazard,''),
    ThermalConfort = NULLIF(@ThermalConfort,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_cementery.csv'
INTO TABLE s_cementery
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@Drainage,@UpperBound)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,''),
    Drainage = NULLIF(@Drainage,''),
    UpperBound = NULLIF(@UpperBound,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_dataaccess.csv'
INTO TABLE s_dataaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@DataType)
SET DataType = NULLIF(@DataType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_educationalcenter.csv'
INTO TABLE s_educationalcenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@EducationType,@Students,@Workingpoints,@Teachers,@Material,@TimeStart,@TimeFinish,@S_BuildingQuality_idS_BuildingQuality)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,''),
    EducationType = NULLIF(@EducationType,''),
    Students = NULLIF(@Students,''),
    Workingpoints = NULLIF(@Workingpoints,''),
    Teachers = NULLIF(@Teachers,''),
    Material = NULLIF(@Material,''),
    TimeStart = NULLIF(@TimeStart,''),
    TimeFinish = NULLIF(@TimeFinish,''),
    S_BuildingQuality_idS_BuildingQuality = NULLIF(@S_BuildingQuality_idS_BuildingQuality,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_hospital.csv'
INTO TABLE s_hospital
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@Beds,@NoAccessArea,@S_BuildingQuality_idS_BuildingQuality)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,''),
    Beds = NULLIF(@Beds,''),
    NoAccessArea = NULLIF(@NoAccessArea,''),
    S_BuildingQuality_idS_BuildingQuality = NULLIF(@S_BuildingQuality_idS_BuildingQuality,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_medicineaccess.csv'
INTO TABLE s_medicineaccess
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Access)
SET Access = NULLIF(@Access,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_noeducationcause.csv'
INTO TABLE s_noeducationcause
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Cause)
SET Cause = NULLIF(@Cause,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_othercenter.csv'
INTO TABLE s_othercenter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@CenterType,@CenterName,@NoAccessArea)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,''),
    CenterType = NULLIF(@CenterType,''),
    CenterName = NULLIF(@CenterName,''),
    NoAccessArea = NULLIF(@NoAccessArea,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_primaryattention.csv'
INTO TABLE s_primaryattention
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@NoAccesArea,@S_BuildingQuality_idS_BuildingQuality)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,''),
    NoAccesArea = NULLIF(@NoAccesArea,''),
    S_BuildingQuality_idS_BuildingQuality = NULLIF(@S_BuildingQuality_idS_BuildingQuality,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_repeaterantena.csv'
INTO TABLE s_repeaterantena
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Number)
SET Number = NULLIF(@Number,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_subject.csv'
INTO TABLE s_subject
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Subject)
SET Subject = NULLIF(@Subject,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_tecknowlege.csv'
INTO TABLE s_tecknowlege
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@knowlegeType)
SET knowlegeType = NULLIF(@knowlegeType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_cleaningmaterial.csv'
INTO TABLE se_cleaningmaterial
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Material)
SET Material = NULLIF(@Material,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_conflictarea.csv'
INTO TABLE se_conflictarea
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@place)
SET place = NULLIF(@place,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_economy.csv'
INTO TABLE se_economy
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@BasicBasketCost)
SET BasicBasketCost = NULLIF(@BasicBasketCost,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_expensetype.csv'
INTO TABLE se_expensetype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_householdcomposition.csv'
INTO TABLE se_householdcomposition
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Women,@Men,@Teenagers,@Kids)
SET Women = NULLIF(@Women,''),
    Men = NULLIF(@Men,''),
    Teenagers = NULLIF(@Teenagers,''),
    Kids = NULLIF(@Kids,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_incometype.csv'
INTO TABLE se_incometype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_personalhygiene.csv'
INTO TABLE se_personalhygiene
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@TimesPerWeek)
SET TimesPerWeek = NULLIF(@TimesPerWeek,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_population.csv'
INTO TABLE se_population
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@LT_5,@BT_5_17,@BT_18_59,@GT_59,@DiferentAbilitiesPeople)
SET LT_5 = NULLIF(@LT_5,''),
    BT_5_17 = NULLIF(@BT_5_17,''),
    BT_18_59 = NULLIF(@BT_18_59,''),
    GT_59 = NULLIF(@GT_59,''),
    DiferentAbilitiesPeople = NULLIF(@DiferentAbilitiesPeople,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_priority.csv'
INTO TABLE se_priority
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetycommittee.csv'
INTO TABLE se_safetycommittee
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@SafetyCommittee,@WomenPatrol)
SET SafetyCommittee = NULLIF(@SafetyCommittee,''),
    WomenPatrol = NULLIF(@WomenPatrol,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetylatrines.csv'
INTO TABLE se_safetylatrines
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@SeparatedBySex,@Light)
SET SeparatedBySex = NULLIF(@SeparatedBySex,''),
    Light = NULLIF(@Light,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetyplace.csv'
INTO TABLE se_safetyplace
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Place_Time)
SET Place_Time = NULLIF(@Place_Time,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_worktype.csv'
INTO TABLE se_worktype
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@WorkType)
SET WorkType = NULLIF(@WorkType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_building.csv'
INTO TABLE sh_building
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@ApropiateRoof,@SecureStructured,@ClimateThreatProtect,@WindowsAllRooms,@NoHumidity,@NoAnimals,@LT30Dregrees)
SET Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,''),
    ApropiateRoof = NULLIF(@ApropiateRoof,''),
    SecureStructured = NULLIF(@SecureStructured,''),
    ClimateThreatProtect = NULLIF(@ClimateThreatProtect,''),
    WindowsAllRooms = NULLIF(@WindowsAllRooms,''),
    NoHumidity = NULLIF(@NoHumidity,''),
    NoAnimals = NULLIF(@NoAnimals,''),
    LT30Dregrees = NULLIF(@LT30Dregrees,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_house.csv'
INTO TABLE sh_house
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@Rooms,@PosibleUpgrading)
SET Rooms = NULLIF(@Rooms,''),
    PosibleUpgrading = NULLIF(@PosibleUpgrading,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_shelter.csv'
INTO TABLE sh_shelter
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@TotalHouses,@ConstructionCost,@ConstructionType)
SET TotalHouses = NULLIF(@TotalHouses,''),
    ConstructionCost = NULLIF(@ConstructionCost,''),
    ConstructionType = NULLIF(@ConstructionType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_area.csv'
INTO TABLE u_area
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@AreaType)
SET AreaType = NULLIF(@AreaType,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_recreationalarea.csv'
INTO TABLE u_recreationalarea
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@AreaName,@Latitude,@Longitude,@Altitude,@Woodland_ShadedArea,@UrbanFurniture,@Floor_DrainageSystem,@PSTrush)
SET AreaName = NULLIF(@AreaName,''),
    Latitude = NULLIF(@Latitude,''),
    Longitude = NULLIF(@Longitude,''),
    Altitude = NULLIF(@Altitude,''),
    Woodland_ShadedArea = NULLIF(@Woodland_ShadedArea,''),
    UrbanFurniture = NULLIF(@UrbanFurniture,''),
    Floor_DrainageSystem = NULLIF(@Floor_DrainageSystem,''),
    PSTrush = NULLIF(@PSTrush,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_road.csv'
INTO TABLE u_road
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@RoadsLength,@DrainageSystem,@Conditioning)
SET RoadsLength = NULLIF(@RoadsLength,''),
    DrainageSystem = NULLIF(@DrainageSystem,''),
    Conditioning = NULLIF(@Conditioning,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_urbanism.csv'
INTO TABLE u_urbanism
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@UrbanPlan,@UrbanPlanDuratrion,@CampLimits,@LandManagement,@PlannedGrowth,@GrowthForecast,@UrbanPlanRiskInstruments,@RiskType,@AVG_PlotArea,@PlotDelimitation)
SET UrbanPlan = NULLIF(@UrbanPlan,''),
    UrbanPlanDuratrion = NULLIF(@UrbanPlanDuratrion,''),
    CampLimits = NULLIF(@CampLimits,''),
    LandManagement = NULLIF(@LandManagement,''),
    PlannedGrowth = NULLIF(@PlannedGrowth,''),
    GrowthForecast = NULLIF(@GrowthForecast,''),
    UrbanPlanRiskInstruments = NULLIF(@UrbanPlanRiskInstruments,''),
    RiskType = NULLIF(@RiskType,''),
    AVG_PlotArea = NULLIF(@AVG_PlotArea,''),
    PlotDelimitation = NULLIF(@PlotDelimitation,'');

UPDATE camp SET Community_idCommunity = (SELECT @CommunityID)
WHERE camp.Community_idCommunity = 0;

UPDATE camp_climaticregion SET Camp_idCamp = (SELECT @campID)
WHERE camp_climaticregion.Camp_idCamp = 0;

UPDATE camp_energysource_has_camp SET Camp_idCamp = (SELECT @campID)
WHERE camp_energysource_has_camp.Camp_idCamp = 0;

UPDATE camp_energysource_has_camp SET Camp_idCamp = (SELECT @campID)
WHERE camp_energysource_has_camp.Camp_idCamp = 0;

UPDATE camp_enviroment SET Camp_idCamp = (SELECT @campID)
WHERE camp_enviroment.Camp_idCamp = 0;

UPDATE camp_integration_has_camp SET Camp_idCamp = (SELECT @campID)
WHERE camp_integration_has_camp.Camp_idCamp = 0;

UPDATE camp_localcrop_has_camp SET Camp_idCamp = (SELECT @campID)
WHERE camp_localcrop_has_camp.Camp_idCamp = 0;

UPDATE camp_localvegetation_has_camp SET Camp_idCamp = (SELECT @campID)
WHERE camp_localvegetation_has_camp.Camp_idCamp = 0;

UPDATE camp_mobility SET Camp_idCamp = (SELECT @campID)
WHERE camp_mobility.Camp_idCamp = 0;

UPDATE camp_movementreason_has_camp SET Camp_idCamp = (SELECT @campID)
WHERE camp_movementreason_has_camp.Camp_idCamp = 0;

UPDATE camp_naturalhazard_has_camp SET Camp_idCamp = (SELECT @campID)
WHERE camp_naturalhazard_has_camp.Camp_idCamp = 0;

UPDATE camp_naturalhazard_has_camp SET Camp_idCamp = (SELECT @campID)
WHERE camp_naturalhazard_has_camp.Camp_idCamp = 0;

UPDATE camp_shelter SET Camp_idCamp = (SELECT @campID)
WHERE camp_shelter.Camp_idCamp = 0;

UPDATE country_has_camp SET Camp_idCamp = (SELECT @campID)
WHERE country_has_camp.Camp_idCamp = 0;

UPDATE fa_geographicidentification SET Community_idCommunity = (SELECT @CommunityID)
WHERE fa_geographicidentification.Community_idCommunity = 0;

UPDATE fa_naturalresource SET Community_idCommunity = (SELECT @CommunityID)
WHERE fa_naturalresource.Community_idCommunity = 0;

UPDATE fa_topography SET Community_idCommunity = (SELECT @CommunityID)
WHERE fa_topography.Community_idCommunity = 0;

UPDATE fs_cause SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_cause.Community_idCommunity = 0;

UPDATE fs_corralcropdata SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_corralcropdata.Community_idCommunity = 0;

UPDATE fs_corralubication_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_corralubication_has_community.Community_idCommunity = 0;

UPDATE fs_cropubication_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_cropubication_has_community.Community_idCommunity = 0;

UPDATE fs_cultivationseason SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_cultivationseason.Community_idCommunity = 0;

UPDATE fs_foodaccess_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_foodaccess_has_community.Community_idCommunity = 0;

UPDATE fs_foodaccess_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_foodaccess_has_community.Community_idCommunity = 0;

UPDATE fs_foodaccesscontinuity SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_foodaccesscontinuity.Community_idCommunity = 0;

UPDATE fs_foodsafety SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_foodsafety.Community_idCommunity = 0;

UPDATE fs_foodsource_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_foodsource_has_community.Community_idCommunity = 0;

UPDATE fs_foodsource_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_foodsource_has_community.Community_idCommunity = 0;

UPDATE fs_grainconservation SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_grainconservation.Community_idCommunity = 0;

UPDATE fs_grainmill SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_grainmill.Community_idCommunity = 0;

UPDATE fs_importantmeal_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_importantmeal_has_community.Community_idCommunity = 0;

UPDATE fs_importantmeal_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_importantmeal_has_community.Community_idCommunity = 0;

UPDATE fs_owncultivationfoodtype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_owncultivationfoodtype_has_community.Community_idCommunity = 0;

UPDATE fs_selfsufficiencyseason SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_selfsufficiencyseason.Community_idCommunity = 0;

UPDATE fs_timesperday_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_timesperday_has_community.Community_idCommunity = 0;

UPDATE fs_timesperday_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_timesperday_has_community.Community_idCommunity = 0;

UPDATE fs_typicalplate_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_typicalplate_has_community.Community_idCommunity = 0;

UPDATE fs_typicalplate_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE fs_typicalplate_has_community.Community_idCommunity = 0;

UPDATE g_politicalactor_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE g_politicalactor_has_community.Community_idCommunity = 0;

UPDATE g_publicpolitic SET Community_idCommunity = (SELECT @CommunityID)
WHERE g_publicpolitic.Community_idCommunity = 0;

UPDATE gd_demography SET Country_idCountry = (SELECT @CountryID)
WHERE gd_demography.Country_idCountry = 0;

UPDATE gd_economy SET Country_idCountry = (SELECT @CountryID)
WHERE gd_economy.Country_idCountry = 0;

UPDATE gd_electricgenerationmix SET Country_idCountry = (SELECT @CountryID)
WHERE gd_electricgenerationmix.Country_idCountry = 0;

UPDATE gd_ethnicgroup_has_country SET Country_idCountry = (SELECT @CountryID)
WHERE gd_ethnicgroup_has_country.Country_idCountry = 0;

UPDATE gd_government SET Country_idCountry = (SELECT @CountryID)
WHERE gd_government.Country_idCountry = 0;

UPDATE gd_infrastructure SET Country_idCountry = (SELECT @CountryID)
WHERE gd_infrastructure.Country_idCountry = 0;

UPDATE gd_language_has_country SET Country_idCountry = (SELECT @CountryID)
WHERE gd_language_has_country.Country_idCountry = 0;

UPDATE gd_religion_has_country SET Country_idCountry = (SELECT @CountryID)
WHERE gd_religion_has_country.Country_idCountry = 0;

UPDATE gd_serviceaccess SET Country_idCountry = (SELECT @CountryID)
WHERE gd_serviceaccess.Country_idCountry = 0;

UPDATE gd_shelter SET Country_idCountry = (SELECT @CountryID)
WHERE gd_shelter.Country_idCountry = 0;

UPDATE gd_urbanism SET Country_idCountry = (SELECT @CountryID)
WHERE gd_urbanism.Country_idCountry = 0;

UPDATE hostcommunity SET Community_idCommunity = (SELECT @CommunityID)
WHERE hostcommunity.Community_idCommunity = 0;

UPDATE hostcommunity SET Community_idCommunity = (SELECT @CommunityID)
WHERE hostcommunity.Community_idCommunity = 0;

UPDATE hostcommunity SET Country_idCountry = (SELECT @CountryID)
WHERE hostcommunity.Country_idCountry = 0;

UPDATE hostcommunity_has_camp SET Camp_idCamp = (SELECT @campID)
WHERE hostcommunity_has_camp.Camp_idCamp = 0;

UPDATE inf_appliance_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_appliance_has_community.Community_idCommunity = 0;

UPDATE inf_appliance_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_appliance_has_community.Community_idCommunity = 0;

UPDATE inf_appliance_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_appliance_has_community.Community_idCommunity = 0;

UPDATE inf_collectionpoints SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_collectionpoints.Community_idCommunity = 0;

UPDATE inf_cookwoman SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_cookwoman.Community_idCommunity = 0;

UPDATE inf_energyinfrastructure SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_energyinfrastructure.Community_idCommunity = 0;

UPDATE inf_generationsource_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_generationsource_has_community.Community_idCommunity = 0;

UPDATE inf_generationsource_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_generationsource_has_community.Community_idCommunity = 0;

UPDATE inf_generationsource_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_generationsource_has_community.Community_idCommunity = 0;

UPDATE inf_generationsource_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_generationsource_has_community.Community_idCommunity = 0;

UPDATE inf_generationsource_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_generationsource_has_community.Community_idCommunity = 0;

UPDATE inf_generationsystem SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_generationsystem.Community_idCommunity = 0;

UPDATE inf_irrigationsystem_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_irrigationsystem_has_community.Community_idCommunity = 0;

UPDATE inf_kitchen SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_kitchen.Community_idCommunity = 0;

UPDATE inf_landfill SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_landfill.Community_idCommunity = 0;

UPDATE inf_mobilityinfrastructure SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_mobilityinfrastructure.Community_idCommunity = 0;

UPDATE inf_mobilitypoint SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_mobilitypoint.Community_idCommunity = 0;

UPDATE inf_mobilityway_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_mobilityway_has_community.Community_idCommunity = 0;

UPDATE inf_mobilityway_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_mobilityway_has_community.Community_idCommunity = 0;

UPDATE inf_potabilizationsystem_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_potabilizationsystem_has_community.Community_idCommunity = 0;

UPDATE inf_publiclighting SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_publiclighting.Community_idCommunity = 0;

UPDATE inf_sanitationaccess SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_sanitationaccess.Community_idCommunity = 0;

UPDATE inf_sanitationsystemquality_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_sanitationsystemquality_has_community.Community_idCommunity = 0;

UPDATE inf_streetlamp SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_streetlamp.Community_idCommunity = 0;

UPDATE inf_wastemanagementginfrastructure SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_wastemanagementginfrastructure.Community_idCommunity = 0;

UPDATE inf_waterinfrastructure SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_waterinfrastructure.Community_idCommunity = 0;

UPDATE inf_waterpoint SET Community_idCommunity = (SELECT @CommunityID)
WHERE inf_waterpoint.Community_idCommunity = 0;

UPDATE s_app_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_app_has_community.Community_idCommunity = 0;

UPDATE s_app_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_app_has_community.Community_idCommunity = 0;

UPDATE s_cementery_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_cementery_has_community.Community_idCommunity = 0;

UPDATE s_dataaccess_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_dataaccess_has_community.Community_idCommunity = 0;

UPDATE s_educationalcenter_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_educationalcenter_has_community.Community_idCommunity = 0;

UPDATE s_healthcenterservice SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_healthcenterservice.Community_idCommunity = 0;

UPDATE s_hospital_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_hospital_has_community.Community_idCommunity = 0;

UPDATE s_medicineaccess SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_medicineaccess.Community_idCommunity = 0;

UPDATE s_noeducationcause_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_noeducationcause_has_community.Community_idCommunity = 0;

UPDATE s_othercenter_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_othercenter_has_community.Community_idCommunity = 0;

UPDATE s_primaryattention_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_primaryattention_has_community.Community_idCommunity = 0;

UPDATE s_repeaterantena SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_repeaterantena.Community_idCommunity = 0;

UPDATE s_tecknowlege_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_tecknowlege_has_community.Community_idCommunity = 0;

UPDATE s_tecknowlege_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE s_tecknowlege_has_community.Community_idCommunity = 0;

UPDATE se_cleaningmaterial_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_cleaningmaterial_has_community.Community_idCommunity = 0;

UPDATE se_conflictarea_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_conflictarea_has_community.Community_idCommunity = 0;

UPDATE se_economy SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_economy.Community_idCommunity = 0;

UPDATE se_expensetype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_expensetype_has_community.Community_idCommunity = 0;

UPDATE se_expensetype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_expensetype_has_community.Community_idCommunity = 0;

UPDATE se_expensetype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_expensetype_has_community.Community_idCommunity = 0;

UPDATE se_householdcomposition SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_householdcomposition.Community_idCommunity = 0;

UPDATE se_incometype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_incometype_has_community.Community_idCommunity = 0;

UPDATE se_incometype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_incometype_has_community.Community_idCommunity = 0;

UPDATE se_incometype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_incometype_has_community.Community_idCommunity = 0;

UPDATE se_personalhygiene SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_personalhygiene.Community_idCommunity = 0;

UPDATE se_population SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_population.Community_idCommunity = 0;

UPDATE se_priority_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_priority_has_community.Community_idCommunity = 0;

UPDATE se_priority_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_priority_has_community.Community_idCommunity = 0;

UPDATE se_priority_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_priority_has_community.Community_idCommunity = 0;

UPDATE se_safetycommittee SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_safetycommittee.Community_idCommunity = 0;

UPDATE se_safetylatrines SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_safetylatrines.Community_idCommunity = 0;

UPDATE se_safetyplace_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_safetyplace_has_community.Community_idCommunity = 0;

UPDATE se_safetyplace_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_safetyplace_has_community.Community_idCommunity = 0;

UPDATE se_worktype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_worktype_has_community.Community_idCommunity = 0;

UPDATE se_worktype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_worktype_has_community.Community_idCommunity = 0;

UPDATE se_worktype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_worktype_has_community.Community_idCommunity = 0;

UPDATE se_worktype_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE se_worktype_has_community.Community_idCommunity = 0;

UPDATE sh_building SET Community_idCommunity = (SELECT @CommunityID)
WHERE sh_building.Community_idCommunity = 0;

UPDATE sh_house SET Community_idCommunity = (SELECT @CommunityID)
WHERE sh_house.Community_idCommunity = 0;

UPDATE sh_shelter SET Community_idCommunity = (SELECT @CommunityID)
WHERE sh_shelter.Community_idCommunity = 0;

UPDATE u_area_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE u_area_has_community.Community_idCommunity = 0;

UPDATE u_area_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE u_area_has_community.Community_idCommunity = 0;

UPDATE u_area_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE u_area_has_community.Community_idCommunity = 0;

UPDATE u_area_has_community SET Community_idCommunity = (SELECT @CommunityID)
WHERE u_area_has_community.Community_idCommunity = 0;

UPDATE u_landuse SET Community_idCommunity = (SELECT @CommunityID)
WHERE u_landuse.Community_idCommunity = 0;

UPDATE u_publicspace SET Community_idCommunity = (SELECT @CommunityID)
WHERE u_publicspace.Community_idCommunity = 0;

UPDATE u_recreationalarea SET Community_idCommunity = (SELECT @CommunityID)
WHERE u_recreationalarea.Community_idCommunity = 0;

UPDATE u_road SET Community_idCommunity = (SELECT @CommunityID)
WHERE u_road.Community_idCommunity = 0;

UPDATE u_urbanism SET Community_idCommunity = (SELECT @CommunityID)
WHERE u_urbanism.Community_idCommunity = 0;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_SAFE_UPDATES = 1;

