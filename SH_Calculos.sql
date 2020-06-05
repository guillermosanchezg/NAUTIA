-- ----------------------------------------------
-- CÁLCULOS DERIVADOS DE LOS DATOS DE CONTEXTO --
-- ----------------------------------------------

-- ----------------------------------------------
-- Datos de Alojamiento				           --
-- ----------------------------------------------

-- Hacinamiento de la población (Consulta parcial, se termina por APP)
-- Personas por vivienda se obtiene de SE_Calculos 
SELECT AVG(Rooms) AS "Estancias indepes",((AVG(Women)+AVG(Men)+AVG(Teenagers)+AVG(Kids))/4) AS Personas, name AS Comunidad, idCommunity
FROM sh_house h INNER JOIN community c ON h.Community_idCommunity = c.idCommunity
				LEFT JOIN se_householdcomposition hp ON h.idSH_House = hp.idSE_HouseHoldComposition
GROUP BY idCommunity;

/*SELECT COUNT(*), name AS Comunidad, idCommunity
FROM sh_house h INNER JOIN community c ON h.Community_idCommunity = c.idCommunity
WHERE GasTight = 1
GROUP BY idCommunity;

SELECT COUNT(*), name AS Comunidad, idCommunity
FROM sh_house h INNER JOIN community c ON h.Community_idCommunity = c.idCommunity
WHERE SecureStructured = 1
GROUP BY idCommunity;

SELECT COUNT(*), name AS Comunidad, idCommunity
FROM sh_house h INNER JOIN community c ON h.Community_idCommunity = c.idCommunity
WHERE ClimateThreatProtect = 1
GROUP BY idCommunity;

SELECT COUNT(*), name AS Comunidad, idCommunity
FROM sh_house h INNER JOIN community c ON h.Community_idCommunity = c.idCommunity
WHERE NoHumidity = 1
GROUP BY idCommunity;

SELECT COUNT(*), name AS Comunidad, idCommunity
FROM sh_house h INNER JOIN community c ON h.Community_idCommunity = c.idCommunity
WHERE NoAnimals = 1
GROUP BY idCommunity;

SELECT COUNT(*), name AS Comunidad, idCommunity
FROM sh_house h INNER JOIN community c ON h.Community_idCommunity = c.idCommunity
WHERE LT30Dregrees = 1
GROUP BY idCommunity;


SELECT UpgradingType, COUNT(*) Veces, Community_idCommunity
FROM sh_house h INNER JOIN sh_upgrading_has_sh_house uphas ON h.idSH_House = uphas.SH_House_idSH_House
				INNER JOIN sh_upgrading up ON uphas.SH_Upgrading_idSH_Upgrading = up.idSH_Upgrading
GROUP BY Community_idCommunity,UpgradingType;*/
				
