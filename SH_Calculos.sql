-- ----------------------------------------------
-- CÁLCULOS DERIVADOS DE LOS DATOS DE CONTEXTO --
-- ----------------------------------------------

-- ----------------------------------------------
-- Datos de Alojamiento				           --
-- ----------------------------------------------

-- Hacinamiento de la población (Consulta parcial, se termina por APP)
-- Personas por vivienda se obtiene de SE_Calculos 
-- ARREGLAR ER y unificar HouseHoldComposition con Sh_house
SELECT AVG(Rooms) AS "Estancias indepes", name AS Comunidad, idCommunity
FROM sh_house h INNER JOIN community c ON h.Community_idCommunity = c.idCommunity
GROUP BY idCommunity;

SELECT *
FROM sh_house h INNER JOIN community c ON h.Community_idCommunity = c.idCommunity;