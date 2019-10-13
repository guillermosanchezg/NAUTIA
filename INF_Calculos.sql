-- CÁLCULOS DERIVADOS DE LOS DATOS DE CONTEXTO --
-- ----------------------------------------------



-- ----------------------------------------------
-- Datos De Infraestructuras		           --
-- ----------------------------------------------


-- INFRAESTRUCTURA DE AGUA --

-- Puntos de agua totales
SELECT COUNT(idINF_WaterPoint) AS "Puntos de Agua", Name AS Comunidad, idCommunity
FROM inf_waterpoint wp INNER JOIN community c ON wp.Community_idCommunity = c.idCommunity
GROUP BY idCommunity;

-- Puntos de agua en funcionamiento 
SELECT COUNT(idINF_WaterPoint) AS "Puntos de Agua en Funcionamiento", Name AS Comunidad, idCommunity
FROM inf_waterpoint wp INNER JOIN community c ON wp.Community_idCommunity = c.idCommunity
WHERE working = 'YES'
GROUP BY idCommunity;

SELECT * 
FROM inf_waterpoint wp INNER JOIN community c ON wp.Community_idCommunity = c.idCommunity;

-- -- Calidad del agua (Calculo derivado de las dos siguientes subconsultas, se resuelve por app)
SELECT WaterQuality AS Calidad, name AS Comunidad, idCommunity
FROM inf_waterinfrastructure wi INNER JOIN community c ON wi.Community_idCommunity = c.idCommunity;

SELECT AVG(DailyTimeSpent) AS "Tiempo diario", name AS Comunidad, idCommunity
FROM inf_timespent ts INNER JOIN inf_waterinfrastructure wi ON ts.INF_WaterInfrastructure_idINF_WaterInfrastructure = wi.idINF_WaterInfrastructure
						INNER JOIN community c ON wi.Community_idCommunity = c.idCommunity
GROUP BY idCommunity;

-- Numero de sistemas de riego operativos
SELECT COUNT(idIrrigatonSystem) AS "Total Operativos", name AS Comunidad, idCommunity
FROM inf_irrigatonsystem irs INNER JOIN community c ON irs.Community_idCommunity = c.idCommunity
GROUP BY idCommunity;

-- SANEAMIENTO Y DRENAJE --

-- Consultas parciales para el calculo de la calidad del sistema que se hace por aplicación
SELECT COUNT(*) AS "Letrinas con Losa", name AS Comunidad, idCommunity
FROM inf_sanitationsystemquality sq INNER JOIN community c ON sq.Community_idCommunity = c.idCommunity
WHERE LatrineQuality = 'con losa'
GROUP BY idCommunity;

SELECT COUNT(*) AS "Letrinas sin Losa", name AS Comunidad, idCommunity
FROM inf_sanitationsystemquality sq INNER JOIN community c ON sq.Community_idCommunity = c.idCommunity
WHERE LatrineQuality = 'sin losa'
GROUP BY idCommunity;

SELECT COUNT(*) AS "Letrinas con Losa y ventiladas", name AS Comunidad, idCommunity
FROM inf_sanitationsystemquality sq INNER JOIN community c ON sq.Community_idCommunity = c.idCommunity
WHERE LatrineQuality = 'con losa y ventilada'
GROUP BY idCommunity;

SELECT COUNT(*) AS "Sin Estructura estable", name AS Comunidad, idCommunity
FROM inf_sanitationsystemquality sq INNER JOIN community c ON sq.Community_idCommunity = c.idCommunity
WHERE BuildingQuality = 'Sin seguridad estructural'
GROUP BY idCommunity;

SELECT COUNT(*) AS "Con techo y paredes estables", name AS Comunidad, idCommunity
FROM inf_sanitationsystemquality sq INNER JOIN community c ON sq.Community_idCommunity = c.idCommunity
WHERE BuildingQuality = 'techo y paredes estables'
GROUP BY idCommunity;

SELECT COUNT(*) AS "Techo Paredes y Puerta", name AS Comunidad, idCommunity
FROM inf_sanitationsystemquality sq INNER JOIN community c ON sq.Community_idCommunity = c.idCommunity
WHERE BuildingQuality = 'Con techo paredes y puerta'
GROUP BY idCommunity;

SELECT COUNT(*) AS "Techo paredes cierre e iluminacion", name AS Comunidad, idCommunity
FROM inf_sanitationsystemquality sq INNER JOIN community c ON sq.Community_idCommunity = c.idCommunity
WHERE BuildingQuality = 'con techo paredes cierre e iluminacion'
GROUP BY idCommunity;

SELECT * 
FROM inf_sanitationsystemquality sq INNER JOIN community c ON sq.Community_idCommunity = c.idCommunity;

-- GESTION DE RESIDUOS --

SELECT COUNT(idINF_ColletionPoints) AS  "Puntos de Recogida", name AS comunidad, idCommunity
FROM inf_colletionpoints cp INNER JOIN community c ON cp.Community_idCommunity = c.idCommunity
GROUP BY idCommunity;

SELECT CollectionServicePerMonth AS "Recogida al mes", name AS Comunidad, idCommunity
FROM inf_wastemanagementginfrastructure wmi INNER JOIN community c ON wmi.Community_idCommunity = c.idCommunity;

-- Localización del vertedor (de la consulta se obtiene unos valores para hacer puntuación por app)
SELECT DistanceToHouses, DistanceToWaterResource, FertilEnviromentLocation, name AS Comunidad, idCommunity
FROM inf_landfill lf INNER JOIN community c ON lf.Community_idCommunity = c.idCommunity;


SELECT *
FROM inf_landfill lf INNER JOIN community c ON lf.Community_idCommunity = c.idCommunity;


-- ENERGIA --

-- DEMANDA OBJETIVO A CUBRIR POR LA RED ELECTRICA SE APLAZA DESARROLLO POR QUE NO ESTÁ CLARO SU DEFINICIÓN EN LA BBDD --
SELECT *
FROM inf_expandplanbeneficiaries expb1 INNER JOIN inf_expandplanbeneficiaries_has_inf_energyinfrastructure expb2 
												ON expb1.idINF_ExpandPlanBeneficiaries = expb2.INF_ExpandPlanBeneficiaries_idINF_ExpandPlanBeneficiaries;


-- Fuente de Generación

-- --Numero de personas por fuente de generación
SELECT Source AS "Fuente de Genereación",Sector, COUNT(idINF_GenerationSource_has_Community) AS "Total Personas", name AS Comunidad, idCommunity
FROM inf_generationsource gs INNER JOIN inf_generationsource_has_community gshas ON gs.idINF_GenerationSource = gshas.INF_GenerationSource_idINF_GenerationSource
								INNER JOIN community c ON gshas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity, Source, Sector;

-- --Numero de personas con acceso a la electricidad (Total de la consulta anterior)
SELECT COUNT(idINF_GenerationSource_has_Community) AS "Total Personas",Sector, name AS Comunidad, idCommunity
FROM inf_generationsource gs INNER JOIN inf_generationsource_has_community gshas ON gs.idINF_GenerationSource = gshas.INF_GenerationSource_idINF_GenerationSource
								INNER JOIN community c ON gshas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,Sector;

-- --Numero de horas por fuente de generación
SELECT Source AS "Fuente de Genereación",Sector, AVG(TimeAccessDay) AS "Horas Dia",AVG(TimeAccessNight) AS "Horas Noche", ((AVG(TimeAccessDay)+AVG(TimeAccessNight))/2) AS "AVG Horas", name AS Comunidad, idCommunity
FROM inf_generationsource gs INNER JOIN inf_generationsource_has_community gshas ON gs.idINF_GenerationSource = gshas.INF_GenerationSource_idINF_GenerationSource
								INNER JOIN community c ON gshas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,Source,Sector;

-- Gasto promedio por fuente de generacion 
SELECT Source AS "Fuente de Genereación",Sector, AVG(Cost) AS "Coste", name AS Comunidad, idCommunity
FROM inf_generationsource gs INNER JOIN inf_generationsource_has_community gshas ON gs.idINF_GenerationSource = gshas.INF_GenerationSource_idINF_GenerationSource
								INNER JOIN community c ON gshas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,Source,Sector;

-- Gasto promedio en fuentes de generacion 
SELECT Sector, AVG(Cost) AS "Coste", name AS Comunidad, idCommunity
FROM inf_generationsource gs INNER JOIN inf_generationsource_has_community gshas ON gs.idINF_GenerationSource = gshas.INF_GenerationSource_idINF_GenerationSource
								INNER JOIN community c ON gshas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,Sector;

-- Electrodomesticos por sector
SELECT ApplianceType AS Electrodomesticp, Sector, COUNT(idINF_Appliance_has_Community) AS Total, name AS Comunidad,idCommunity
FROM inf_appliance ap INNER JOIN inf_appliance_has_community aphas ON ap.idINF_Appliance = aphas.INF_Appliance_idINF_Appliance
						INNER JOIN community c ON aphas.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity, ApplianceType, sector;

-- Horas de uso de electrodomesticos por sector
SELECT ApplianceType AS Electrodomesticp, Sector, AVG(TimeUse) AS Total, name AS Comunidad,idCommunity
FROM inf_appliance ap INNER JOIN inf_appliance_has_community aphas ON ap.idINF_Appliance = aphas.INF_Appliance_idINF_Appliance
						INNER JOIN community c ON aphas.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity, ApplianceType, sector;

SELECT *
FROM inf_appliance ap INNER JOIN inf_appliance_has_community aphas ON ap.idINF_Appliance = aphas.INF_Appliance_idINF_Appliance
						INNER JOIN community c ON aphas.Community_idCommunity = c.idCommunity
ORDER BY Community_idCommunity, sector;

-- Porcentaje de negocios con acceso a electrodomesticos