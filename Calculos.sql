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

SELECT se1.Place_Time as "Lugar", COUNT(se2.idSE_SafetyPlace_has_Community) as "Respustas afirmativas", se2.Community_idCommunity AS Community
FROM se_safetyplace se1, se_safetyplace_has_community se2
WHERE se1.idSE_SafetyPlace  = se2.SE_SafetyPlace_idSE_SafetyPlace AND se2.Answer = 'YES'
GROUP BY se2.Community_idCommunity, se1.idSE_SafetyPlace;

-- INCOMPLETA FALTA CONTEMPLAR LA EXCEPCIÓN DE LA PARCELA/VIVIENDA
SELECT sp1.Community_idCommunity AS community, COUNT(sp1.idSE_SafetyPlace_has_Community) AS "Total Respuestas",
								(SELECT COUNT(sp3.Answer)
									FROM se_safetyplace_has_community sp3
									WHERE sp3.answer = "YES" AND sp3.Community_idCommunity = sp1.Community_idCommunity) AS Afirmativas,
								(SELECT COUNT(sp2.Answer)*100/COUNT(sp1.idSE_SafetyPlace_has_Community)
									FROM se_safetyplace_has_community sp2
									WHERE sp2.Answer = "YES" AND sp2.Community_idCommunity = sp1.Community_idCommunity) AS Porcentaje
FROM se_safetyplace_has_community sp1
GROUP BY sp1.Community_idCommunity;

-- Seguridad en letrinas

-- -- Separadas por sexo

SELECT sl1.Community_idCommunity AS Community, COUNT(sl1.idSE_SafetyLatrines) AS "Total Respuestas",			
				(SELECT COUNT(sl3.SeparatedBySex)
					FROM se_safetylatrines sl3
                    WHERE sl3.SeparatedBySex = "YES" AND sl3.Community_idCommunity = sl1.Community_idCommunity) AS Afirmativas,
				(SELECT COUNT(sl2.SeparatedBySex)*100/count(sl1.idSE_SafetyLatrines)
					FROM se_safetylatrines sl2
					WHERE sl2.SeparatedBySex = "YES" AND sl2.Community_idCommunity = sl1.Community_idCommunity) AS Porcentaje
FROM se_safetylatrines sl1
GROUP BY sl1.Community_idCommunity;

-- --Iluminación

SELECT sl1.Community_idCommunity AS Community, COUNT(sl1.idSE_SafetyLatrines) AS "Total Respuestas",			
				(SELECT COUNT(sl3.Light)
					FROM se_safetylatrines sl3
                    WHERE sl3.Light = "YES" AND sl3.Community_idCommunity = sl1.Community_idCommunity) AS Afirmativas,
				(SELECT COUNT(sl2.Light)*100/count(sl1.idSE_SafetyLatrines)
					FROM se_safetylatrines sl2
					WHERE sl2.Light = "YES" AND sl2.Community_idCommunity = sl1.Community_idCommunity) AS Porcentaje
FROM se_safetylatrines sl1
GROUP BY sl1.Community_idCommunity;

-- --Fuentes de ingresos

SELECT it1.Type AS "Tipo de Ingreso",
	(SELECT COUNT(it2.Sex)
			FROM  SE_IncomeType_has_Community it2
            WHERE it2.Sex = "Mujer" AND it2.SE_IncomeType_idSE_IncomeType = it1.idSE_IncomeType
            ORDER BY  it2.Community_idCommunity)
FROM SE_IncomeType it1, SE_IncomeType_has_Community 
GROUP BY SE_IncomeType_has_Community.idSE_IncomeType, it1.idSE_IncomeType;








