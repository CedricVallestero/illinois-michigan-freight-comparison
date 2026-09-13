/*
i will be using a similar code as the one i used previously but i will
adjust it so that it works in my azure sql database
*/

CREATE VIEW readable_freight_data AS
SELECT
	f.dms_origst,
	origin.state_name AS origin_state,
	f.dms_destst,
	destination.state_name AS destination_state,
	f.sctg2,
	c.commodity_name,
	f.dms_mode,
	f.trade_type,
	f.tons_2022,
	f.value_2022,
	m.description AS mode_name

FROM dbo.freight_data AS f

/*
im gonna write two separate joins for the states
since dms origsts implies origin state and
dms dms destst implies destination state
so i have to join them using two different
conditions
*/

JOIN dbo.state_codes AS origin 
	ON f.dms_origst = origin.state_number
JOIN dbo.state_codes AS destination
	ON f.dms_destst = destination.state_number
JOIN dbo.commodity_codes AS c
	ON f.sctg2 = c.sctg2
JOIN dbo.mode_codes AS m
	ON f.dms_mode = m.numeric_label;