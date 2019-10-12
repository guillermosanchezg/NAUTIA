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




