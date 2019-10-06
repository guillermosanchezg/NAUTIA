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

SELECT se1.Place_Time as "Lugar", COUNT(se2.idSE_SafetyPlace_has_Community) as "Nº Respustas afirmativas", se1.idSE_ComunitySafety
FROM se_safetyplace se1, se_safetyplace_has_community se2
WHERE se1.idSE_ComunitySafety  = se2.SE_SafetyPlace_idSE_ComunitySafety AND se2.Community_idCommunity = 1 AND se2.Answer = 'YES'
ORDER BY se1.idSE_ComunitySafety;