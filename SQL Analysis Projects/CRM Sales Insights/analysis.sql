-- Create a table that combines the sales team, sales pipeline, products, and account tables
CREATE TABLE sales_data AS 
	SELECT 
		sp.opportunity_id,
		st.sales_agent,
		st.manager,
		st.regional_office,
		sp.product,
		prod.series,
		prod.sales_price,
		sp.account,
		acc.sector,
		acc.year_established,
		acc.revenue,
		acc.employees,
		acc.office_location,
		sp.deal_stage,
		sp.engage_date,
		sp.close_date,
		sp.close_value
	FROM sales_pipeline AS sp
	LEFT JOIN sales_team AS st
		ON sp.sales_agent = st.sales_agent
	LEFT JOIN products AS prod
		ON sp.product = prod.product
	LEFT JOIN accounts AS acc
		ON sp.account = acc.account

-- Sales by regional office
SELECT
	regional_office,
	SUM(close_value) AS sales_produced
FROM sales_data	
GROUP BY regional_office
ORDER BY sales_produced DESC;

-- Sales by manager
SELECT 
	regional_office,
	manager,
	SUM(close_value) AS sales_produced
FROM sales_data
GROUP BY regional_office, manager
ORDER BY regional_office, sales_produced DESC;

-- Sales by agent
SELECT 
	regional_office,
	manager,
	sales_agent,
	SUM(close_value) AS sales_produced
FROM sales_data
GROUP BY regional_office, manager, sales_agent
ORDER BY sales_produced DESC;

-- Sales by product
SELECT
	product,
	sales_price,
	COUNT(*) AS units_sold,
	SUM(close_value) AS sales_produced
FROM sales_data
GROUP BY product, sales_price
ORDER BY units_sold DESC;

-- Sales by sector
SELECT
	sector,
	SUM(close_value) AS sales_produced
FROM sales_data
WHERE sector IS NOT NULL
GROUP BY sector
ORDER BY sales_produced DESC;

-- Compare the total projected sales (sales price of products) vs the total real sales (actual closing price) on winning deals
WITH projected_vs_real_sales AS (
	SELECT
		opportunity_id,
		regional_office,
		manager,
		sales_agent,
		product,
		account,
		sector,
		sales_price,
		close_value
	FROM sales_data
	WHERE deal_stage = 'Won'
)

-- Total projected sales vs total real sales by regional office
SELECT
	regional_office,
	SUM(sales_price) AS total_projected_sales,
	SUM(close_value) AS total_actual_sales,
	(SUM(close_value) - SUM(sales_price)) AS projected_actual_diff
FROM projected_vs_real_sales
GROUP BY regional_office
ORDER BY projected_actual_diff DESC;

-- By manager
SELECT
	regional_office,
	manager,
	SUM(sales_price) AS total_projected_sales,
	SUM(close_value) AS total_actual_sales,
	(SUM(close_value) - SUM(sales_price)) AS projected_actual_diff
FROM projected_vs_real_sales
GROUP BY regional_office, manager
ORDER BY regional_office, projected_actual_diff DESC;

-- By sales agent
SELECT
	regional_office,
	manager,
	sales_agent,
	SUM(sales_price) AS total_projected_sales,
	SUM(close_value) AS total_actual_sales,
	(SUM(close_value) - SUM(sales_price)) AS projected_actual_diff
FROM projected_vs_real_sales
GROUP BY regional_office, manager, sales_agent
ORDER BY regional_office, projected_actual_diff DESC;

-- Top 3 accounts for each office
SELECT 
	regional_office,
	account,
	total_sales
FROM (
	SELECT
		regional_office,
		account,
		SUM(close_value) AS total_sales,
		DENSE_RANK() OVER(PARTITION BY regional_office ORDER BY SUM(close_value) DESC) AS dr
	FROM sales_data
	GROUP BY regional_office, account
	HAVING SUM(close_value) IS NOT NULL
) AS top_accounts
WHERE dr <= 3

-- What is the average close time (in days) for each agent?
SELECT
	regional_office, 
	manager,
	sales_agent,
	ROUND(AVG(time_to_close), 0) AS avg_close_time
FROM (
	SELECT 
		regional_office,
		manager,
		sales_agent,
		close_date,
		engage_date,
		(close_date - engage_date) AS time_to_close
	FROM sales_data
	WHERE close_date IS NOT NULL
		AND engage_date IS NOT NULL
) AS avg_agent_close_time
GROUP BY regional_office, manager, sales_agent
ORDER BY regional_office, avg_close_time DESC;

-- What is the closing rate for each office?
SELECT
	regional_office,
	COUNT(*) FILTER(WHERE deal_stage = 'Won') AS deals_closed,
	COUNT(*) FILTER(WHERE deal_stage = 'Lost') AS deals_lost,
	ROUND(COUNT(*) FILTER(WHERE deal_stage = 'Won') * 100.0 / COUNT(*) FILTER(WHERE deal_stage IN ('Won', 'Lost')), 1) AS deals_closed_pct
FROM sales_data
GROUP BY regional_office

SELECT * FROM sales_data LIMIT 5;













