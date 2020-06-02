SET FOREIGN_KEY_CHECKS=0;
SET SQL_SAFE_UPDATES = 0;
SET @OLD_SQL_MODE=@@SQL_MODE, sql_mode='NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_corralubication_has_community.csv'
INTO TABLE fs_corralubication_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@FS_CorralUbication_idFS_CorralUbication,@Community_idCommunity)
SET FS_CorralUbication_idFS_CorralUbication = NULLIF(@FS_CorralUbication_idFS_CorralUbication,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_cropubication_has_community.csv'
INTO TABLE fs_cropubication_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@FS_CropUbication_idFS_CropUbication,@Community_idCommunity)
SET FS_CropUbication_idFS_CropUbication = NULLIF(@FS_CropUbication_idFS_CropUbication,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodaccess_has_community.csv'
INTO TABLE fs_foodaccess_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@FS_FoodAccess_idFS_FoodAccess,@Community_idCommunity,@NumberPeople)
SET FS_FoodAccess_idFS_FoodAccess = NULLIF(@FS_FoodAccess_idFS_FoodAccess,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    NumberPeople = NULLIF(@NumberPeople,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_foodsource_has_community.csv'
INTO TABLE fs_foodsource_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@FS_FoodSource_idFS_FoodSource,@Community_idCommunity,@NumberPeople)
SET FS_FoodSource_idFS_FoodSource = NULLIF(@FS_FoodSource_idFS_FoodSource,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    NumberPeople = NULLIF(@NumberPeople,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_importantmeal_has_community.csv'
INTO TABLE fs_importantmeal_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@FS_ImportantMeal_idFS_ImportantMeal,@Community_idCommunity,@numberPeople)
SET FS_ImportantMeal_idFS_ImportantMeal = NULLIF(@FS_ImportantMeal_idFS_ImportantMeal,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    numberPeople = NULLIF(@numberPeople,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_owncultivationfoodtype_has_community.csv'
INTO TABLE fs_owncultivationfoodtype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@FS_OwnCultivationFoodType_idFS_OwnCultivationFoodType,@Community_idCommunity)
SET FS_OwnCultivationFoodType_idFS_OwnCultivationFoodType = NULLIF(@FS_OwnCultivationFoodType_idFS_OwnCultivationFoodType,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_timesperday_has_community.csv'
INTO TABLE fs_timesperday_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@FS_TimesPerDay_idFS_TimesPerDay,@Community_idCommunity,@NumberPeople)
SET FS_TimesPerDay_idFS_TimesPerDay = NULLIF(@FS_TimesPerDay_idFS_TimesPerDay,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    NumberPeople = NULLIF(@NumberPeople,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/fs_typicalplate_has_community.csv'
INTO TABLE fs_typicalplate_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@FS_TypicalPlate_idFS_TypicalPlate,@Community_idCommunity,@Kcal_100g)
SET FS_TypicalPlate_idFS_TypicalPlate = NULLIF(@FS_TypicalPlate_idFS_TypicalPlate,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    Kcal_100g = NULLIF(@Kcal_100g,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/g_politicalactor_has_community.csv'
INTO TABLE g_politicalactor_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@G_PoliticalActor_idG_PoliticalActor,@Community_idCommunity)
SET G_PoliticalActor_idG_PoliticalActor = NULLIF(@G_PoliticalActor_idG_PoliticalActor,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_ethnicgroup_has_country.csv'
INTO TABLE gd_ethnicgroup_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@GD_EthnicGroup_idGD_EthnicGroup,@Country_idCountry)
SET GD_EthnicGroup_idGD_EthnicGroup = NULLIF(@GD_EthnicGroup_idGD_EthnicGroup,''),
    Country_idCountry = NULLIF(@Country_idCountry,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_language_has_country.csv'
INTO TABLE gd_language_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@GD_Language_idGD_Language,@Country_idCountry)
SET GD_Language_idGD_Language = NULLIF(@GD_Language_idGD_Language,''),
    Country_idCountry = NULLIF(@Country_idCountry,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/gd_religion_has_country.csv'
INTO TABLE gd_religion_has_country
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@GD_Religion_idGD_Religion,@Country_idCountry)
SET GD_Religion_idGD_Religion = NULLIF(@GD_Religion_idGD_Religion,''),
    Country_idCountry = NULLIF(@Country_idCountry,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_appliance_has_community.csv'
INTO TABLE inf_appliance_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@INF_Appliance_idINF_Appliance,@Community_idCommunity,@Sector,@TimeUse)
SET INF_Appliance_idINF_Appliance = NULLIF(@INF_Appliance_idINF_Appliance,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    Sector = NULLIF(@Sector,''),
    TimeUse = NULLIF(@TimeUse,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_generationsource_has_community.csv'
INTO TABLE inf_generationsource_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@INF_GenerationSource_idINF_GenerationSource,@Community_idCommunity,@Sector,@TimeAccessDay,@TimeAccessNight,@Cost)
SET INF_GenerationSource_idINF_GenerationSource = NULLIF(@INF_GenerationSource_idINF_GenerationSource,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    Sector = NULLIF(@Sector,''),
    TimeAccessDay = NULLIF(@TimeAccessDay,''),
    TimeAccessNight = NULLIF(@TimeAccessNight,''),
    Cost = NULLIF(@Cost,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_mobilityway_has_community.csv'
INTO TABLE inf_mobilityway_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@INF_MobilityWay_idINF_MobilityWay,@Community_idCommunity,@Internal_external)
SET INF_MobilityWay_idINF_MobilityWay = NULLIF(@INF_MobilityWay_idINF_MobilityWay,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    Internal_external = NULLIF(@Internal_external,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/inf_sanitationsystemquality_has_community.csv'
INTO TABLE inf_sanitationsystemquality_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@INF_SanitationSystemQuality_idINF_SanitationSystemQuality,@Community_idCommunity)
SET INF_SanitationSystemQuality_idINF_SanitationSystemQuality = NULLIF(@INF_SanitationSystemQuality_idINF_SanitationSystemQuality,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_app_has_community.csv'
INTO TABLE s_app_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@S_App_idS_App,@Community_idCommunity,@Use_Necessity)
SET S_App_idS_App = NULLIF(@S_App_idS_App,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    Use_Necessity = NULLIF(@Use_Necessity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_cementery_has_community.csv'
INTO TABLE s_cementery_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@S_Cementery_idS_Cementery,@Community_idCommunity)
SET S_Cementery_idS_Cementery = NULLIF(@S_Cementery_idS_Cementery,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_educationalcenter_has_community.csv'
INTO TABLE s_educationalcenter_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@S_EducationalCenter_idS_EducationalCenter,@Community_idCommunity)
SET S_EducationalCenter_idS_EducationalCenter = NULLIF(@S_EducationalCenter_idS_EducationalCenter,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_hospital_has_community.csv'
INTO TABLE s_hospital_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@S_Hospital_idS_Hospital,@Community_idCommunity)
SET S_Hospital_idS_Hospital = NULLIF(@S_Hospital_idS_Hospital,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_noeducationcause_has_community.csv'
INTO TABLE s_noeducationcause_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@S_NoEducationCause_idS_NoEducationCause,@Community_idCommunity)
SET S_NoEducationCause_idS_NoEducationCause = NULLIF(@S_NoEducationCause_idS_NoEducationCause,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/s_tecknowlege_has_community.csv'
INTO TABLE s_tecknowlege_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@S_Tecknowlege_idS_Tecknowlege,@Community_idCommunity,@NumberPersons)
SET S_Tecknowlege_idS_Tecknowlege = NULLIF(@S_Tecknowlege_idS_Tecknowlege,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    NumberPersons = NULLIF(@NumberPersons,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_expensetype_has_community.csv'
INTO TABLE se_expensetype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@SE_ExpenseType_idSE_ExpenseType,@Community_idCommunity,@Sex,@ExpenseValue)
SET SE_ExpenseType_idSE_ExpenseType = NULLIF(@SE_ExpenseType_idSE_ExpenseType,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    Sex = NULLIF(@Sex,''),
    ExpenseValue = NULLIF(@ExpenseValue,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_incometype_has_community.csv'
INTO TABLE se_incometype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@SE_IncomeType_idSE_IncomeType,@Community_idCommunity,@Sex,@IncomeValue)
SET SE_IncomeType_idSE_IncomeType = NULLIF(@SE_IncomeType_idSE_IncomeType,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    Sex = NULLIF(@Sex,''),
    IncomeValue = NULLIF(@IncomeValue,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_priority_has_community.csv'
INTO TABLE se_priority_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@SE_Priority_idSE_Priority,@Community_idCommunity,@totalAnswer,@priorityLevel)
SET SE_Priority_idSE_Priority = NULLIF(@SE_Priority_idSE_Priority,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    totalAnswer = NULLIF(@totalAnswer,''),
    priorityLevel = NULLIF(@priorityLevel,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_safetyplace_has_community.csv'
INTO TABLE se_safetyplace_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@SE_SafetyPlace_idSE_SafetyPlace,@Community_idCommunity,@Answer)
SET SE_SafetyPlace_idSE_SafetyPlace = NULLIF(@SE_SafetyPlace_idSE_SafetyPlace,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    Answer = NULLIF(@Answer,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/se_worktype_has_community.csv'
INTO TABLE se_worktype_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@SE_WorkType_idSE_WorkType,@Community_idCommunity,@childNumber,@womenNumber,@menNumber)
SET SE_WorkType_idSE_WorkType = NULLIF(@SE_WorkType_idSE_WorkType,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    childNumber = NULLIF(@childNumber,''),
    womenNumber = NULLIF(@womenNumber,''),
    menNumber = NULLIF(@menNumber,'');

LOAD DATA INFILE 'C:/Users/guill/Documents/Universidad/PlataformaRefugiados/NAUTIA/DesarrolloPy/DataSetFinales/u_area_has_community.csv'
INTO TABLE u_area_has_community
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
    (@U_Area_idU_Area,@Community_idCommunity,@Latitude,@longitude,@altitude)
SET U_Area_idU_Area = NULLIF(@U_Area_idU_Area,''),
    Community_idCommunity = NULLIF(@Community_idCommunity,''),
    Latitude = NULLIF(@Latitude,''),
    longitude = NULLIF(@longitude,''),
    altitude = NULLIF(@altitude,'');

SET @idCommunity = (SELECT idCommunity FROM Community ORDER BY idCommunity DESC LIMIT 1);
SET @idCountry = (SELECT idCountry FROM Country ORDER BY idCountry DESC LIMIT 1);
INSERT INTO HostCommunity (Community_idCommunity,Country_idCountry)VALUES ((SELECT @CommunityID), (SELECT @idCountry));
SET @idCamp = (SELECT idCamp FROM Camp ORDER BY idCamp DESC LIMIT 1);
SET @idHostCommunity = (SELECT idHostCommunity FROM HostCommunity ORDER BY idHostCommunity DESC LIMIT 1);
INSERT INTO HostCommunity_has_Camp (HostCommunity_idHostCommunity,Camp_idCamp)VALUES ((SELECT @idHostCommunity), (SELECT @idCamp));
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = 1;
SET SQL_SAFE_UPDATES = 1;

