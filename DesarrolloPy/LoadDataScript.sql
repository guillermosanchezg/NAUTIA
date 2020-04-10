SET FOREIGN_KEY_CHECKS = 0;
SET SQL_SAFE_UPDATES = 0;
SET sql_mode='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/community.csv'
INTO TABLE community
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Name)
SET Name = NULLIF(@Name,'');
SET @CommunityID = (SELECT idCommunity FROM community ORDER BY idCommunity DESC LIMIT 1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp.csv'
INTO TABLE camp
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@StabilisationDate,@MigrationRate)
SET StabilisationDate = NULLIF(@StabilisationDate,''),
    MigrationRate = NULLIF(@MigrationRate,'');
SET @campID = (SELECT idCamp FROM camp ORDER BY idCamp DESC LIMIT 1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/Country.csv'
INTO TABLE Country
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@CountryName)
SET CountryName = NULLIF(@CountryName,'');
SET @CountryID = (SELECT idCountry FROM Country ORDER BY idCountry DESC LIMIT 1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_climaticregion.csv'
INTO TABLE camp_climaticregion
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Region,@MaxTemp,@MinTemp,@AVGTemp,@RelativeHumidity,@MaxRainfall,@MinRainfall,@Irradiance,@WindSpeed)
SET Region = NULLIF(@Region,-1),
    MaxTemp = NULLIF(@MaxTemp,-1),
    MinTemp = NULLIF(@MinTemp,-1),
    AVGTemp = NULLIF(@AVGTemp,-1),
    RelativeHumidity = NULLIF(@RelativeHumidity,-1),
    MaxRainfall = NULLIF(@MaxRainfall,-1),
    MinRainfall = NULLIF(@MinRainfall,-1),
    Irradiance = NULLIF(@Irradiance,-1),
    WindSpeed = NULLIF(@WindSpeed,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_energysource.csv'
INTO TABLE camp_energysource
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Source)
SET Source = NULLIF(@Source,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_enviroment.csv'
INTO TABLE camp_enviroment
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@EnviromentValueArea,@DeforestedArea)
SET EnviromentValueArea = NULLIF(@EnviromentValueArea,-1),
    DeforestedArea = NULLIF(@DeforestedArea,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_integration.csv'
INTO TABLE camp_integration
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@RelationshipCause)
SET RelationshipCause = NULLIF(@RelationshipCause,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localcrop.csv'
INTO TABLE camp_localcrop
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_localvegetation.csv'
INTO TABLE camp_localvegetation
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Species)
SET Species = NULLIF(@Species,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_mobility.csv'
INTO TABLE camp_mobility
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@ConstentOutCamp,@MaxDistance)
SET ConstentOutCamp = NULLIF(@ConstentOutCamp,-1),
    MaxDistance = NULLIF(@MaxDistance,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_movementreason.csv'
INTO TABLE camp_movementreason
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Reason)
SET Reason = NULLIF(@Reason,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_naturalhazard.csv'
INTO TABLE camp_naturalhazard
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@HazardType)
SET HazardType = NULLIF(@HazardType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/camp_shelter.csv'
INTO TABLE camp_shelter
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@UpgradingPosibility)
SET UpgradingPosibility = NULLIF(@UpgradingPosibility,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_language.csv'
INTO TABLE comun_language
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Language)
SET Language = NULLIF(@Language,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/comun_religion.csv'
INTO TABLE comun_religion
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Religion)
SET Religion = NULLIF(@Religion,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_geographicidentification.csv'
INTO TABLE fa_geographicidentification
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@PhreaticLevel,@Area)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    PhreaticLevel = NULLIF(@PhreaticLevel,-1),
    Area = NULLIF(@Area,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_naturalresource.csv'
INTO TABLE fa_naturalresource
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Type,@Bound)
SET Type = NULLIF(@Type,-1),
    Bound = NULLIF(@Bound,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fa_topography.csv'
INTO TABLE fa_topography
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@UpperBound,@LowerBound)
SET UpperBound = NULLIF(@UpperBound,-1),
    LowerBound = NULLIF(@LowerBound,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cause.csv'
INTO TABLE fs_cause
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Cause)
SET Cause = NULLIF(@Cause,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralcropdata.csv'
INTO TABLE fs_corralcropdata
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@PastoralismTechnique,@FertilizationSystem)
SET PastoralismTechnique = NULLIF(@PastoralismTechnique,-1),
    FertilizationSystem = NULLIF(@FertilizationSystem,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralubication.csv'
INTO TABLE fs_corralubication
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@Type,@DrainageSystem)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1),
    Type = NULLIF(@Type,-1),
    DrainageSystem = NULLIF(@DrainageSystem,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cropubication.csv'
INTO TABLE fs_cropubication
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@Type,@IrrigationSystem)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1),
    Type = NULLIF(@Type,-1),
    IrrigationSystem = NULLIF(@IrrigationSystem,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cultivationseason.csv'
INTO TABLE fs_cultivationseason
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@january,@february,@march,@april,@may,@june,@july,@august,@september,@octuber,@november,@december)
SET january = NULLIF(@january,-1),
    february = NULLIF(@february,-1),
    march = NULLIF(@march,-1),
    april = NULLIF(@april,-1),
    may = NULLIF(@may,-1),
    june = NULLIF(@june,-1),
    july = NULLIF(@july,-1),
    august = NULLIF(@august,-1),
    september = NULLIF(@september,-1),
    octuber = NULLIF(@octuber,-1),
    november = NULLIF(@november,-1),
    december = NULLIF(@december,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccess.csv'
INTO TABLE fs_foodaccess
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@FoodType)
SET FoodType = NULLIF(@FoodType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccesscontinuity.csv'
INTO TABLE fs_foodaccesscontinuity
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@NoProcessedFoodDuration,@FoodConservationTec)
SET NoProcessedFoodDuration = NULLIF(@NoProcessedFoodDuration,-1),
    FoodConservationTec = NULLIF(@FoodConservationTec,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsafety.csv'
INTO TABLE fs_foodsafety
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@kids,@women,@men,@senior,@intake)
SET kids = NULLIF(@kids,-1),
    women = NULLIF(@women,-1),
    men = NULLIF(@men,-1),
    senior = NULLIF(@senior,-1),
    intake = NULLIF(@intake,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsource.csv'
INTO TABLE fs_foodsource
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Source,@NumberPeople)
SET Source = NULLIF(@Source,-1),
    NumberPeople = NULLIF(@NumberPeople,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_grainconservation.csv'
INTO TABLE fs_grainconservation
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@ConservationTec)
SET ConservationTec = NULLIF(@ConservationTec,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_grainmill.csv'
INTO TABLE fs_grainmill
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@EnginePower,@Operative,@GoodUbication)
SET EnginePower = NULLIF(@EnginePower,-1),
    Operative = NULLIF(@Operative,-1),
    GoodUbication = NULLIF(@GoodUbication,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_importantmeal.csv'
INTO TABLE fs_importantmeal
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@meal,@numberPeople)
SET meal = NULLIF(@meal,-1),
    numberPeople = NULLIF(@numberPeople,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_owncultivationfoodtype.csv'
INTO TABLE fs_owncultivationfoodtype
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_selfsufficiencyseason.csv'
INTO TABLE fs_selfsufficiencyseason
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@january,@february,@march,@april,@may,@june,@july,@august,@september,@octuber,@november,@december)
SET january = NULLIF(@january,-1),
    february = NULLIF(@february,-1),
    march = NULLIF(@march,-1),
    april = NULLIF(@april,-1),
    may = NULLIF(@may,-1),
    june = NULLIF(@june,-1),
    july = NULLIF(@july,-1),
    august = NULLIF(@august,-1),
    september = NULLIF(@september,-1),
    octuber = NULLIF(@octuber,-1),
    november = NULLIF(@november,-1),
    december = NULLIF(@december,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_timesperday.csv'
INTO TABLE fs_timesperday
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@times,@numberPeople)
SET times = NULLIF(@times,-1),
    numberPeople = NULLIF(@numberPeople,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_typicalplate.csv'
INTO TABLE fs_typicalplate
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Plate,@Kcal_100g)
SET Plate = NULLIF(@Plate,-1),
    Kcal_100g = NULLIF(@Kcal_100g,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_politicalactor.csv'
INTO TABLE g_politicalactor
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@ActorName,@ActorType)
SET ActorName = NULLIF(@ActorName,-1),
    ActorType = NULLIF(@ActorType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_publicpolitic.csv'
INTO TABLE g_publicpolitic
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@DocumentTittle,@Path)
SET DocumentTittle = NULLIF(@DocumentTittle,-1),
    Path = NULLIF(@Path,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_demography.csv'
INTO TABLE gd_demography
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Female_LT_5,@Male_LT_5,@Female_BT_5_17,@Male_BT_5_17,@Female_BT_18_59,@Male_BT_18_59,@Female_GT_59,@Male_GT_59,@GrowthRate,@RefugeePopulation,@IDH,@LifeExpectancy)
SET Female_LT_5 = NULLIF(@Female_LT_5,-1),
    Male_LT_5 = NULLIF(@Male_LT_5,-1),
    Female_BT_5_17 = NULLIF(@Female_BT_5_17,-1),
    Male_BT_5_17 = NULLIF(@Male_BT_5_17,-1),
    Female_BT_18_59 = NULLIF(@Female_BT_18_59,-1),
    Male_BT_18_59 = NULLIF(@Male_BT_18_59,-1),
    Female_GT_59 = NULLIF(@Female_GT_59,-1),
    Male_GT_59 = NULLIF(@Male_GT_59,-1),
    GrowthRate = NULLIF(@GrowthRate,-1),
    RefugeePopulation = NULLIF(@RefugeePopulation,-1),
    IDH = NULLIF(@IDH,-1),
    LifeExpectancy = NULLIF(@LifeExpectancy,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_economy.csv'
INTO TABLE gd_economy
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Farming,@CattelRaising,@Industry,@ServiceSector,@PovertyPopulation,@GINI,@GDPPerCapita,@PovertyLine,@LocalCoin,@ExchangeRate)
SET Farming = NULLIF(@Farming,-1),
    CattelRaising = NULLIF(@CattelRaising,-1),
    Industry = NULLIF(@Industry,-1),
    ServiceSector = NULLIF(@ServiceSector,-1),
    PovertyPopulation = NULLIF(@PovertyPopulation,-1),
    GINI = NULLIF(@GINI,-1),
    GDPPerCapita = NULLIF(@GDPPerCapita,-1),
    PovertyLine = NULLIF(@PovertyLine,-1),
    LocalCoin = NULLIF(@LocalCoin,-1),
    ExchangeRate = NULLIF(@ExchangeRate,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_electricgenerationmix.csv'
INTO TABLE gd_electricgenerationmix
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Hydro,@Diesel,@Gas,@Coal,@Fotovoltaic,@Wind,@Biofuel)
SET Hydro = NULLIF(@Hydro,-1),
    Diesel = NULLIF(@Diesel,-1),
    Gas = NULLIF(@Gas,-1),
    Coal = NULLIF(@Coal,-1),
    Fotovoltaic = NULLIF(@Fotovoltaic,-1),
    Wind = NULLIF(@Wind,-1),
    Biofuel = NULLIF(@Biofuel,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_ethnicgroup.csv'
INTO TABLE gd_ethnicgroup
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@EthnicGroup)
SET EthnicGroup = NULLIF(@EthnicGroup,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_government.csv'
INTO TABLE gd_government
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@RegimeType)
SET RegimeType = NULLIF(@RegimeType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_infrastructure.csv'
INTO TABLE gd_infrastructure
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@RuralWaterAccess,@UrbanWaterAccess,@RuralSanitationAccess,@UrbanSanitationAccess,@RuralElectricityAccess,@UrbanElectricityAccess,@NationalElectricityTariff)
SET RuralWaterAccess = NULLIF(@RuralWaterAccess,-1),
    UrbanWaterAccess = NULLIF(@UrbanWaterAccess,-1),
    RuralSanitationAccess = NULLIF(@RuralSanitationAccess,-1),
    UrbanSanitationAccess = NULLIF(@UrbanSanitationAccess,-1),
    RuralElectricityAccess = NULLIF(@RuralElectricityAccess,-1),
    UrbanElectricityAccess = NULLIF(@UrbanElectricityAccess,-1),
    NationalElectricityTariff = NULLIF(@NationalElectricityTariff,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_serviceaccess.csv'
INTO TABLE gd_serviceaccess
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@IlliteracyRate,@InternetAccessRate)
SET IlliteracyRate = NULLIF(@IlliteracyRate,-1),
    InternetAccessRate = NULLIF(@InternetAccessRate,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_shelter.csv'
INTO TABLE gd_shelter
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@PeopleInSlum)
SET PeopleInSlum = NULLIF(@PeopleInSlum,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_urbanism.csv'
INTO TABLE gd_urbanism
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@UrbanPopulation,@RuralPopulation,@UrbanDensity,@RuralDensity)
SET UrbanPopulation = NULLIF(@UrbanPopulation,-1),
    RuralPopulation = NULLIF(@RuralPopulation,-1),
    UrbanDensity = NULLIF(@UrbanDensity,-1),
    RuralDensity = NULLIF(@RuralDensity,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/hostcommunity.csv'
INTO TABLE hostcommunity
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (SET LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_appliance.csv'
INTO TABLE inf_appliance
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@ApplianceType)
SET ApplianceType = NULLIF(@ApplianceType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_colletionpoints.csv'
INTO TABLE inf_colletionpoints
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_cookwoman.csv'
INTO TABLE inf_cookwoman
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@CookingInside,@CookingOutside,@CookingHours,@HealthFirewood,@WeeklyFirewood,@FirewoodHours)
SET CookingInside = NULLIF(@CookingInside,-1),
    CookingOutside = NULLIF(@CookingOutside,-1),
    CookingHours = NULLIF(@CookingHours,-1),
    HealthFirewood = NULLIF(@HealthFirewood,-1),
    WeeklyFirewood = NULLIF(@WeeklyFirewood,-1),
    FirewoodHours = NULLIF(@FirewoodHours,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_energyinfrastructure.csv'
INTO TABLE inf_energyinfrastructure
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@ElectricServiceByElectricityGrid,@ExpandPlan,@BlackoutElectricityPerDay,@CurveOfDemand,@StreetLight,@DistanceToElectricityGrid)
SET ElectricServiceByElectricityGrid = NULLIF(@ElectricServiceByElectricityGrid,-1),
    ExpandPlan = NULLIF(@ExpandPlan,-1),
    BlackoutElectricityPerDay = NULLIF(@BlackoutElectricityPerDay,-1),
    CurveOfDemand = NULLIF(@CurveOfDemand,-1),
    StreetLight = NULLIF(@StreetLight,-1),
    DistanceToElectricityGrid = NULLIF(@DistanceToElectricityGrid,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_expandplanbeneficiaries.csv'
INTO TABLE inf_expandplanbeneficiaries
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Beneficiary)
SET Beneficiary = NULLIF(@Beneficiary,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsource.csv'
INTO TABLE inf_generationsource
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Source)
SET Source = NULLIF(@Source,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsystem.csv'
INTO TABLE inf_generationsystem
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@SystemType,@Capacity)
SET SystemType = NULLIF(@SystemType,-1),
    Capacity = NULLIF(@Capacity,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_irrigatonsystem.csv'
INTO TABLE inf_irrigatonsystem
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Operating,@WaterPumpPower,@EnergySource)
SET Operating = NULLIF(@Operating,-1),
    WaterPumpPower = NULLIF(@WaterPumpPower,-1),
    EnergySource = NULLIF(@EnergySource,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_kitchen.csv'
INTO TABLE inf_kitchen
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@MainKitchenType,@MainFuel,@FirewoodConsumption)
SET MainKitchenType = NULLIF(@MainKitchenType,-1),
    MainFuel = NULLIF(@MainFuel,-1),
    FirewoodConsumption = NULLIF(@FirewoodConsumption,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_landfill.csv'
INTO TABLE inf_landfill
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@DistanceToHouses,@DistanceToWaterResource,@FertilEnviromentLocation)
SET DistanceToHouses = NULLIF(@DistanceToHouses,-1),
    DistanceToWaterResource = NULLIF(@DistanceToWaterResource,-1),
    FertilEnviromentLocation = NULLIF(@FertilEnviromentLocation,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_lightingtech.csv'
INTO TABLE inf_lightingtech
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@TechType,@TechPower,@INF_PublicLighting_idINF_PublicLighting,@INF_PublicLighting_Community_idCommunity)
SET TechType = NULLIF(@TechType,-1),
    TechPower = NULLIF(@TechPower,-1),
    INF_PublicLighting_idINF_PublicLighting = NULLIF(@INF_PublicLighting_idINF_PublicLighting,-1),
    INF_PublicLighting_Community_idCommunity = NULLIF(@INF_PublicLighting_Community_idCommunity,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityinfrastructure.csv'
INTO TABLE inf_mobilityinfrastructure
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@DistanceToWorkstation)
SET DistanceToWorkstation = NULLIF(@DistanceToWorkstation,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityway.csv'
INTO TABLE inf_mobilityway
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Way)
SET Way = NULLIF(@Way,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobillitypoint.csv'
INTO TABLE inf_mobillitypoint
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_potabilizationsystem.csv'
INTO TABLE inf_potabilizationsystem
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_publiclighting.csv'
INTO TABLE inf_publiclighting
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@StreetLightWorking,@LightPointsDistance,@InfluenceInWomensSafety)
SET StreetLightWorking = NULLIF(@StreetLightWorking,-1),
    LightPointsDistance = NULLIF(@LightPointsDistance,-1),
    InfluenceInWomensSafety = NULLIF(@InfluenceInWomensSafety,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationaccess.csv'
INTO TABLE inf_sanitationaccess
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@OutdoorsLatrine,@latrineType)
SET OutdoorsLatrine = NULLIF(@OutdoorsLatrine,-1),
    latrineType = NULLIF(@latrineType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationsystemquality.csv'
INTO TABLE inf_sanitationsystemquality
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@slab,@ventilated,@durableStructure,@wall_Roof,@door)
SET slab = NULLIF(@slab,-1),
    ventilated = NULLIF(@ventilated,-1),
    durableStructure = NULLIF(@durableStructure,-1),
    wall_Roof = NULLIF(@wall_Roof,-1),
    door = NULLIF(@door,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_streetlamp.csv'
INTO TABLE inf_streetlamp
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_timespent.csv'
INTO TABLE inf_timespent
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@DailyTimeSpent,@INF_WaterInfrastructure_idINF_WaterInfrastructure,@INF_WaterInfrastructure_Community_idCommunity)
SET DailyTimeSpent = NULLIF(@DailyTimeSpent,-1),
    INF_WaterInfrastructure_idINF_WaterInfrastructure = NULLIF(@INF_WaterInfrastructure_idINF_WaterInfrastructure,-1),
    INF_WaterInfrastructure_Community_idCommunity = NULLIF(@INF_WaterInfrastructure_Community_idCommunity,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_wastemanagementginfrastructure.csv'
INTO TABLE inf_wastemanagementginfrastructure
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@CollectionServicePerMonth)
SET CollectionServicePerMonth = NULLIF(@CollectionServicePerMonth,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_waterinfrastructure.csv'
INTO TABLE inf_waterinfrastructure
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@WaterQuality,@ConsumptionPerCapita,@SourceType)
SET WaterQuality = NULLIF(@WaterQuality,-1),
    ConsumptionPerCapita = NULLIF(@ConsumptionPerCapita,-1),
    SourceType = NULLIF(@SourceType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_waterpoint.csv'
INTO TABLE inf_waterpoint
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@Working)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1),
    Working = NULLIF(@Working,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_womensafety.csv'
INTO TABLE inf_womensafety
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Influence,@INF_PublicLighting_idINF_PublicLighting,@INF_PublicLighting_Community_idCommunity)
SET Influence = NULLIF(@Influence,-1),
    INF_PublicLighting_idINF_PublicLighting = NULLIF(@INF_PublicLighting_idINF_PublicLighting,-1),
    INF_PublicLighting_Community_idCommunity = NULLIF(@INF_PublicLighting_Community_idCommunity,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_app.csv'
INTO TABLE s_app
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@App)
SET App = NULLIF(@App,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_buildingquality.csv'
INTO TABLE s_buildingquality
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@NoFiltrationRoof,@SecureStructured,@ClimaticHazard,@ThermalConfort)
SET NoFiltrationRoof = NULLIF(@NoFiltrationRoof,-1),
    SecureStructured = NULLIF(@SecureStructured,-1),
    ClimaticHazard = NULLIF(@ClimaticHazard,-1),
    ThermalConfort = NULLIF(@ThermalConfort,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_cementery.csv'
INTO TABLE s_cementery
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@Drainage,@UpperBound,@NoAccessArea)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1),
    Drainage = NULLIF(@Drainage,-1),
    UpperBound = NULLIF(@UpperBound,-1),
    NoAccessArea = NULLIF(@NoAccessArea,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_dataaccess.csv'
INTO TABLE s_dataaccess
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@DataType)
SET DataType = NULLIF(@DataType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_educationalcenter.csv'
INTO TABLE s_educationalcenter
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@EducationType,@Students,@Workingpoints,@Teachers,@Material,@TimeStart,@TimeFinish,@S_BuildingQuality_idS_BuildingQuality)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1),
    EducationType = NULLIF(@EducationType,-1),
    Students = NULLIF(@Students,-1),
    Workingpoints = NULLIF(@Workingpoints,-1),
    Teachers = NULLIF(@Teachers,-1),
    Material = NULLIF(@Material,-1),
    TimeStart = NULLIF(@TimeStart,-1),
    TimeFinish = NULLIF(@TimeFinish,-1),
    S_BuildingQuality_idS_BuildingQuality = NULLIF(@S_BuildingQuality_idS_BuildingQuality,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_healthcenterservice.csv'
INTO TABLE s_healthcenterservice
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@PrimaryAttention2kms,@Hospital5kms)
SET PrimaryAttention2kms = NULLIF(@PrimaryAttention2kms,-1),
    Hospital5kms = NULLIF(@Hospital5kms,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_hospital.csv'
INTO TABLE s_hospital
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@Beds,@NoAccessArea,@S_BuildingQuality_idS_BuildingQuality)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1),
    Beds = NULLIF(@Beds,-1),
    NoAccessArea = NULLIF(@NoAccessArea,-1),
    S_BuildingQuality_idS_BuildingQuality = NULLIF(@S_BuildingQuality_idS_BuildingQuality,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_medicineaccess.csv'
INTO TABLE s_medicineaccess
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Access)
SET Access = NULLIF(@Access,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_noeducationcause.csv'
INTO TABLE s_noeducationcause
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Cause)
SET Cause = NULLIF(@Cause,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_othercenter.csv'
INTO TABLE s_othercenter
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@CenterType,@CenterName,@NoAccessArea)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1),
    CenterType = NULLIF(@CenterType,-1),
    CenterName = NULLIF(@CenterName,-1),
    NoAccessArea = NULLIF(@NoAccessArea,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_primaryattention.csv'
INTO TABLE s_primaryattention
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@NoAccesArea,@S_BuildingQuality_idS_BuildingQuality)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1),
    NoAccesArea = NULLIF(@NoAccesArea,-1),
    S_BuildingQuality_idS_BuildingQuality = NULLIF(@S_BuildingQuality_idS_BuildingQuality,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_repeaterantena.csv'
INTO TABLE s_repeaterantena
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Number)
SET Number = NULLIF(@Number,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_subject.csv'
INTO TABLE s_subject
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Subject)
SET Subject = NULLIF(@Subject,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_tecknowlege.csv'
INTO TABLE s_tecknowlege
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@knowlegeType)
SET knowlegeType = NULLIF(@knowlegeType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_cleaningmaterial.csv'
INTO TABLE se_cleaningmaterial
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Material)
SET Material = NULLIF(@Material,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_conflictarea.csv'
INTO TABLE se_conflictarea
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_economy.csv'
INTO TABLE se_economy
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@BasicBasketCost)
SET BasicBasketCost = NULLIF(@BasicBasketCost,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_expensetype.csv'
INTO TABLE se_expensetype
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_genderdata.csv'
INTO TABLE se_genderdata
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@LeadingWomen)
SET LeadingWomen = NULLIF(@LeadingWomen,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_householdcomposition.csv'
INTO TABLE se_householdcomposition
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Women,@Men,@Teenagers,@Kids)
SET Women = NULLIF(@Women,-1),
    Men = NULLIF(@Men,-1),
    Teenagers = NULLIF(@Teenagers,-1),
    Kids = NULLIF(@Kids,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_incometype.csv'
INTO TABLE se_incometype
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_personalhygiene.csv'
INTO TABLE se_personalhygiene
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@TimesPerWeek)
SET TimesPerWeek = NULLIF(@TimesPerWeek,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_population.csv'
INTO TABLE se_population
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@LT_5,@BT_5_17,@BT_18_59,@GT_59,@DiferentAbilitiesPeople)
SET LT_5 = NULLIF(@LT_5,-1),
    BT_5_17 = NULLIF(@BT_5_17,-1),
    BT_18_59 = NULLIF(@BT_18_59,-1),
    GT_59 = NULLIF(@GT_59,-1),
    DiferentAbilitiesPeople = NULLIF(@DiferentAbilitiesPeople,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_priority.csv'
INTO TABLE se_priority
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Type)
SET Type = NULLIF(@Type,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetycommittee.csv'
INTO TABLE se_safetycommittee
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@SafetyCommittee,@WomenPatrol)
SET SafetyCommittee = NULLIF(@SafetyCommittee,-1),
    WomenPatrol = NULLIF(@WomenPatrol,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetylatrines.csv'
INTO TABLE se_safetylatrines
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@SeparatedBySex,@Light)
SET SeparatedBySex = NULLIF(@SeparatedBySex,-1),
    Light = NULLIF(@Light,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetyplace.csv'
INTO TABLE se_safetyplace
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Place_Time)
SET Place_Time = NULLIF(@Place_Time,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_worktype.csv'
INTO TABLE se_worktype
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@WorkType)
SET WorkType = NULLIF(@WorkType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_building.csv'
INTO TABLE sh_building
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Latitude,@Longitude,@Altitude,@ApropiateRoof,@SecureStructured,@ClimateThreatProtect,@WindowsAllRooms,@NoHumidity,@NoAnimals,@LT30Dregrees)
SET Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1),
    ApropiateRoof = NULLIF(@ApropiateRoof,-1),
    SecureStructured = NULLIF(@SecureStructured,-1),
    ClimateThreatProtect = NULLIF(@ClimateThreatProtect,-1),
    WindowsAllRooms = NULLIF(@WindowsAllRooms,-1),
    NoHumidity = NULLIF(@NoHumidity,-1),
    NoAnimals = NULLIF(@NoAnimals,-1),
    LT30Dregrees = NULLIF(@LT30Dregrees,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_house.csv'
INTO TABLE sh_house
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@Rooms,@PosibleUpgrading)
SET Rooms = NULLIF(@Rooms,-1),
    PosibleUpgrading = NULLIF(@PosibleUpgrading,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/sh_shelter.csv'
INTO TABLE sh_shelter
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@TotalHouses,@ConstructionCost,@ConstructionType)
SET TotalHouses = NULLIF(@TotalHouses,-1),
    ConstructionCost = NULLIF(@ConstructionCost,-1),
    ConstructionType = NULLIF(@ConstructionType,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_area.csv'
INTO TABLE u_area
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@AreaType,@Latitude,@Longitude,@Altitude)
SET AreaType = NULLIF(@AreaType,-1),
    Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_landuse.csv'
INTO TABLE u_landuse
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@PrivateLandArea,@UrbanFloodingArea,@UrbanSlopeRiskAre)
SET PrivateLandArea = NULLIF(@PrivateLandArea,-1),
    UrbanFloodingArea = NULLIF(@UrbanFloodingArea,-1),
    UrbanSlopeRiskAre = NULLIF(@UrbanSlopeRiskAre,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_publicspace.csv'
INTO TABLE u_publicspace
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@TotalArea)
SET TotalArea = NULLIF(@TotalArea,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_recreationalarea.csv'
INTO TABLE u_recreationalarea
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@AreaName,@Latitude,@Longitude,@Altitude,@Woodland_ShadedArea,@UrbanFurniture,@Floor_DrainageSystem,@PSTrush)
SET AreaName = NULLIF(@AreaName,-1),
    Latitude = NULLIF(@Latitude,-1),
    Longitude = NULLIF(@Longitude,-1),
    Altitude = NULLIF(@Altitude,-1),
    Woodland_ShadedArea = NULLIF(@Woodland_ShadedArea,-1),
    UrbanFurniture = NULLIF(@UrbanFurniture,-1),
    Floor_DrainageSystem = NULLIF(@Floor_DrainageSystem,-1),
    PSTrush = NULLIF(@PSTrush,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_road.csv'
INTO TABLE u_road
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@RoadsLength,@DrainageSystem,@Conditioning)
SET RoadsLength = NULLIF(@RoadsLength,-1),
    DrainageSystem = NULLIF(@DrainageSystem,-1),
    Conditioning = NULLIF(@Conditioning,-1);

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_urbanism.csv'
INTO TABLE u_urbanism
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
    (@UrbanPlan,@UrbanPlanDuratrion,@CampLimits,@LandManagement,@PlannedGrowth,@GrowthForecast,@UrbanPlanRiskInstruments,@RiskType,@AVG_PlotArea,@PlotDelimitation)
SET UrbanPlan = NULLIF(@UrbanPlan,-1),
    UrbanPlanDuratrion = NULLIF(@UrbanPlanDuratrion,-1),
    CampLimits = NULLIF(@CampLimits,-1),
    LandManagement = NULLIF(@LandManagement,-1),
    PlannedGrowth = NULLIF(@PlannedGrowth,-1),
    GrowthForecast = NULLIF(@GrowthForecast,-1),
    UrbanPlanRiskInstruments = NULLIF(@UrbanPlanRiskInstruments,-1),
    RiskType = NULLIF(@RiskType,-1),
    AVG_PlotArea = NULLIF(@AVG_PlotArea,-1),
    PlotDelimitation = NULLIF(@PlotDelimitation,-1);

UPDATE camp SET Community_idCommunity = (SELECT @CommunityID);

UPDATE camp_climaticregion SET Camp_idCamp = (SELECT @campID);

UPDATE camp_energysource_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE camp_energysource_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE camp_enviroment SET Camp_idCamp = (SELECT @campID);

UPDATE camp_has_country SET Country_idCountry = (SELECT @CountryID);

UPDATE camp_integration_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE camp_localcrop_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE camp_localvegetation_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE camp_mobility SET Camp_idCamp = (SELECT @campID);

UPDATE camp_movementreason_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE camp_naturalhazard_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE camp_naturalhazard_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE camp_shelter SET Camp_idCamp = (SELECT @campID);

UPDATE comun_language_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE comun_language_has_country SET Country_idCountry = (SELECT @CountryID);

UPDATE comun_religion_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE comun_religion_has_country SET Country_idCountry = (SELECT @CountryID);

UPDATE fa_geographicidentification SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fa_naturalresource SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fa_topography SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_cause SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_corralcropdata SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_corralubication_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_cropubication_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_cultivationseason SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_cultivationseason_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_foodaccess_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_foodaccess_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_foodaccesscontinuity SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_foodsafety SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_foodsource_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_grainconservation SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_grainmill SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_importantmeal SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_owncultivationfoodtype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_selfsufficiencyseason SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_timesperday SET Community_idCommunity = (SELECT @CommunityID);

UPDATE fs_typicalplate_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE g_politicalactor_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE g_publicpolitic SET Community_idCommunity = (SELECT @CommunityID);

UPDATE gd_demography SET Country_idCountry = (SELECT @CountryID);

UPDATE gd_economy SET Country_idCountry = (SELECT @CountryID);

UPDATE gd_electricgenerationmix SET Country_idCountry = (SELECT @CountryID);

UPDATE gd_ethnicgroup_has_country SET Country_idCountry = (SELECT @CountryID);

UPDATE gd_government SET Country_idCountry = (SELECT @CountryID);

UPDATE gd_infrastructure SET Country_idCountry = (SELECT @CountryID);

UPDATE gd_serviceaccess SET Country_idCountry = (SELECT @CountryID);

UPDATE gd_shelter SET Country_idCountry = (SELECT @CountryID);

UPDATE gd_urbanism SET Country_idCountry = (SELECT @CountryID);

UPDATE hostcommunity SET Community_idCommunity = (SELECT @CommunityID);

UPDATE hostcommunity SET Community_idCommunity = (SELECT @CommunityID);

UPDATE hostcommunity SET Country_idCountry = (SELECT @CountryID);

UPDATE hostcommunity_has_camp SET Camp_idCamp = (SELECT @campID);

UPDATE inf_appliance_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_appliance_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_appliance_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_appliance_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_colletionpoints SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_cookwoman SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_energyinfrastructure SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_generationsource_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_generationsource_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_generationsource_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_generationsource_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_generationsource_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_generationsystem SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_irrigatonsystem_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_kitchen SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_landfill SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_mobilityinfrastructure SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_mobilityway_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_mobilityway_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_mobillitypoint SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_potabilizationsystem_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_publiclighting SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_sanitationaccess SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_sanitationsystemquality_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_streetlamp SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_wastemanagementginfrastructure SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_waterinfrastructure SET Community_idCommunity = (SELECT @CommunityID);

UPDATE inf_waterpoint SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_app_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_app_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_cementery_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_dataaccess_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_educationalcenter_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_healthcenterservice SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_hospital_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_medicineaccess SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_noeducationcause_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_othercenter_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_primaryattention_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_repeaterantena SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_tecknowlege_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE s_tecknowlege_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_cleaningmaterial_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_conflictarea SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_economy SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_expensetype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_expensetype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_expensetype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_genderdata SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_householdcomposition SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_incometype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_incometype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_incometype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_personalhygiene SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_population SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_priority_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_priority_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_priority_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_safetycommittee SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_safetylatrines SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_safetyplace_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_safetyplace_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_worktype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_worktype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_worktype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE se_worktype_has_community SET Community_idCommunity = (SELECT @CommunityID);

UPDATE sh_building SET Community_idCommunity = (SELECT @CommunityID);

UPDATE sh_house SET Community_idCommunity = (SELECT @CommunityID);

UPDATE sh_shelter SET Community_idCommunity = (SELECT @CommunityID);

UPDATE u_area SET Community_idCommunity = (SELECT @CommunityID);

UPDATE u_landuse SET Community_idCommunity = (SELECT @CommunityID);

UPDATE u_publicspace SET Community_idCommunity = (SELECT @CommunityID);

UPDATE u_recreationalarea SET Community_idCommunity = (SELECT @CommunityID);

UPDATE u_road SET Community_idCommunity = (SELECT @CommunityID);

UPDATE u_urbanism SET Community_idCommunity = (SELECT @CommunityID);

SET FOREIGN_KEY_CHECKS = 1;
SET SQL_SAFE_UPDATES = 1;

