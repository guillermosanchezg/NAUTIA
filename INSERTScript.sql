SET SQL_SAFE_UPDATES = 0;

INSERT INTO `community` VALUES (1),(2);

INSERT INTO `camp` VALUES (1,"Shimelba","11/04/1996",1000, "YES","12",1);

INSERT INTO `country` (countryname) VALUES ("Etiopia"),("Eritrea"),("Argelia");
INSERT INTO `Camp_has_Country` VALUES (1,1);

INSERT INTO `HostCommunity` VALUES (1,"Comunidad 1",2,1);
INSERT INTO `HostCommunity_has_Camp` VALUES (1,1);

------------------

INSERT INTO `Comun_Religion` (Religion) VALUES ("Musulmana"),("Patolica");
INSERT INTO `Comun_Religion_has_Camp` VALUES (1,1),(2,1);
INSERT INTO `Comun_Religion_has_Country` VALUES (1,1),(1,2),(2,2);
INSERT INTO `Comun_Language` (Language) VALUES ("Inglés"),("Frances"),("Amaranto");
INSERT INTO `Comun_Language_has_Camp` VALUES (1,1),(2,1);
INSERT INTO `Comun_Language_has_Country` VALUES (1,2),(2,1),(2,2),(3,2);

------------------

INSERT INTO `GD_Demography` VALUES (1,3000,2900,5000,5100,10000,9900,5000,5250,25,10,5.5,60,1),
                                (2,4000,3900,4000,5100,10500,1100,6000,6250,35,75,10.5,60,2);
INSERT INTO `GD_EthnicGroup` (EthnicGroup) VALUES ("Grupo 1"),("Grupo 2");
INSERT INTO `GD_EthnicGroup_has_Country` VALUES (1,1),(1,2),(2,2);
INSERT INTO `GD_Economy` VALUES (1,30,25.5,10.8,20,60.6,0.5,2300,5.5,"MonedaEtiope",25,1),
                                (2,30,25.5,10.8,20,60.6,0.8,1300,5.5,"MonedaEritrea",15,2);
INSERT INTO `GD_Government` VALUES (1,"Monarquia absoluta",1),(2,"Monarquia absoluta",2);
INSERT INTO `GD_Urbanism` VALUES (1,10.5,89.5,100,10.5,1),(2,9.5,90.5,90,15.5,2);
INSERT INTO `GD_Infrastructure` VALUES (1,30,30,40,40,15.5,15.5,120,1),
                                        (2,30,30,40,40,15.5,15.5,120,2);
INSERT INTO `GD_ElectricGenerationMix` VALUES (1,100,98.8,200,170,50.7,784,57.98,1),(2,100,98.8,200,170,50.7,784,57.98,2);   
INSERT INTO `GD_ServiceAccess` VALUES(1,30,10.85,1),(2,20,20.85,2);
INSERT INTO `GD_Shelter` VALUES (1,30,1),(2,25,2); 

------------------

INSERT INTO `Camp_MovementReason` (Reason) VALUES ("Guerra"),("hambruna");
INSERT INTO `Camp_MovementReason_has_Camp` VALUES (1,1),(2,1);
INSERT INTO `Camp_Integration` (RelationshipCause) VALUES ("Cultural"),("negocios");
insert INTO `Camp_Integration_has_Camp` VALUES (1,1),(2,1);
INSERT INTO `Camp_NaturalHazard` (HazardType) VALUES ("Inundación"),("Terremoto");
INSERT INTO `Camp_NaturalHazard_has_Camp`  VALUES (1,1,12),(2,1,2);
INSERT INTO `Camp_EnergySource`(Source) VALUES ("diesel"),("Fotovoltaica");
INSERT INTO `Camp_EnergySource_has_Camp` VALUES (1,1,12.4),(2,1,16.6); 
INSERT INTO `Camp_LocalVEgetation` (Species) VALUES ("Margaritas"),("Roble");
INSERT INTO `Camp_LocalVEgetation_has_Camp` VALUES (1,1),(2,1);
INSERT INTO `Camp_LocalCrop` (Type) VALUES ("pera"),("calabaza"),("higo");
INSERT INTO `Camp_LocalCrop_has_Camp` VALUES (1,1),(2,1),(3,1);
INSERT INTO `Camp_ClimaticRegion` VALUES (1,"BSH",40,10,33.5,20,200,5,20.5,20,1);
INSERT INTO `Camp_Mobility` VALUES (1,"YES",5,1);
INSERT INTO `Camp_Shelter` VALUES (1,"YES",1);

------------------

INSERT INTO `SE_Population` VALUES (1,100,1000,5000,500,"YES",1),(2,200,2000,4000,400,"NO",2);
INSERT INTO `SE_HouseHoldComposition` VALUES (1,1,1,2,1,1),(2,2,1,3,2,1),(1,1,1,2,1,2),(2,2,1,3,2,2);
INSERT INTO `SE_CleaningMAterial` (Material) VALUES ("Papel"),("Piedras");
INSERT INTO `SE_CleaningMAterial_has_Community` VALUES (1,1),(1,2),(2,1);
INSERT INTO `SE_ConflictArea` VALUES (1,"1º2'3''","3º2'1''",40,1),(2,"2º2'3''","4º2'1''",40,1),(3,"4º2'3''","5º2'1''",40,2),(4,"5º2'3''","6º2'1''",40,2);
INSERT INTO `SE_GenderData` VALUES (1,"YES",1),(2,"NO",2);
INSERT INTO `SE_PersonalHygiene` VALUES (1,5,1),(2,3,2);
INSERT INTO `SE_SafetyPlace` (Place_Time) VALUES ("CalleDia"),("CalleNoche");
INSERT INTO `SE_SafetyPlace_has_Community` (SE_SafetyPlace_idSE_ComunitySafety,Community_idCommunity,Answer) VALUES (1,1,"YES"),(2,1,"NO"),(1,1,"YES"),(2,1,"NO"),(1,2,"YES");
INSERT INTO `SE_SafetyCommittee` VALUES (1,"YES","YES",2),(2,"YES","NO",2);
INSERT INTO `SE_SafetyLatrines` VALUES (1,"YES","NO",1),(2,"YES","YES",1),(3,"YES","NO",2);
INSERT INTO `SE_Economy` (BasicBasketCost,Community_idCommunity) VALUES ("1.5",1),("N/A",2);
INSERT INTO `SE_Priority` (Type) VALUES ("Empleo"),("Energia");
INSERT INTO `SE_Priority_has_Community` (SE_Priority_idSE_Priority,Community_idCommunity,sex) 
                                        VALUES (1,1,"Mujer"),(1,1,"Mujer"),(2,1,"Mujer"),(2,1,"Mujer"),
                                                (1,1,"Hombre"),(1,1,"Hombre"),(2,1,"Hombre"),(2,1,"Mujer"),
                                                (1,2,"Mujer"),(1,2,"Mujer"),(2,2,"Mujer"),(2,2,"Mujer"),
                                                (1,2,"Hombre"),(1,2,"Hombre"),(2,2,"Hombre");
INSERT INTO `SE_IncomeType` (Type) VALUES ("Subvencion"),("Remesa"),("Agricultura");
INSERT INTO `SE_IncomeType_has_Community` (SE_IncomeType_idSE_IncomeType,Community_idCommunity,Sex,IncomeValue)
                                        VALUES (1,1,"Mujer", 100),(1,1,"Mujer",250),(2,1,"Mujer",200),(2,1,"Mujer",200),
                                                (1,1,"Hombre", 100),(1,1,"Hombre",250),(2,1,"Hombre",200),(3,1,"Mujer",200),(3,1,"HOmbre",550),
                                                (1,2,"Mujer", 100),(1,2,"Mujer",250),(2,2,"Mujer",200),(2,2,"Mujer",200),
                                                (1,2,"Hombre", 100),(1,2,"Hombre",250),(2,2,"Hombre",200),(3,2,"Mujer",200),(3,2,"HOmbre",550);
INSERT INTO `SE_ExpenseType` (Type) VALUES ("Alimentación"),("Ropa"),("Agua");
INSERT INTO `SE_ExpenseType_has_Community` (SE_ExpenseType_idSE_ExpenseType,Community_idCommunity,Sex,ExpenseValue)
                                        VALUES (1,1,"Mujer", 100),(1,1,"Mujer",250),(2,1,"Mujer",200),(2,1,"Mujer",200),
                                                (1,1,"Hombre", 100),(1,1,"Hombre",250),(2,1,"Hombre",200),(3,1,"Mujer",200),(3,1,"HOmbre",550),
                                                (1,2,"Mujer", 100),(1,2,"Mujer",250),(2,2,"Mujer",200),(2,2,"Mujer",200),
                                                (1,2,"Hombre", 100),(1,2,"Hombre",250),(2,2,"Hombre",200),(3,2,"Mujer",200),(3,2,"HOmbre",550);
INSERT INTO `SE_WorkType` (WorkType) VALUES ("Recoger Leña"),("Cocinar");
INSERT INTO `SE_WorkType_has_Community` (SE_WorkType_idSE_WorkType,Community_idCommunity,Sex,Kid)
                                        VALUES  (1,1,"Mujer", false),(1,1,"Mujer",false),(2,1,"Mujer",true),(2,1,"Mujer",true),
                                                (1,1,"Hombre", false),(1,1,"Hombre",true),(2,1,"Hombre",true),(2,1,"Mujer",false),(2,1,"HOmbre",false),
                                                (1,2,"Mujer", true),(1,2,"Mujer",true),(2,2,"Mujer",false),(2,2,"Mujer",true),
                                                (1,2,"Hombre", false),(1,2,"Hombre",false),(2,2,"Hombre",true),(2,2,"Mujer",true),(2,2,"HOmbre",false);



-------------------------

INSERT INTO `G_PublicPolitic` (DocumentTittle,Path,Community_idCommunity) VALUES ("Doc1",":C//UnCamino/Cualquiera.pdf",1),("Doc2",":C//Este/es/otr/Camino/Cualquiera/pero/Mas/Largo.pdf",2);
INSERT INTO `G_PoliticalActor` VALUES (1,"Acnur","Privado"),(2,"CooperacionEspañola","Privado");
INSERT INTO `G_PoliticalActor_has_Community` VALUES (1,1),(1,2),(2,1),(2,2);

------------------------

INSERT INTO `FA_Topography` VALUES (1,50,5,10,10,1),(2,50,5,10,7,2);
INSERT INTO `FA_NaturalResource` (type,Bound,Community_idCommunity) VALUES ("lago 1","700",1),("Rio 1","20",1),("Lago 2","N/A",2);
INSERT INTO `FA_GeographicIdentification` VALUES (1,"1º2'3''","3º2'1''",40,20,1),(2,"2º2'3''","4º2'1''",40,30,2);

-----------------------

INSERT INTO `U_Urbanism` VALUES (1,"YES",5,"abierto","comunal","YES",5,"YES","YES","YES","NO",5,"YES",1),(2,"YES",5,"abierto","comunal","YES",5,"YES","YES","YES","NO",5,"YES",2);
INSERT INTO `U_PublicSpace` VALUES (1,40,1),(2,50,2);
INSERT INTO `U_Area` VALUES (1,"inundable","1º2'3''","3º2'1''",5,1),(2,"deslave","1º2'3''","3º2'1''",5,1),(3,"inundable","1º2'3''","3º2'1''",5,2),(4,"deslave","1º2'3''","3º2'1''",5,2);
INSERT INTO `U_RecreationalArea` VALUES (1,"Area 1","1º2'3''","3º2'1''",5,true,true,false,false,1),(2,"deslave","1º2'3''","3º2'1''",5,true,false,false,true,1),(3,"inundable","1º2'3''","3º2'1''",5,true,true,false,false,2),(4,"deslave","1º2'3''","3º2'1''",5,true,true,false,false,2);
INSERT INTO `U_Road` VALUES (1,20,"YES","NO",1),(2,15,"YES","YES",2);
INSERT INTO `U_LandUse` VALUES (1,10,15,20,1),(2,5,10,25,2);

------------------------


INSERT INTO `INF_WaterInfrastructure` VALUES (1,"No potable",5,"Camion",1),(2,"Contaminada",5.5,"No Mejorada",2);
INSERT INTO `INF_IrrigatonSystem` VALUES (1,"YES",15,"diesel",1),(2,"YES",15,"diesel",1),(3,"YES",15,"diesel",2);
INSERT INTO `INF_PotabilizationSystem` (Type) VALUES ("Sistema 1"),("Sistema 2");
INSERT INTO `INF_PotabilizationSystem_has_Community` VALUES (1,1),(2,1),(2,2);
INSERT INTO `INF_WaterPoint` VALUES (1,"1º2'3''","3º2'1''",40,"YES",1),(2,"2º2'3''","4º2'1''",40,"NO",2),(3,"1º2'3''","3º2'1''",40,"YES",1),(4,"2º2'3''","4º2'1''",40,"NO",1);
INSERT INTO `INF_TimeSpent` VALUES (1,2.5,1,1),(2,3.25,2,2);
INSERT INTO `INF_SanitationAccess` VALUES (1,true,true,true,1),(2,false,true,true,2);
INSERT INTO `INF_SanitationSystemQuality` VALUES (1,"sin losa","sin seguridad estructural",1),(2,"sin losa","sin seguridad estructural",2);
INSERT INTO `INF_WasteManagementgInfrastructure` VALUES (1,4,1),(2,2,2);
INSERT INTO `INF_Landfill` VALUES (1,5,5,25,1),(2,5,5,25,2);
INSERT INTO `INF_ColletionPoints` VALUES(1,"1º2'3''","3º2'1''",40,1),(2,"1º2'3''","3º2'1''",40,1),(1,"1º2'3''","3º2'1''",40,2);
INSERT INTO `INF_EnergyInfrastructure` VALUES (1,"YES",25,30,"YES",3,"LINK",14,1),(2,"YES",45,40,"YES",3,"LINK",24,2);
INSERT INTO `INF_GenerationSource` (Source) VALUES ("Generador térmico"),("Fotovoltaica");
INSERT INTO `INF_GenerationSource_has_Community` (INF_GenerationSource_idINF_GenerationSource,Community_idCommunity,Sector,TimeAccess,Cost)
                                                VALUES (1,1,"Comercial",40,400),(1,2,"Comercial",30,250),(1,1,"Comercial",40,400),(1,2,"Comercial",30,250),
                                                        (2,1,"Residencial",10,150),(2,2,"Comercial",20,200),(2,1,"Residencial",10,150),(2,2,"Comercial",20,200);
INSERT INTO `INF_GenerationSource_has_Community` (INF_GenerationSource_idINF_GenerationSource,Community_idCommunity,Sector,TimeAccess,Cost) 
                                                VALUES (1,1,"Residencial",5,100),(1,1,"Residencial",6,100),(1,1,"Residencial",5,300), 
                                                        (2,2,"Comercial",5,100),(2,2,"Comercial",5,100),
                                                        (2,2,"ServiciosComunitarios",5,100);
INSERT INTO `INF_GenerationSystem` VALUES (1,"Comercial","Generador térmico",15,1),(2,"Comercial","Generador térmico",15,1),(3,"Comercial","Generador térmico",15,2); 
INSERT INTO `INF_ExpandPlanBeneficiaries` (Beneficiary) VALUES ("escuela"),("cocina comunal"),("hospital");
INSERT INTO `INF_ExpandPlanBeneficiaries_has_INF_EnergyInfrastructure` (INF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries,INF_EnergyInfrastructure_idINF_EnergyInfrastructure,INF_EnergyInfrastructure_Community_idCommunity)
                                                                        VALUES (1,1,1),(2,1,1),(1,2,2),(2,2,2),(3,2,2),(3,1,1),(2,2,2),(2,2,2);
INSERT INTO `INF_Appliance` (ApplianceType) VALUES ("Microondas"),("Celular"),("Cocina Electrica");
INSERT INTO `INF_Appliance_has_Community` (INF_Appliance_idINF_Appliance,Community_idCommunity,Sector,Power)
                                        VALUES (1,1,"Residencial",12),(2,1,"Residencial",15),
                                                (1,1,"Comercial",12),(2,1,"Comercial",12),
                                                (1,2,"Residencial",12),(2,2,"Residencial",12),
                                                (1,2,"Comercial",12),(2,2,"Comercial",12);
INSERT INTO `INF_Kitchen` VALUES (1,"Barro","Gas",5.5,1),(2,"Metal","Gas",5.5,1),(3,"Barro","Gas",5.5,2);
INSERT INTO `INF_CookWoman` VALUES (1,"Indoor",2.5,4,6,true,1),(2,"outdoor",2.5,4,6,true,2),(3,"outdoor",2.5,4,6,false,2);
INSERT INTO `INF_PublicLighting` VALUES (1,"YES",1,"YES",1),(2,"YES",2,"YES",2);
INSERT INTO `INF_LightingTech` VALUES (1,"Sodio",10,1,1),(2,"LED",15,2,2);
INSERT INTO `INF_WomenSafety` VALUES (1,"YES",1,1),(2,"YES",2,2);
INSERT INTO `INF_MobilityInfrastructure` VALUES (1,5,1),(2,4,2);
INSERT INTO `INF_MobillityPoint` VALUES (1,"1º2'3''","3º2'1''",40,1),(2,"2º2'3''","4º2'1''",40,2),(3,"1º2'3''","3º2'1''",40,1),(4,"2º2'3''","4º2'1''",40,1);
INSERT INTO `INF_MobilityWay` (Way) VALUES ("Bici"),("Caminando"),("Coche");
INSERT INTO `INF_MobilityWay_has_Community` (INF_MobilityWay_idINF_ExternalMobility,Community_idCommunity,Internal_External)
											VALUES (1,1,"Internal"),(2,1,"Internal"),(3,1,"external"),
													(1,2,"Internal"),(2,2,"Internal"),(3,2,"Internal"),                                          
													(1,2,"external"),(2,2,"external");  

-----------------------

INSERT INTO `S_BuildingQuality`  VALUES (1,true,true,false,false),(2,true,true,false,false),(3,true,true,false,false),
                                        (4,true,true,false,false),(5,true,true,false,false),(6,true,true,false,false),
                                        (7,true,true,false,false),(8,true,true,false,false),(9,true,true,false,false),
                                        (10,true,true,false,false);
INSERT INTO `S_EducationalCenter` VALUES (1,"1º2'3''","3º2'1''",40,2,"Secundaria",40,45,5,"Libros, cuadernos, equipo y material de laboratorio, ordenador sin internet",2,2.5,0,1,1),
                                        (2,"1º2'3''","3º2'1''",40,2,"Secundaria",40,45,5,"Libros, cuadernos",2,2.5,0,1,2),
                                        (3,"1º2'3''","3º2'1''",40,2,"Secundaria",40,45,5,"Libros",2,2.5,0,2,3),
                                        (4,"1º2'3''","3º2'1''",40,2,"Profesional",40,45,5,"Libros",2,2.5,0,2,4);
INSERT INTO `S_Subject` (Subject) VALUES ("Matematicas"),("Musica"),("Historia"),("Agronomia"),("Costura"),("Ingles");
INSERT INTO `S_Subject_has_S_EducationaCenter` VALUES (1,1,1,"EducationalPayLoad"),
                                                        (2,1,1,"Demanded"),
                                                        (3,3,2,"Demanded");
INSERT INTO `S_NoEducationCause` (Cause) VALUES ("Conciliación familiar"),("Dinero");
INSERT INTO `S_NoEducationCause_has_Community` VALUES (1,1),(2,1),(1,2),(2,2);
INSERT INTO `S_Hospital`  VALUES (1,"1º2'3''","3º2'1''",40,2,500,1,5),(2,"1º2'3''","3º2'1''",40,2,500,2,6);
INSERT INTO `S_PrimaryAttention` VALUES (1,"1º2'3''","3º2'1''",40,2,1,7),(2,"1º2'3''","3º2'1''",40,2,2,8),(3,"1º2'3''","3º2'1''",40,2,1,9),(3,"1º2'3''","3º2'1''",40,2,2,10);
INSERT INTO `S_Cementery` VALUES (1,"1º2'3''","3º2'1''",40,2,"YES",40,1),(2,"1º2'3''","3º2'1''",40,2,"NO",40,2);
INSERT INTO `S_OtherCenter` VALUES (1,"1º2'3''","3º2'1''",40,2,"Deportivo","Nombre 1",1),(2,"1º2'3''","3º2'1''",40,2,"sociocultural","Nombre 2",1),(3,"1º2'3''","3º2'1''",40,2,"Deportivo","Nombre 3",2);
INSERT INTO `S_HealthCenterService` VALUES (1,4,6,1),(2,6,8,2);
INSERT INTO `S_MedicineAccess` (Access,Community_idCommunity) VALUES ("Yes",1),("No",1),("Yes",1),("No",1),("Yes",1),("No",1),("Yes",2),("No",2),("No",2),("Yes",2),("No",2),("No",2);
INSERT INTO `S_DataAccess` (DataType) VALUES ("Telefonia fija"),("Telefonia fija por cobre");
INSERT INTO `S_DataAccess_has_Community` VALUES (1,1),(2,1),(1,2);
INSERT INTO `S_RepeaterAntena` (Number,Community_idCommunity) VALUES (3,1),(1,2);
INSERT INTO `S_Tecknowlege`(knowlegeType) VALUES ("Usuario Movil Llamadas"),("PC"),("Programación y administración de sistemas");
INSERT INTO `S_Tecknowlege_has_Community` (S_Tecknowlege_idS_Tecknowlege,Community_idCommunity) VALUES (1,1),(1,1),(1,1),(2,1),(2,1),(3,1),(1,2),(1,2),(2,2);
INSERT INTO `S_HardwareAccesibility` (HardWareType) VALUES ("PC"),("Movil");
INSERT INTO `S_HardwareAccesibility_has_Community` (S_HardwareAccesibility_idS_HardwareAccesibility,Community_idCommunity,OperativeSystem)
                                                VALUES (1,1,"Windows"),(1,2,"Linux"),(2,2,"Android One");
INSERT INTO `S_ProgramingKnowlege` (Language) VALUES ("C");
INSERT INTO `S_ProgramingKnowlege_has_Community` (S_ProgramingKnowlege_idS_ProgramingKnowlege,Community_idCommunity)
                                                VALUES (1,2),(1,2);
INSERT INTO `S_App` (App) VALUES ("Facebook"),("Whatsapp"),("Word"),("PowerPoint");
INSERT INTO `S_App_has_Community`(S_App_idS_App,Community_idCommunity,Use_Necesity) 
                                VALUES (1,1,"USE"),(1,2,"Necesity"),(1,1,"USE"),(1,2,"Necesity"),(4,1,"Nesesity"),(4,1,"Nesesity");

--------------------

INSERT INTO `SH_Shelter` VALUES (1,340,100.5,"Comunitaria",1),(2,540,105.5,"Comunitaria",2);
INSERT INTO `SH_House` VALUES (1,3,True,False,True,True,False,True,False,True,1),
                                (2,3,True,False,True,True,False,True,False,True,1),
                                (3,3,True,False,True,True,False,True,False,True,1),
                                (4,3,True,False,True,True,False,True,False,True,1),
                                (5,3,True,False,True,True,False,False,False,True,2),
                                (6,3,True,False,True,True,False,False,False,True,2),
                                (7,3,True,False,True,True,False,False,False,True,2),
                                (8,3,True,False,True,True,False,False,False,True,2),
                                (9,3,True,False,True,True,False,False,False,True,2);

------------------------

INSERT INTO `FS_FoodSafety` VALUES (1,"No existe dpto de sanidad",true,true,false,true,70,1),
                                        (2,"Plagas",true,true,false,true,70,2);
INSERT INTO `FS_FoodAccess` (FoodType) VALUES ("carne"),("grano"),("Legumbres"),("Frutas");
INSERT INTO `FS_FoodAccess_has_Community` (FS_FoodAccess_idFS_FoodAccess,Community_idCommunity) 
                                            VALUES (1,1),(1,1),(1,1),(1,1),(2,1),(2,1),(2,1),(2,1),(2,1),(2,1),(3,1),(3,1),(4,1),
                                                    (1,2),(1,2),(1,2),(1,2),(1,2),(1,2),(1,2),(2,2),(2,2),(2,2),(2,2),(3,2),(3,2);
INSERT INTO `FS_DailyMeal` (TimesPerDay,ImportantMeal,Community_idCommunity)
                            VALUES (2,"Comida",1),(2,"Comida",1),(2,"Comida",1),(3,"Cena",1),(3,"Cena",1),
                                    (3,"Comida",2),(3,"Desayuno",2),(3,"Cena",2),(3,"Comida",2);
INSERT INTO `FS_TypicalPlate` (Plate,Kcal) VALUES ("Cerdo",300),("Ternera",450),("Gallina",250);
INSERT INTO `FS_TypicalPlate_has_Community` (FS_TypicalPlate_idFS_TypicalPlate,Community_idCommunity)
                                                VALUES (1,1),(1,2),(2,1),(2,2),(3,2);
INSERT INTO `FS_FoodSource` (Source) VALUES ("Ayuda humanitaria"),("Cultivos propios");
INSERT INTO `FS_FoodSource_has_Community` (FS_FoodSource_idFS_FoodSource,Community_idCommunity)
                                            VALUES (1,1),(1,1),(1,1),(1,1),(2,1),(2,1),(2,1),
                                                    (1,2),(1,2),(1,2),(1,2),(2,2),(2,2),(2,2);
INSERT INTO `FS_CultivationSeason` (Month) VALUES ("Marzo"),("Abril"),("Mayo"),("Junio");
INSERT INTO `FS_CultivationSeason_has_Community` VALUES (1,1),(2,1),(3,1),(4,1),
                                                        (1,2),(2,2),(3,2),(4,2);            
INSERT INTO `FS_CorralCropData` VALUES (1,"Continuo","YES",1),(2,"Rotacional","YES",2);
INSERT INTO `FS_CorralUbication` VALUES (1,"1º2'3''","3º2'1''",40,"Privado","Tipo 1",1),(2,"1º2'3''","3º2'1''",40,"público","Tipo 1",1),
                                        (3,"1º2'3''","3º2'1''",40,"Privado","Tipo 1",2),(4,"1º2'3''","3º2'1''",40,"público","Tipo 1",2);
INSERT INTO `FS_CropUbication` VALUES (1,"1º2'3''","3º2'1''",40,"Privado","Tipo 1",1),(2,"1º2'3''","3º2'1''",40,"público","Tipo 1",1),
                                      (3,"1º2'3''","3º2'1''",40,"Privado","Tipo 1",2),(4,"1º2'3''","3º2'1''",40,"público","Tipo 1",2);
INSERT INTO `FS_FoodAccessContinuity` VALUES (1,"enero,febrero,marzo,abril,mayo,junio,julio,agosto,septiembre,octubre,noviembre,diciembre",4,"Refrigerado",1),
                                              (2,"enero,febrero,marzo,abril",3,"No Refrigerado",2); 
INSERT INTO `FS_OwnCultivationFoodType`  (Type) VALUES ("Tipo 1"),("Tipo 2");
INSERT INTO `FS_OwnCultivationFoodType_has_Community` VALUES (1,1),(2,2);        
INSERT INTO `FS_GrainConservation` (ConservationTec) VALUES ("Colector Solar"),("Radiación Solar");
INSERT INTO `FS_GrainConservation_has_Community` VALUES (1,2),(2,1);
INSERT INTO `FS_GrainMill` VALUES (1,12.4,"YES","YES",1),(2,12.4,"YES","YES",1), 
                                         (3,12.6,"NO","NO",2),(4,11.4,"YES","YES",2);

---------------------

INSERT INTO `People` (Sex,Workshop,Community_idCommunity) VALUES ("Mujer","Taller Mujeres",1),
                                                                ("Mujer","Taller Mujeres",1),
                                                                ("Mujer","Taller Mujeres",1),
                                                                ("Mujer","Taller Mujeres",2),
                                                                ("Mujer","Taller Mujeres",2),
                                                                ("Mujer","Taller Mujeres",2),
                                                                ("Hombre","Taller General",1),
                                                                ("Hombre","Taller General",2);
INSERT INTO `InterviewedCenter`(CenterType,Community_idCommunity) VALUE ("Centro 1",1),
                                                                        ("Centro 1",1),
                                                                        ("Centro 2",1),
                                                                        ("Centro 2",1),
                                                                        ("Centro 1",2),
                                                                        ("Centro 2",2),
                                                                        ("Centro 2",2),
                                                                        ("Centro 2",2);

--------------------                                                                                                 

SET SQL_SAFE_UPDATES = 1;