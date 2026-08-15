/*
here im gonna make a view so that 
whoever is viewing my project can have
a reference that is pretty human readable
instead of just having state numbers
and stuff i'll be putting state names

im not gonna make a new table because
it duplicates data so it's inefficient
but with a view it still behaves like
a table but i dont have to join everytime
*/

CREATE OR REPLACE VIEW readable_freight_data AS
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

FROM faf_freight_data AS f

/*
im gonna write two separate joins for the states
since dms origsts implies origin state and
dms dms destst implies destination state
so i have to join them using two different
conditions
*/

JOIN state_codes AS origin 
	ON f.dms_origst = origin.state_number
JOIN state_codes AS destination
	ON f.dms_destst = destination.state_number
JOIN commodity_codes AS c
	USING(sctg2)
JOIN mode AS m
	ON f.dms_mode = m.numeric_label; 