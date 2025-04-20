-- SALES PIPELINE TABLE CLEANING --------------------
SELECT * FROM sales_pipeline LIMIT 5;

-- Check for duplicate rows
SELECT
	COUNT(*) AS original_row_count,
	(SELECT COUNT(*) FROM (SELECT DISTINCT * FROM sales_pipeline) AS distinct_subquery) AS distinct_row_count
FROM sales_pipeline;

-- Check for missing values
SELECT 
	COUNT(*) FILTER(WHERE opportunity_id IS NULL) AS opportunity_id_nulls,
	COUNT(*) FILTER(WHERE sales_agent IS NULL) AS sales_agent_nulls,
	COUNT(*) FILTER(WHERE product IS NULL) AS product_nulls,
	COUNT(*) FILTER(WHERE account IS NULL) AS account_nulls,
	COUNT(*) FILTER(WHERE deal_stage IS NULL) AS deal_stage_nulls,
	COUNT(*) FILTER(WHERE engage_date IS NULL) AS engage_date_nulls,
	COUNT(*) FILTER(WHERE close_date IS NULL) AS close_date_nulls,
	COUNT(*) FILTER(WHERE close_value IS NULL) AS close_value_nulls
FROM sales_pipeline;

-- Inspect engage_date, close_date, and close_value null values
SELECT * FROM sales_pipeline WHERE engage_date IS NULL;
SELECT * FROM sales_pipeline WHERE close_date IS NULL;

-- Replace NULL values in account column with 'Searching' string
SELECT * FROM sales_pipeline WHERE account IS NULL
UPDATE sales_pipeline SET account = 'Searching' WHERE account IS NULL 

-- Inspect text columns for consistent formatting 
SELECT DISTINCT sales_agent FROM sales_pipeline;
SELECT DISTINCT product FROM sales_pipeline;
-- Update GTXPRO to GTX Pro in product column
UPDATE sales_pipeline SET product = 'GTX Pro' WHERE product = 'GTXPro';
SELECT DISTINCT account FROM sales_pipeline;
SELECT DISTINCT deal_stage FROM sales_pipeline;

-- Inspect numerical columns for invalid ranges
SELECT
	MIN(close_value) AS min_close_value,
	MAX(close_value) AS max_close_value
FROM sales_data;

-- Check rows with min and max values
SELECT * FROM sales_data WHERE close_value = 0; 
SELECT * FROM sales_data WHERE close_value = 30288;

-- ACCOUNTS TABLE CLEANING --------------------
SELECT * FROM accounts LIMIT 5;

-- Check for duplicate rows
SELECT
	COUNT(*) AS original_row_count,
	(SELECT COUNT(*) FROM (SELECT DISTINCT * FROM accounts) AS distinct_subquery) AS distinct_row_count
FROM accounts;

-- Check for missing values
SELECT
	COUNT(*) FILTER(WHERE account IS NULL) AS account_nulls,
	COUNT(*) FILTER(WHERE sector IS NULL) AS sector_nulls,
	COUNT(*) FILTER(WHERE year_established IS NULL) AS year_established_nulls,
	COUNT(*) FILTER(WHERE revenue IS NULL) AS revenue_nulls,
	COUNT(*) FILTER(WHERE employees IS NULL) AS employees_nulls,
	COUNT(*) FILTER(WHERE office_location IS NULL) AS office_location_nulls,
	COUNT(*) FILTER(WHERE subsidiary_of IS NULL) AS subsidiary_of_nulls
FROM accounts;

-- Inspect subsidiary_of null values
SELECT * FROM accounts WHERE subsidiary_of IS NULL;

-- Inspect text columns for consistent formatting
SELECT DISTINCT account FROM accounts;
SELECT DISTINCT sector FROM accounts;
-- Correct spelling mistakes in sector column
SELECT DISTINCT sector FROM accounts
UPDATE accounts
SET sector = 'technology'
WHERE sector = 'technolgy'
-- Convert all values to proper case (first letter is capitalized)
UPDATE accounts SET sector = INITCAP(sector);
SELECT DISTINCT office_location FROM accounts;
-- Correct spelling mistakes in office_location column
UPDATE accounts
SET office_location = 'Philippines'
WHERE office_location = 'Philipines';

-- Inspect numerical columns for invalid ranges
SELECT 
	MIN(year_established) AS min_year_established, 
	MAX(year_established) AS max_year_established, 
	MIN(revenue) AS min_revenue,
	MAX(revenue) AS max_revenue,
	MIN(employees) AS min_employees,
	MAX(employees) AS max_employees
FROM accounts;

-- PRODUCTS TABLE CLEANING --------------------
SELECT * FROM products LIMIT 5;

-- SALES TEAM CLEANING --------------------
SELECT * FROM sales_team;
