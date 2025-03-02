-- Average purchase amount by gender
SELECT
	gender,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt
FROM consumer_clean
GROUP BY gender

-- Average purchase amount per category by gender?
SELECT
	gender,
	category,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt
FROM consumer_clean
GROUP BY gender, category
ORDER BY gender, avg_purchase_amt DESC

-- What is the most common size for each category by gender?
WITH size_counts AS (
	SELECT
		gender,
		category,
		size,
		COUNT(*) AS size_count
	FROM consumer_clean
	GROUP BY gender, category, size
),
total_counts AS (
	SELECT
		gender,
		category,
		COUNT(*) AS total_count
	FROM consumer_clean
	GROUP BY gender, category
)

SELECT
	sc.gender,
	sc.category,
	sc.size,
	sc.size_count,
	ROUND(sc.size_count * 100.0 / tc.total_count, 2) AS category_size_pct
FROM size_counts AS sc
JOIN total_counts AS tc
	ON sc.gender = tc.gender AND sc.category = tc.category
ORDER BY gender, category, category_size_pct DESC

-- What are the top 3 most popular items purchased by gender?
SELECT
	gender,
	item_purchased,
	item_purchase_count,
	dr
FROM (
	SELECT
		gender,
		item_purchased,
		COUNT(*) AS item_purchase_count,
		DENSE_RANK() OVER(PARTITION BY gender ORDER BY COUNT(*) DESC) AS dr
	FROM consumer_clean
	GROUP BY gender, item_purchased
	ORDER BY gender, item_purchase_count DESC
)
WHERE dr <= 3

-- Average spending per age group 
SELECT
	age_group,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt
FROM consumer_clean
GROUP BY age_group
ORDER BY age_group

-- Which age group spends the most on average in each category
SELECT
	age_group,
	category,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt
FROM consumer_clean
GROUP BY age_group, category
ORDER BY age_group, avg_purchase_amt DESC

-- What is the percentage breakdown of category purchases by age group?
WITH total_count AS (
	SELECT
		age_group,
		COUNT(*) AS age_group_count
	FROM consumer_clean
	GROUP BY age_group
),
sub_count AS (
	SELECT
		age_group,
		category,
		COUNT(*) AS category_count
	FROM consumer_clean
	GROUP BY age_group, category
)

SELECT 
	sc.age_group,
	sc.category,
	sc.category_count,
	ROUND(sc.category_count * 100.0 / tc.age_group_count, 2) AS age_group_cat_pct
FROM sub_count AS sc
JOIN total_count AS tc
	ON sc.age_group = tc.age_group
ORDER BY sc.age_group, age_group_cat_pct DESC

-- What is the most popular item to buy per age group?
SELECT
	age_group,
	item_purchased,
	COUNT(*) AS item_count,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt
FROM consumer_clean
GROUP BY age_group, item_purchased
ORDER BY age_group, item_count DESC

-- Which categories or items are most popular?
SELECT 
	category,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt,
	ROUND(SUM(purchase_amt_usd), 2) AS total_purchase_amt
FROM consumer_clean
GROUP BY category
ORDER BY total_purchase_amt DESC

-- What are the top 10 items consumers spend their money on?
SELECT 
	category,
	item_purchased,
	ROUND(SUM(purchase_amt_usd), 2) AS total_purchase_amt,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt
FROM consumer_clean
GROUP BY category, item_purchased
ORDER BY total_purchase_amt DESC
LIMIT 10

-- What are the age group and gender spending breakdown for Blouses, Dresses, and Jewelry?
SELECT 
	age_group,
	gender,
	item_purchased,
	ROUND(SUM(purchase_amt_usd), 2) AS total_purchase_amt,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt
FROM consumer_clean
WHERE 
	item_purchased IN ('Blouse', 'Dress', 'Jewelry')
GROUP BY age_group, gender, item_purchased
ORDER BY age_group, item_purchased, gender

-- What is the total spending for each item per category
SELECT
	category,
	item_purchased,
	ROUND(SUM(purchase_amt_usd), 2) AS total_purchase_amt
FROM consumer_clean
GROUP BY category, item_purchased
ORDER BY category, total_purchase_amt DESC

-- What items are consumers spending there money on per age group? 
WITH top_items AS (
	SELECT
		age_group,
		gender,
		category,
		item_purchased,
		ROUND(SUM(purchase_amt_usd), 2) AS total_purchase_amt,
		ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt,
		DENSE_RANK() OVER(PARTITION BY age_group, gender ORDER BY ROUND(AVG(purchase_amt_usd), 2) DESC) AS dr
	FROM consumer_clean
	GROUP BY age_group,gender, category, item_purchased
)

SELECT 
	age_group,
	gender,
	category,
	item_purchased,
	avg_purchase_amt
FROM top_items
WHERE dr = 1
ORDER BY gender, age_group

What is the average purchase amount for each category for each gender?
SELECT 
	gender,
	category,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt
FROM consumer_clean
GROUP BY gender, category
ORDER BY gender

-- Seasonal Trends

-- What is the average and total purchase amount by season?
SELECT 
	season,
	SUM(purchase_amt_usd) AS total_purchase_amt,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt
FROM consumer_clean
GROUP BY season
ORDER BY total_purchase_amt DESC

-- What items are commonly purchased in each season? (Top 5 ranked purchased items)
WITH common_item_season AS
(
	SELECT 
		season,
		item_purchased,
		COUNT(*) AS item_purchased_count,
		SUM(purchase_amt_usd) AS total_purchase_amt,
		DENSE_RANK() OVER(PARTITION BY season ORDER BY COUNT(*) DESC) AS dr 
	FROM consumer_clean
	GROUP BY season, item_purchased
)

SELECT 
	season,
	item_purchased,
	item_purchased_count,
	total_purchase_amt,
	dr
FROM common_item_season
WHERE dr <= 5

Which shipping type is most popular during each season?
SELECT
	season,
	shipping_type,
	COUNT(*) AS shipping_type_count
FROM consumer_clean
GROUP BY season, shipping_type
ORDER BY season, shipping_type_count DESC

-- Discounts and Promo Code Usage

-- How many purchases used a promo code?
WITH code_used AS 
(
	SELECT
		promo_code_used,
		COUNT(*) AS num_purchases
	FROM consumer_clean
	GROUP BY promo_code_used
)

SELECT
	promo_code_used,
	num_purchases,
	ROUND(num_purchases * 100.0 / (SELECT COUNT(*) FROM consumer_clean), 2) AS pct
FROM code_used

-- What categories use the most promo codes during purchase?
SELECT
	category,
	COUNT(*) AS promo_code_used_count
FROM consumer_clean
WHERE promo_code_used = 'Yes'
GROUP BY category
ORDER BY promo_code_used_count DESC

-- What items in each cateogry use the most promo codes during purchase?
SELECT
	category,
	item_purchased,
	COUNT(*) AS promo_code_used_count
FROM consumer_clean
WHERE promo_code_used = 'Yes'
GROUP BY category, item_purchased
ORDER BY category, promo_code_used_count DESC

-- What is the average discount purchase by season?
SELECT
	season,
	discount_applied,
	ROUND(AVG(purchase_amt_usd), 2) AS avg_purchase_amt
FROM consumer_clean
GROUP BY season, discount_applied
ORDER BY season, discount_applied

-- Payment and Preferences

-- What is the preferred payment method per age group?
SELECT 
	age_group,
	pref_payment_method,
	COUNT(*) AS payment_method_count
FROM consumer_clean
GROUP BY age_group, pref_payment_method
ORDER BY age_group, payment_method_count DESC
