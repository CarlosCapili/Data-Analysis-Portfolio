-- Create a copy of original dataset
CREATE TABLE staging_table AS 
SELECT * FROM inpatient_charges;

-- Rename columns
ALTER TABLE staging_table RENAME COLUMN "DRG Definition" TO drg_def;
ALTER TABLE staging_table RENAME COLUMN "Provider Id" TO provider_id;
ALTER TABLE staging_table RENAME COLUMN "Provider Name" TO provider_name;
ALTER TABLE staging_table RENAME COLUMN "Provider Street Address" TO provider_street_addr;
ALTER TABLE staging_table RENAME COLUMN "Provider City" TO provider_city;
ALTER TABLE staging_table RENAME COLUMN "Provider State" TO provider_state;
ALTER TABLE staging_table RENAME COLUMN "Provider Zip" TO provider_zip;
ALTER TABLE staging_table RENAME COLUMN "Hospital Referral Region Description" TO hosp_ref_reg_desc;
ALTER TABLE staging_table RENAME COLUMN "Total Discharges" TO total_discharges;
ALTER TABLE staging_table RENAME COLUMN "Average Covered Charges" TO avg_covered_charges;
ALTER TABLE staging_table RENAME COLUMN "Average Total Payments" TO avg_total_payments;
ALTER TABLE staging_table RENAME COLUMN "Average Medicare Payments" TO avg_medi_payments;

-- Check for duplicates
SELECT 
    COUNT(*) AS original_rows,
    (SELECT COUNT(*) FROM (SELECT DISTINCT * FROM staging_table) AS distinct_subquery) AS distinct_rows
FROM staging_table;

-- Handle missing values
-- Autogenerate queries checking for each column for null values in string format
SELECT 
    'SELECT ' || 
    string_agg('COUNT(*) FILTER (WHERE ' || column_name || ' IS NULL) AS ' || column_name || '_nulls', ', ') || 
    ' FROM staging_table;'
FROM information_schema.columns
WHERE "table_name" = 'staging_table';

-- Copy and paste generated queries from above
SELECT COUNT(*) FILTER (WHERE total_discharges IS NULL) AS total_discharges_nulls, COUNT(*) FILTER (WHERE provider_id IS NULL) AS provider_id_nulls, COUNT(*) FILTER (WHERE provider_street_addr IS NULL) AS provider_street_addr_nulls, COUNT(*) FILTER (WHERE provider_city IS NULL) AS provider_city_nulls, COUNT(*) FILTER (WHERE provider_state IS NULL) AS provider_state_nulls, COUNT(*) FILTER (WHERE provider_zip IS NULL) AS provider_zip_nulls, COUNT(*) FILTER (WHERE hosp_ref_reg_desc IS NULL) AS hosp_ref_reg_desc_nulls, COUNT(*) FILTER (WHERE avg_covered_charges IS NULL) AS avg_covered_charges_nulls, COUNT(*) FILTER (WHERE avg_total_payments IS NULL) AS avg_total_payments_nulls, COUNT(*) FILTER (WHERE drg_def IS NULL) AS drg_def_nulls, COUNT(*) FILTER (WHERE avg_medi_payments IS NULL) AS avg_medi_payments_nulls, COUNT(*) FILTER (WHERE provider_name IS NULL) AS provider_name_nulls FROM staging_table;

-- Check for inconsistencies in text columns
SELECT DISTINCT(drg_def) FROM staging_table;
SELECT DISTINCT(provider_name) FROM staging_table;
SELECT DISTINCT(provider_street_addr) FROM staging_table;
SELECT DISTINCT(provider_city) FROM staging_table;
SELECT DISTINCT(provider_state) FROM staging_table;
SELECT DISTINCT(hosp_ref_reg_desc) FROM staging_table;

-- Remove $ sign from the charges and payments column
UPDATE staging_table SET avg_covered_charges = LTRIM(avg_covered_charges, '$');
UPDATE staging_table SET avg_total_payments = LTRIM(avg_total_payments, '$');
UPDATE staging_table SET avg_medi_payments = LTRIM(avg_medi_payments, '$');

-- Convert covered charges, total payments, and medicare payments from text to numeric data type
ALTER TABLE staging_table ALTER COLUMN avg_covered_charges TYPE numeric USING avg_covered_charges::numeric;
ALTER TABLE staging_table ALTER COLUMN avg_total_payments TYPE numeric USING avg_total_payments::numeric;
ALTER TABLE staging_table ALTER COLUMN avg_medi_payments TYPE numeric USING avg_medi_payments::numeric;

SELECT * FROM staging_table LIMIT 5;



