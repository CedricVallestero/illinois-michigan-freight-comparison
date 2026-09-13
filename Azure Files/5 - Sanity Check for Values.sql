--here i will be checking for weird/inadmissable values

SELECT COUNT(*) AS negative_tons
FROM dbo.freight_data 
WHERE tons_2022 < 0;

--you cant have negative weight or value

SELECT COUNT(*) AS negative_values
FROM dbo.freight_data  
WHERE value_2022 < 0;

/*
im gonna check zeros too because
the government estimations may
 round down to zero
*/

SELECT COUNT(*) AS zero_tons
FROM dbo.freight_data  
WHERE tons_2022 = 0;

SELECT COUNT(*) AS zero_values
FROM dbo.freight_data 
WHERE value_2022 = 0;

/*
so there are 41 rows with a value
of zero but that's okay because its
value gets rounded down, but we have 
no zero_tons which is good because you
cant trade something weighing nothing

now lets check for values that are
unusually big
*/

SELECT 
	dms_origst, 
	dms_destst, 
	sctg2, 
	tons_2022, 
	value_2022
FROM dbo.freight_data 
ORDER BY value_2022 DESC
OFFSET 0 ROWS 
FETCH NEXT 10 ROWS ONLY;

SELECT 
	dms_origst, 
	dms_destst, 
	sctg2, 
	tons_2022, 
	value_2022
FROM dbo.freight_data 
ORDER BY tons_2022 DESC
OFFSET 0 ROWS 
FETCH NEXT 10 ROWS ONLY;

/*
i noticed the top row has like 238k tons
but like is valued at 3.4 mil so i checked

3.4 mil over 238k is roughly 14 bucks per ton
which seems on the lower side but i looked at the 
sctg2 and it said 31 equals Nonmetal min. prods. (like sand or cement or gravel)
which explains it bringing less value than the other rows
below it with less tons
*/