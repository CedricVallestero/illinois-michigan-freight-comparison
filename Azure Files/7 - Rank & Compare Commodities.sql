CREATE VIEW commodity_ranking AS
SELECT 
	origin_state, 
	commodity_name, 
	total_value, 
	total_tons,
	RANK() OVER (PARTITION BY origin_state ORDER BY total_value DESC) AS value_rank
FROM dbo.il_mi_commodity_comparison
ORDER BY origin_state, value_rank
OFFSET 0 ROWS;

/*
ranking the two states based on their 
value relative to their state 
(not to each other) as a refernce as to
what commodities each state ships out

i'll make it a view so this becomes
reusable in power bi

i just added offset 0 rows because i needed that so that it would work in azure sql database
*/