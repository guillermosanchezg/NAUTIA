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
