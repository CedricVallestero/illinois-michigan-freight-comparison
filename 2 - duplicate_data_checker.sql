SELECT 
	dms_origst, 
	dms_destst, 
	sctg2, 
	dms_mode, 
	trade_type, 
	fr_orig, 
	fr_dest, 
	fr_inmode, 
	fr_outmode, 
	COUNT(*)
FROM faf_freight_data
GROUP BY 
	dms_origst, 
	dms_destst, 
	sctg2, 
	dms_mode, 
	trade_type, 
	fr_orig, 
	fr_dest, 
	fr_inmode, 
	fr_outmode
HAVING COUNT(*) > 1;

/*
the code above will return the rows with matching data so i can 
check if there are duplicates needed removing

it returned nothing so no deduplication needed
*/