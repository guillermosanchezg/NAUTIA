-- ----------------------------------------------
-- CÁLCULOS DERIVADOS DE LOS DATOS DE CONTEXTO --
-- ----------------------------------------------

-- ----------------------------------------------
-- Datos Fisicos y Medioambientales            --
-- ----------------------------------------------


-- Desnivel del asentamiento
SELECT ((UpperBound)-(LowerBound)) AS "Desnivel(m)", name AS Comunidad, idCommunity 
FROM fa_topography t INNER JOIN community c ON t.Community_idCommunity = c.idCommunity
GROUP BY idCommunity;

-- Desnivel Freatico
SELECT ((LowerBound)-(PhreaticLevel)) AS "Desnivel(m)", name AS Comunidad, idCommunity 
FROM fa_topography t INNER JOIN fa_geographicidentification g ON t.Community_idCommunity = g.Community_idCommunity
					INNER JOIN community c ON t.Community_idCommunity = c.idCommunity
GROUP BY idCommunity;

-- Desnivel de los lagos y rios
SELECT type AS recurso, (Bound-((UpperBound)-(LowerBound)/2)) AS "Desnivel(m)", name AS Comunidad, idCommunity 
FROM fa_naturalresource n INNER JOIN fa_topography t ON n.Community_idCommunity = t.Community_idCommunity
							LEFT JOIN community c ON n.Community_idCommunity = c.idCommunity
							LEFT JOIN camp ON c.idCommunity = camp.idCamp
WHERE idCamp IS NOT NULL
GROUP BY idCommunity,idFA_NaturalResource;