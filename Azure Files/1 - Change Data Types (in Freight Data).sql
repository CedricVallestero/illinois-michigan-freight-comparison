/*
here i will change the column data types for freight_data since the pipeline assumed everything was a string
*/

ALTER TABLE dbo.freight_data
ALTER COLUMN tons_2022 NUMERIC(20,10);

ALTER TABLE dbo.freight_data
ALTER COLUMN value_2022 NUMERIC(20,10);

ALTER TABLE dbo.freight_data
ALTER COLUMN fr_orig INT;

ALTER TABLE dbo.freight_data
ALTER COLUMN dms_origst INT;

ALTER TABLE dbo.freight_data
ALTER COLUMN dms_destst INT;

ALTER TABLE dbo.freight_data
ALTER COLUMN fr_dest INT;

ALTER TABLE dbo.freight_data
ALTER COLUMN fr_inmode INT;

ALTER TABLE dbo.freight_data
ALTER COLUMN dms_mode INT;

ALTER TABLE dbo.freight_data
ALTER COLUMN fr_outmode INT;

ALTER TABLE dbo.freight_data
ALTER COLUMN sctg2 INT;

ALTER TABLE dbo.freight_data
ALTER COLUMN trade_type INT;