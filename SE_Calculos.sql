-- ----------------------------------------------
-- CÁLCULOS DERIVADOS DE LOS DATOS DE CONTEXTO --
-- ----------------------------------------------

-- ----------------------------------------------
-- Datos Sociales y Económicos                 --
-- ----------------------------------------------


-- Composición familiar
SELECT idCommunity, name as Comunidad, AVG (Women) as "Mujeres Adultas", AVG(MEN) as "Hombres adultos", AVG (Teenagers) as "Jóvenes", AVG (Kids) as "Niños"
FROM se_householdcomposition HC INNER JOIN community C ON HC.Community_idCommunity = C.idCommunity
GROUP BY Community_idCommunity;

-- Sensación de seguridad en el asentamiento

-- --Afirmativas por comunidad y lugar
SELECT Place_Time as "Lugar", COUNT(idSE_SafetyPlace_has_Community) as "Respustas afirmativas", name AS Community, Community_idCommunity AS idCommunity
FROM se_safetyplace se1 INNER JOIN  se_safetyplace_has_community se2 ON se1.idSE_SafetyPlace  = se2.SE_SafetyPlace_idSE_SafetyPlace
                        INNER JOIN community c ON se2.Community_idCommunity = c.idCommunity
WHERE Answer = 'YES'
GROUP BY Community_idCommunity, idSE_SafetyPlace;

-- --Total Respuestas
SELECT  COUNT(idSE_SafetyPlace_has_Community) as "Total Respustas", name AS Community, Community_idCommunity AS idCommunity
FROM se_safetyplace se1 INNER JOIN  se_safetyplace_has_community se2 ON se1.idSE_SafetyPlace = se2.SE_SafetyPlace_idSE_SafetyPlace
                        INNER JOIN community c ON se2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity;


-- -- Sensación de seguridad
-- ---- INCOMPLETA FALTA CONTEMPLAR LA EXCEPCIÓN DE LA PARCELA/VIVIENDA
SELECT sp1.Community_idCommunity AS community, COUNT(sp1.idSE_SafetyPlace_has_Community) AS "Total Respuestas",
	(
		SELECT COUNT(sp3.Answer)
		FROM se_safetyplace_has_community sp3
		WHERE sp3.answer = "YES" AND sp3.Community_idCommunity = sp1.Community_idCommunity
	) AS Afirmativas,
	(
		SELECT COUNT(sp2.Answer)*100/COUNT(sp1.idSE_SafetyPlace_has_Community)
		FROM se_safetyplace_has_community sp2
		WHERE sp2.Answer = "YES" AND sp2.Community_idCommunity = sp1.Community_idCommunity
	) AS "Sensacion de seguridad (%)"
FROM se_safetyplace_has_community sp1
GROUP BY sp1.Community_idCommunity;

-- Seguridad en letrinas

-- -- Separadas por sexo
SELECT sl1.Community_idCommunity AS idCommunity, Name AS Nombre, COUNT(sl1.idSE_SafetyLatrines) AS "Total Respuestas",			
	(
		SELECT COUNT(sl3.SeparatedBySex)
		FROM se_safetylatrines sl3
        WHERE sl3.SeparatedBySex = "YES" AND sl3.Community_idCommunity = sl1.Community_idCommunity
	) AS Afirmativas,
	(
		SELECT COUNT(sl2.SeparatedBySex)*100/count(sl1.idSE_SafetyLatrines)
		FROM se_safetylatrines sl2
		WHERE sl2.SeparatedBySex = "YES" AND sl2.Community_idCommunity = sl1.Community_idCommunity
	) AS Porcentaje
FROM se_safetylatrines sl1 INNER JOIN community c ON sl1.Community_idCommunity = c.idCommunity 
GROUP BY idCommunity;

-- --Iluminación
SELECT sl1.Community_idCommunity AS idCommunity, Name AS Nombre, COUNT(sl1.idSE_SafetyLatrines) AS "Total Respuestas",			
	(
		SELECT COUNT(sl3.Light)
			FROM se_safetylatrines sl3
			WHERE sl3.Light = "YES" AND sl3.Community_idCommunity = sl1.Community_idCommunity
	)AS Afirmativas,
	(
		SELECT COUNT(sl2.Light)*100/count(sl1.idSE_SafetyLatrines)
			FROM se_safetylatrines sl2
			WHERE sl2.Light = "YES" AND sl2.Community_idCommunity = sl1.Community_idCommunity
	) AS Porcentaje
FROM se_safetylatrines sl1 INNER JOIN community c ON sl1.Community_idCommunity = c.idCommunity 
GROUP BY idCommunity;

-- --Fuentes de ingresos
-- ----Ingresos Mujeres por fuente de ingresos
SELECT Type AS "Tipo de Ingreso", count(Sex) AS Mujeres, AVG (IncomeValue) AS AVGIngresos, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Mujer'
GROUP BY Community_idCommunity,idSE_IncomeType;

-- ----Ingresos Hombres por fuente de ingresos
SELECT Type AS "Tipo de Ingreso", count(Sex) AS Hombres, AVG (IncomeValue) AS AVGIngresos, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Hombre'
GROUP BY Community_idCommunity,idSE_IncomeType;

-- ----Ingresos por sexo y por fuente de ingresos
SELECT Type AS Ingreso, COUNT(Sex) "Total Personas", AVG(IncomeValue) AS 'AVGIngresos Totales',sex, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity,idSE_IncomeType,sex;

-- ----Ingresos totales por fuente de ingresos
SELECT it1.Type AS "Tipo de Ingreso", count(Sex) AS Total, AVG(IncomeValue) AS AVGIngresos, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity,idSE_IncomeType;

-- ---- Ingresos totales Mujeres
SELECT AVG(IncomeValue) AS 'AVGIngresos Mujeres' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Mujer'
GROUP BY Community_idCommunity,Sex;

-- ---- Ingresos totales Hombres
SELECT AVG (IncomeValue) AS 'AVGIngresos Hombres' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Hombre'
GROUP BY Community_idCommunity,Sex;

-- ---- Ingresos totales  por sexo
SELECT AVG(IncomeValue) AS 'AVGIngresos Totales',sex, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity,sex;

-- ---- Ingresos totales por comunidad (Seguramente se resuelva por aplicación)
SELECT 
	(
		(
			(
				SELECT AVG(IncomeValue) 
				FROM SE_IncomeType it11 INNER JOIN se_incometype_has_community it22 ON It11.idSE_IncomeType = it22.SE_IncomeType_idSE_IncomeType
				WHERE Sex = 'Mujer'
			)+
			(
				SELECT AVG(IncomeValue) 
				FROM SE_IncomeType it111 INNER JOIN se_incometype_has_community it222 ON It111.idSE_IncomeType = it222.SE_IncomeType_idSE_IncomeType
				WHERE Sex = 'Hombre'
			)
		)/2
	) AS 'AVGIngresos Totales' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
GROUP BY idCommunity;

-- ---- Ingresos Per Capita Mujeres
SELECT Type AS Ingreso, (AVG (IncomeValue)/30 + BasicBasketCost/30) AS 'Ingresos Per Capita Mujeres' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Mujer'                        
GROUP BY idCommunity,Sex,idSe_incometype;

-- ---- Ingresos Per Capita Hobres
SELECT Type AS Ingreso, (AVG (IncomeValue)/30 + BasicBasketCost/30) AS 'Ingresos Per Capita Hombres' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Hombre'                        
GROUP BY idCommunity,Sex,idSe_incometype;

-- ---- Ingresos Per Capita por sexo
SELECT Type AS Ingreso, (AVG (IncomeValue)/30 + BasicBasketCost/30) AS 'Ingresos Per Capita',sex, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity                        
GROUP BY idCommunity,idSe_incometype,sex;

-- ---- Ingresos Per Capita Promedio (Resolver por APP)
SELECT Type AS Ingreso, (AVG (IncomeValue)/30 + BasicBasketCost/30) AS 'Ingresos Per Capita' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity                        
GROUP BY idCommunity,idSe_incometype;


-- ------------
-- Ingresos per capita = a linea de pobreza
-- Consulta que implica muchos INNER JOIN o muchos productos cartesianos. 
-- Se resuelve por Aplicación guardando lo resultados parciales en variables.
-- ------------

-- --Linea de pobreza por pais
SELECT PovertyLine
FROM gd_economy
GROUP BY Country_idCountry;

-- --Ingresos per capita por fuente de ingreso, persona y comunidad
SELECT idSE_IncomeType_has_Community ,Type AS Ingreso, ((IncomeValue)/30 + BasicBasketCost/30) AS 'Ingreso Per Capita',sex, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity                        
ORDER BY idSE_IncomeType_has_Community,idCommunity,idSe_incometype,sex;

-- --Pais del campamento
SELECT idCommunity,name,idCountry, CountryName
FROM community c INNER JOIN camp  ON c.idCommunity = camp.Community_idCommunity
				INNER JOIN Country_has_Camp CaCo ON camp.idCamp = CaCo.Camp_idCamp
                INNER JOIN Country ON Country.idCountry = CaCo.Country_idCountry;
                
-- --Pais de la comunidad de acogodia
SELECT idCommunity,name,idCountry, CountryName
FROM community c INNER JOIN hostcommunity HC  ON c.idCommunity = HC.Community_idCommunity
                INNER JOIN Country ON Country.idCountry = HC.Country_idCountry;

-- Gastos

-- --Gasto mujeres por tipo de gasto al mes
SELECT type Gasto, AVG (ExpenseValue) AS 'AVGGastos Mujeres', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Mujer'
GROUP BY Community_idCommunity, idSE_ExpenseType,Sex;

-- --Gasto hombres por tipo de gasto al mes
SELECT type Gasto, AVG (ExpenseValue) AS 'AVGGastos Hombres', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Hombre'
GROUP BY Community_idCommunity, idSE_ExpenseType,Sex;

-- --Gasto por sexo por tipo de gasto al mes
SELECT type Gasto, AVG (ExpenseValue) AS 'AVGGastos',sex, name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity, idSE_ExpenseType,Sex;

-- --Gasto por tipo de gasto (Probablemente se resuelva por app)
SELECT type Gasto, AVG (ExpenseValue) AS 'AVGGastos', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity, idSE_ExpenseType;

-- --Gasto por comunidad y sexo (Probablemente se resuelva por app)
SELECT type Gasto, AVG(ExpenseValue) AS 'AVGGastos',sex, name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity,sex;

-- --Gasto por comunidad (Probablemente se resuelva por app)
SELECT type Gasto, AVG (ExpenseValue) AS 'AVGGastos', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity;


-- --Capacidad de Ahorro Mujeres
SELECT  (
			AVG(ExpenseValue)-(
								SELECT AVG (IncomeValue) 
								FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
														INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
								WHERE Sex = 'Mujer'
							   )
		) AS 'Capacidad Ahorro Mujeres', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Mujer'
GROUP BY Community_idCommunity;

-- --Capacidad de ahorro Hombres
SELECT  (
			AVG(ExpenseValue)-(
								SELECT AVG (IncomeValue) 
								FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
														INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
								WHERE Sex = 'Hombre'
							   )
		) AS 'Capacidad Ahorro Hombre', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Hombre'
GROUP BY Community_idCommunity;

-- --Capacidad de ahorro total
SELECT  (
			AVG(ExpenseValue)-(
								SELECT AVG (IncomeValue) 
								FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
														INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
							   )
		) AS 'Capacidad Ahorro Mujeres', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity;


-- Prioridades de la población

-- ----Prioridades Mujeres
-- SELECT Type AS Prioridad, COUNT(idSE_priority) AS "Total Mujeres", Name AS Comunidad, idCommunity
-- FROM se_priority p INNER JOIN se_priority_has_community pc ON p.idSE_Priority = pc.SE_Priority_idSE_Priority
					-- INNER JOIN community c ON pc.Community_idCommunity = c.idCommunity
-- WHERE Sex = 'Mujer'
-- GROUP BY idCommunity,type,sex;

-- --Prioridades Hoambres
/*SELECT Type AS Prioridad, COUNT(idSE_priority) AS "Total Hombres", Name AS Comunidad, idCommunity
FROM se_priority p INNER JOIN se_priority_has_community pc ON p.idSE_Priority = pc.SE_Priority_idSE_Priority
					INNER JOIN community c ON pc.Community_idCommunity = c.idCommunity
WHERE Sex = 'Hombre'
GROUP BY idCommunity,type,sex;*/

/*-- --Prioridades por sexo
SELECT Type AS Prioridad,sex, COUNT(idSE_priority) AS "Total",sex, Name AS Comunidad, idCommunity
FROM se_priority p INNER JOIN se_priority_has_community pc ON p.idSE_Priority = pc.SE_Priority_idSE_Priority
					INNER JOIN community c ON pc.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,type,sex;

-- --Prioridades
SELECT Type AS Prioridad, COUNT(idSE_priority) AS "Total", Name AS Comunidad, idCommunity
FROM se_priority p INNER JOIN se_priority_has_community pc ON p.idSE_Priority = pc.SE_Priority_idSE_Priority
					INNER JOIN community c ON pc.Community_idCommunity = c.idCommunity
GROUP BY idCommunity,type;*/