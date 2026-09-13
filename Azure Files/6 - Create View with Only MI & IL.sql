CREATE VIEW il_mi_commodity_comparison AS
SELECT 
	origin_state, 
	commodity_name, 
	SUM(value_2022) AS total_value, 
	SUM(tons_2022) AS total_tons
FROM dbo.readable_freight_data
WHERE origin_state IN ('Illinois', 'Michigan')
GROUP BY origin_state, commodity_name;

/*
i picked two states, Michigan and Illinois
to analyze and here i am getting their aggregate 
values and tons of their respective commodities

mostly the same, just had to add dbo at the beginning for azure
*/