-- ----------------------------------------------
-- CÁLCULOS DERIVADOS DE LOS DATOS DE CONTEXTO --
-- ----------------------------------------------

-- ----------------------------------------------
-- Datos de Seguridad Alimetaria	           --
-- ----------------------------------------------

-- Acesso a comida --

-- Número de personas con acceso a comida por tipo de comida y comunidad
SELECT FoodType, COUNT(idFS_FoodAccess) AS Personas, name AS Comunidad, idCommunity
FROM fs_foodaccess fa INNER JOIN fs_foodaccess_has_community fahas ON fa.idFS_FoodAccess = fahas.FS_FoodAccess_idFS_FoodAccess
						INNER JOIN community c ON fahas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,FoodType;

-- Número de personas por número de comidas diarias
SELECT TimesPerDay AS "Veces diarias", COUNT(idFS_DailyMeal) As Personas, name AS comunidad, idCommunity
FROM fs_dailymeal dm INNER JOIN community c ON dm.Community_idCommunity = c.idCommunity
WHERE TimesPerDay < 4
GROUP BY idCommunity,TimesPerDay;

SELECT TimesPerDay AS "Veces diarias", COUNT(idFS_DailyMeal) As Personas, name AS comunidad, idCommunity
FROM fs_dailymeal dm INNER JOIN community c ON dm.Community_idCommunity = c.idCommunity
WHERE TimesPerDay > 3
GROUP BY idCommunity;

-- Numero de personas por comidad más importante del día y por comunidad
SELECT ImportantMeal AS "Comida", COUNT(idFS_DailyMeal) As Personas, name AS comunidad, idCommunity
FROM fs_dailymeal dm INNER JOIN community c ON dm.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,ImportantMeal;

-- Numero de personas por plato típico
SELECT Plate AS Plato, Kcal, COUNT(idFS_TypicalPlate) AS Personas, name AS Comunidad, idCommunity
FROM fs_typicalplate tp INNER JOIN fs_typicalplate_has_community tphas ON tp.idFS_TypicalPlate = tphas.FS_TypicalPlate_idFS_TypicalPlate
						INNER JOIN community c ON tphas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,Plate;


-- Ponderación de plato típico (Se resuelve por app)
SELECT Plate AS Plato,(kcal/100) AS "Kcal/1g"
FROM fs_typicalplate tp;

-- Numero de personas por fuente de alimento y comunidad
SELECT Source AS "Fuente de alimento", COUNT(idFS_FoodSource) AS Personas, name AS Comunidad, idCommunity 
FROM fs_foodsource FS INNER JOIN fs_foodsource_has_community fshas ON FS.idFS_FoodSource = fshas.FS_FoodSource_idFS_FoodSource
						INNER JOIN community c ON fshas.Community_idCommunity = c.idCommunity
GROUP BY idCommunity, Source;

SELECT *
FROM fs_foodsource FS INNER JOIN fs_foodsource_has_community fshas ON FS.idFS_FoodSource = fshas.FS_FoodSource_idFS_FoodSource
						INNER JOIN community c ON fshas.Community_idCommunity = c.idCommunity;


-- Porcentaje de población respecto del total por fuente principal de suministro de alimentos (Por app)


-- Corrales y huertos
-- Corrales por sistema de drenaje (Consulta parcial para obtener por app sistema predominante)
SELECT DrainageSystem, COUNT(idFS_CorralUbication), name as comunidad, idCommunity
FROM fs_corralubication cu INNER JOIN community c ON cu.Community_idCommunity = c.idCommunity
GROUP BY idCommunity, DrainageSystem;

-- Huertos por sistema de drenaje (Consulta parcial para obtener por app sistema predominante)
SELECT IrrigationSystem, COUNT(idFS_CropUbication), name as comunidad, idCommunity
FROM fs_cropubication cu INNER JOIN community c ON cu.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,IrrigationSystem;

SELECT *
FROM fs_cropubication cu INNER JOIN community c ON cu.Community_idCommunity = c.idCommunity;