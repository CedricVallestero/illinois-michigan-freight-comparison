/*
here i will rename the columns of the reference tables for readability purposes
*/

EXEC sp_rename 'dbo.commodity_codes.Numeric Label', 'sctg2', 'COLUMN';

EXEC sp_rename 'dbo.commodity_codes.Description', 'commodity_name', 'COLUMN';

EXEC sp_rename 'dbo.state_codes.Numeric Label', 'state_number', 'COLUMN';

EXEC sp_rename 'dbo.state_codes.Description', 'state_name', 'COLUMN';

EXEC sp_rename 'dbo.mode_codes.Numeric Label', 'numeric_label', 'COLUMN';

EXEC sp_rename 'dbo.mode_codes.Description', 'description', 'COLUMN';



/*
here i will change the data types accordingly
*/

ALTER TABLE dbo.commodity_codes
ALTER COLUMN sctg2 INT;

ALTER TABLE dbo.mode_codes
ALTER COLUMN numeric_label INT;

ALTER TABLE dbo.state_codes
ALTER COLUMN state_number INT;