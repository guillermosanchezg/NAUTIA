-- ----------------------------------------------
-- CÁLCULOS DERIVADOS DE LOS DATOS DE CONTEXTO --
-- ----------------------------------------------



-- ----------------------------------------------
-- Datos Sociales y Económicos                 --
-- ----------------------------------------------


-- Composición familiar

SELECT Community_idCommunity as Community, AVG (Women) as "Mujeres Adultas", AVG(MEN) as "Hombres adultos", AVG (Teenagers) as "Jóvenes", AVG (Kids) as "Niños"
FROM se_householdcomposition 
GROUP BY se_householdcomposition.Community_idCommunity;

-- Sensación de seguridad en el asentamiento

SELECT Place_Time as "Lugar", COUNT(idSE_SafetyPlace_has_Community) as "Respustas afirmativas", name AS Community, Community_idCommunity AS idCommunity
FROM se_safetyplace se1 INNER JOIN  se_safetyplace_has_community se2  
							ON se1.idSE_SafetyPlace  = se2.SE_SafetyPlace_idSE_SafetyPlace
                        INNER JOIN community c ON se2.Community_idCommunity = c.idCommunity
WHERE Answer = 'YES'
GROUP BY se2.Community_idCommunity, se1.idSE_SafetyPlace;



-- INCOMPLETA FALTA CONTEMPLAR LA EXCEPCIÓN DE LA PARCELA/VIVIENDA
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
	) AS Porcentaje
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
GROUP BY sl1.Community_idCommunity;

-- --Iluminación

SELECT sl1.Community_idCommunity AS idCommunity, Name AS Nombre, COUNT(sl1.idSE_SafetyLatrines) AS "Total Respuestas",			
	(SELECT COUNT(sl3.Light)
		FROM se_safetylatrines sl3
        WHERE sl3.Light = "YES" AND sl3.Community_idCommunity = sl1.Community_idCommunity) AS Afirmativas,
	(SELECT COUNT(sl2.Light)*100/count(sl1.idSE_SafetyLatrines)
		FROM se_safetylatrines sl2
		WHERE sl2.Light = "YES" AND sl2.Community_idCommunity = sl1.Community_idCommunity) AS Porcentaje
FROM se_safetylatrines sl1 INNER JOIN community c ON sl1.Community_idCommunity = c.idCommunity 
GROUP BY sl1.Community_idCommunity;

-- --Fuentes de ingresos

-- ----Ingresos Mujeres por fuente de ingresos

SELECT it1.Type AS "Tipo de Ingreso", count(Sex) AS Mujeres, AVG (IncomeValue) AS AVGIngresos, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Mujer'
GROUP BY Community_idCommunity,idSE_IncomeType;

-- ----Ingresos Hombres por fuente de ingresos

SELECT it1.Type AS "Tipo de Ingreso", count(Sex) AS Hombres, AVG (IncomeValue) AS AVGIngresos, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Hombre'
GROUP BY Community_idCommunity,idSE_IncomeType;

-- ----Ingresos totales por fuente de ingresos

SELECT it1.Type AS "Tipo de Ingreso", count(Sex) AS Total, AVG (IncomeValue) AS AVGIngresos, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity,idSE_IncomeType;

-- ---- Ingresos totales Mujeres

SELECT AVG (IncomeValue) AS 'AVGIngresos Mujeres' , name AS Comunidad, idCommunity 
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

-- ---- Ingresos totales 

SELECT AVG (IncomeValue) AS 'AVGIngresos Totales',sex, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity,sex;

SELECT AVG (IncomeValue) AS 'AVGIngresos Totales' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity;

-- ---- Ingresos Per Capita Mujeres

SELECT Type AS Ingreso, (AVG (IncomeValue)/30 + BasicBasketCost/30) AS 'Ingresos Per Capita Mujeres' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Mujer'                        
GROUP BY idCommunity,Sex,idSe_incometype;


SELECT Type AS Ingreso, (AVG (IncomeValue)/30 + BasicBasketCost/30) AS 'Ingresos Per Capita Hombres' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Hombre'                        
GROUP BY idCommunity,Sex,idSe_incometype;

SELECT Type AS Ingreso, (AVG (IncomeValue)/30 + BasicBasketCost/30) AS 'Ingresos Per Capita',sex, name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity                        
GROUP BY idCommunity,idSe_incometype,sex;


SELECT Type AS Ingreso, (AVG (IncomeValue)/30 + BasicBasketCost/30) AS 'Ingresos Per Capita' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity                        
GROUP BY idCommunity,idSe_incometype;


-- ------------
-- Ingresos per capita = a linea de pobreza
-- TOTALMENTE INCOMPLETO
-- ------------
SELECT Type AS Ingreso, COUNT () AS 'Ingresos Per Capita Mujeres' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
                        INNER JOIN
WHERE Sex = 'Mujer' AND (AVG (IncomeValue)/30 + BasicBasketCost/30)                        
GROUP BY idCommunity,Sex,idSe_incometype;


SELECT Type AS Ingreso, (AVG (IncomeValue)/30 + BasicBasketCost/30) AS 'Ingresos Per Capita Hombres' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Hombre'                        
GROUP BY idCommunity,Sex,idSe_incometype;

SELECT Type AS Ingreso, (AVG (IncomeValue)/30 + BasicBasketCost/30) AS 'Ingresos Per Capita' , name AS Comunidad, idCommunity 
FROM SE_IncomeType it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity                        
GROUP BY idCommunity,idSe_incometype;


SELECT *
FROM se_incometype it1 INNER JOIN se_incometype_has_community it2 ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
						INNER JOIN se_economy eco ON it2.Community_idCommunity = eco.Community_idCommunity
						INNER JOIN community c ON it2.Community_idCommunity = c.idCommunity
ORDER BY idCommunity;
                        
SELECT Type as INGRESO, COUNT(SEX), Community_idCommunity 
FROM se_incometype it1 INNER JOIN se_incometype_has_community it2 
						ON It1.idSE_IncomeType = it2.SE_IncomeType_idSE_IncomeType
WHERE sex = 'Mujer'
GROUP BY Community_idCommunity,idSE_IncomeType;

-- -------------------
-- -------------------

SELECT type Gasto, AVG (ExpenseValue) AS 'AVGGastos Mujeres', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Mujer'
GROUP BY Community_idCommunity, idSE_ExpenseType,Sex;

SELECT type Gasto, AVG (ExpenseValue) AS 'AVGGastos Hombres', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
WHERE Sex = 'Hombre'
GROUP BY Community_idCommunity, idSE_ExpenseType,Sex;

SELECT type Gasto, AVG (ExpenseValue) AS 'AVGGastos', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity, idSE_ExpenseType;

SELECT type Gasto, AVG(ExpenseValue) AS 'AVGGastos',sex, name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity,sex;

SELECT type Gasto, AVG (ExpenseValue) AS 'AVGGastos', name AS Comunidad, idCommunity 
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity
GROUP BY Community_idCommunity;



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







SELECT *
FROM se_expensetype et1 INNER JOIN se_expensetype_has_community et2 ON et1.idSE_ExpenseType = et2.SE_ExpenseType_idSE_ExpenseType
						INNER JOIN community c ON et2.Community_idCommunity = c.idCommunity;








