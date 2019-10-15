-- ----------------------------------------------
-- CÁLCULOS DERIVADOS DE LOS DATOS DE CONTEXTO --
-- ----------------------------------------------



-- ----------------------------------------------
-- Datos Urbanisticos				           --
-- ----------------------------------------------

SELECT  COUNT(Woodland_ShadedArea) AS "Areas Sombras y Arboles", name AS Comunidad, idCommunity
FROM u_recreationalarea ra INNER JOIN community c ON ra.Community_idCommunity = c.idCommunity
WHERE Woodland_ShadedArea = 1
GROUP BY idCommunity;

SELECT  COUNT(UrbanFurniture) AS "Areas Mobiliario Urbano", name AS Comunidad, idCommunity
FROM u_recreationalarea ra INNER JOIN community c ON ra.Community_idCommunity = c.idCommunity
WHERE Woodland_ShadedArea = 1
GROUP BY idCommunity;

SELECT  COUNT(Floor_DrainageSystem) AS "Areas Sistema Drenaje", name AS Comunidad, idCommunity
FROM u_recreationalarea ra INNER JOIN community c ON ra.Community_idCommunity = c.idCommunity
WHERE Floor_DrainageSystem = 1
GROUP BY idCommunity;

SELECT  COUNT(PSTrush) AS "Areas con basura", name AS Comunidad, idCommunity
FROM u_recreationalarea ra INNER JOIN community c ON ra.Community_idCommunity = c.idCommunity
WHERE PSTrush = 1
GROUP BY idCommunity;

SELECT  COUNT(idRecreationalArea) AS "Total Areas", name AS Comunidad, idCommunity
FROM u_recreationalarea ra INNER JOIN community c ON ra.Community_idCommunity = c.idCommunity
GROUP BY idCommunity;

-- --Areas de esparcimiento acondicionadas %
-- --Calculo que requiere consultas anteriores, se resuelve por app

select *
From u_recreationalarea ra INNER JOIN community c ON ra.Community_idCommunity = c.idCommunity;