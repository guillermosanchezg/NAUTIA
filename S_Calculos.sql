-- ----------------------------------------------
-- CÁLCULOS DERIVADOS DE LOS DATOS DE CONTEXTO --
-- ----------------------------------------------

-- ----------------------------------------------
-- Datos de Servicios				           --
-- ----------------------------------------------

-- Numero de centros por tipo de centros y comunidad
SELECT EducationType AS "Tipo Centro", COUNT(idS_EducationalCenter) AS "Numero de centros",name AS Comunidad, idCommunity
FROM s_educationalcenter ec INNER JOIN community c ON ec.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,EducationType;

-- Cordenadas de cada centro
SELECT EducationType AS "Tipo Centro", Latitude, longitude, Altitude,name AS Comunidad, idCommunity
FROM s_educationalcenter ec INNER JOIN community c ON ec.Community_idCommunity = c.idCommunity
ORDER BY idCommunity,EducationType;

-- Ratio /profesor por centro
SELECT EducationType AS "Tipo Centro", Students AS alumnos, teachers AS profesores,(Students/Teachers) AS Ratio,name AS Comunidad, idCommunity
FROM s_educationalcenter ec INNER JOIN community c ON ec.Community_idCommunity = c.idCommunity
ORDER BY idCommunity,EducationType;

-- Ratio /profesor por comunidad y tipo de centro
SELECT EducationType AS "Tipo Centro", AVG(Students) AS alumnos, AVG(teachers) AS Profesores,(AVG(Students)/AVG(Teachers)) AS Ratio,name AS Comunidad, idCommunity
FROM s_educationalcenter ec INNER JOIN community c ON ec.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,EducationType;

-- hosras de estudio por comunidad y tipo de centro
SELECT EducationType AS "Tipo Centro", AVG(Students) AS alumnos, AVG(teachers) AS Profesores,(AVG(Students)/AVG(Teachers)) AS Ratio,name AS Comunidad, idCommunity
FROM s_educationalcenter ec INNER JOIN community c ON ec.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,EducationType;

-- hosras de estudio por comunidad y tipo de centro
SELECT *
FROM s_educationalcenter ec INNER JOIN community c ON ec.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,EducationType;


-- Numero de escuelas por material
SELECT Material, COUNT(idS_EducationalCenter) AS "Numero de escuelas",name AS Comunidad, idCommunity
FROM s_educationalcenter ec INNER JOIN community c ON ec.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,Material;

SELECT idS_EducationalCenter, EducationType, Subject, SubjectType,name AS Comunidad,idCommunity
FROM s_educationalcenter ec INNER JOIN s_subject_has_s_educationacenter subhas ON ec.idS_EducationalCenter = subhas.S_EducationaCenter_Community_idCommunity
							INNER JOIN s_subject sub ON subhas.S_Subject_idS_Subject = sub.idS_Subject
							INNER JOIN community c ON ec.Community_idCommunity = c.idCommunity
ORDER BY idCommunity;

-- Hora de comienzo y final de las escuelas
SELECT idS_EducationalCenter AS idCentro,EducationType AS "Tipo Centro", TimeStart AS "Hora Cominezo", TimeFinish AS "Hora Final",name AS Comunidad, idCommunity
FROM s_educationalcenter ec INNER JOIN community c ON ec.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,EducationType;

-- Calidad constructiva centros educativos (Se completa por APP)
SELECT idS_EducationalCenter AS idCentro, NoFiltrationRoof,SecureStructured,ThermalConfort,ClimaticHazard,name As comunidad, idCommunity 
FROM s_buildingquality bq INNER JOIN s_educationalcenter ec ON bq.idS_BuildingQuality = ec.S_BuildingQuality_idS_BuildingQuality
							INNER JOIN community c ON ec.Community_idCommunity = c.idCommunity;
							
-- pocerntaje de escuelas con buena calidad constructiva (Se hace por APP)

-- Acceso a medicinas
SELECT COUNT(idS_MedicineAccess) AS Personas, name as Comunidad, idCommunity
FROM s_medicineaccess ma INNER JOIN community c ON ma.Community_idCommunity = c.idcommunity
GROUP BY idCommunity;

-- Calidad constructiva centros atencionprimaria (Se completa por APP)
SELECT idS_PrimaryAttention AS idCentro, NoFiltrationRoof,SecureStructured,ThermalConfort,ClimaticHazard,name As comunidad, idCommunity 
FROM s_buildingquality bq INNER JOIN s_primaryattention sp ON bq.idS_BuildingQuality = sp.S_BuildingQuality_idS_BuildingQuality
							INNER JOIN community c ON sp.Community_idCommunity = c.idCommunity;

-- Calidad constructiva centros Hospitales (Se completa por APP)
SELECT idS_Hospital AS idCentro, NoFiltrationRoof,SecureStructured,ThermalConfort,ClimaticHazard,name As comunidad, idCommunity 
FROM s_buildingquality bq INNER JOIN s_hospital h ON bq.idS_BuildingQuality = h.S_BuildingQuality_idS_BuildingQuality
							INNER JOIN community c ON h.Community_idCommunity = c.idCommunity;

-- pocerntaje de hospitales y centros de atención primaria con buena calidad constructiva (Se hace por APP)
-- Consulta parcial

SELECT idS_Cementery AS idCementerio, Drainage AS Drenaje, UpperBound AS Cota, name AS Comunidad, idCommunity
FROM s_cementery cem INNER JOIN community c ON cem.Community_idCommunity = c.idCommunity
ORDER BY idCommunity;

-- Conocimientos tecnológicos a nivel usuario
SELECT knowlegeType AS "Conocimiento", COUNT(idS_Tecknowlege) AS Personas, name AS comunidad, idCommunity
FROM s_tecknowlege tk INNER JOIN s_tecknowlege_has_community thas ON tk.idS_Tecknowlege = thas.S_Tecknowlege_idS_Tecknowlege
						INNER JOIN community c ON thas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,knowlegeType;

-- Conocimientos en lenguajes de programación
SELECT Language, COUNT(idS_ProgramingKnowlege) Personas, name AS comunidad, idCommunity
FROM s_programingknowlege pg INNER JOIN s_programingknowlege_has_community pghas ON pg.idS_ProgramingKnowlege = pghas.S_ProgramingKnowlege_idS_ProgramingKnowlege
								INNER JOIN community c ON pghas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity, language;

--  Numero de personas por tipo de hardware
SELECT HardWareType AS Dispositivo, COUNT(idS_HardwareAccesibility) AS Personas, name AS comunidad, idCommunity
FROM s_hardwareaccesibility ha INNER JOIN s_hardwareaccesibility_has_community hahas ON ha.idS_HardwareAccesibility = hahas.S_HardwareAccesibility_idS_HardwareAccesibility
						INNER JOIN community c ON hahas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,HardWareType;

--  Numero de personas por tipo de SO
SELECT OperativeSystem AS Dispositivo, COUNT(idS_HardwareAccesibility) AS Personas, name AS comunidad, idCommunity
FROM s_hardwareaccesibility ha INNER JOIN s_hardwareaccesibility_has_community hahas ON ha.idS_HardwareAccesibility = hahas.S_HardwareAccesibility_idS_HardwareAccesibility
						INNER JOIN community c ON hahas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,OperativeSystem;

--  Numero de personas por tipo de hardware y sistema operativo
SELECT HardWareType AS Dispositivo,OperativeSystem, COUNT(idS_HardwareAccesibility) AS Personas, name AS comunidad, idCommunity
FROM s_hardwareaccesibility ha INNER JOIN s_hardwareaccesibility_has_community hahas ON ha.idS_HardwareAccesibility = hahas.S_HardwareAccesibility_idS_HardwareAccesibility
						INNER JOIN community c ON hahas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,HardWareType,OperativeSystem;

-- Numero de personas por app
SELECT App, COUNT(idS_App_has_Community) AS Personas, name AS Comunidad, idCommunity
FROM s_app app INNER JOIN s_app_has_community apphas ON app.idS_App = apphas.S_App_idS_App
						INNER JOIN community c ON apphas.Community_idCommunity = c.idCommunity
WHERE Use_Necesity = 'USE'
GROUP BY idCommunity, App;

-- Numero de personas por necesidad de app
SELECT App, COUNT(idS_App_has_Community) AS Personas, name AS Comunidad, idCommunity
FROM s_app app INNER JOIN s_app_has_community apphas ON app.idS_App = apphas.S_App_idS_App
						INNER JOIN community c ON apphas.Community_idCommunity = c.idCommunity
WHERE Use_Necesity = 'Necesity'
GROUP BY idCommunity, App;