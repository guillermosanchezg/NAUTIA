-- ----------------------------------------------
-- CÁLCULOS DERIVADOS DE LOS DATOS DE CONTEXTO --
-- ----------------------------------------------



-- ----------------------------------------------
-- Datos Sociales y Económicos                 --
-- ----------------------------------------------


-- Composición familiar campo de refugiados

SELECT AVG (Women) as "Mujeres Adultas", AVG(MEN) as "Hombres adultos", AVG (Teenagers) as "Jóvenes", AVG (Kids) as "Niños"
FROM se_householdcomposition
WHERE Community_idCommunity = 1;

-- Composición familiar comunidad de acogida

SELECT AVG (Women) as "Mujeres Adultas", AVG(MEN) as "Hombres adultos", AVG (Teenagers) as "Jóvenes", AVG (Kids) as "Niños"
FROM se_householdcomposition
WHERE Community_idCommunity = 2;

-- Sensación de seguridad en el asentamiento

SELECT se1.Place_Time as "Lugar", COUNT(se2.idSE_SafetyPlace_has_Community) as "Nº Respustas afirmativas", se2.Community_idCommunity
FROM se_safetyplace se1, se_safetyplace_has_community se2
WHERE se1.idSE_ComunitySafety  = se2.SE_SafetyPlace_idSE_ComunitySafety AND se2.Answer = 'YES'
GROUP BY se2.Community_idCommunity, se1.idSE_ComunitySafety;

SELECT se1.Place_Time, COUNT(se2.idSE_SafetyPlace_has_Community)
FROM se_safetyplace se1, se_safetyplace_has_community se2
WHERE se1.idSE_ComunitySafety  = se2.SE_SafetyPlace_idSE_ComunitySafety 
ORDER BY se1.idSE_ComunitySafety;

-- Seguridad en letrinas

SELECT COUNT(*)
FROM se_safetylatrines
WHERE SeparatedBySex = "YES";

SELECT COUNT(*)
FROM se_safetylatrines;


SELECT COUNT(*)
FROM se_safetylatrines
WHERE Light = "YES";

SELECT (SELECT COUNT(sl.SeparatedBySex)*100/count(se_safetylatrines.idSE_LatrinesBySex)
				FROM se_safetylatrines sl
                WHERE sl.SeparatedBySex = "YES") 
FROM se_safetylatrines
GROUP BY se_safetylatrines.Community_idCommunity;

SELECT se_safetylatrines.Community_idCommunity, 
		(SELECT COUNT(sl.Light)*100/COUNT(se_safetylatrines.idSE_LatrinesBySex)
			FROM se_safetylatrines sl
            WHERE sl.Light = "YES"
            GROUP BY sl.Community_idCommunity)
FROM se_safetylatrines
GROUP BY se_safetylatrines.Community_idCommunity;

SELECT * FROM se_safetylatrines;





