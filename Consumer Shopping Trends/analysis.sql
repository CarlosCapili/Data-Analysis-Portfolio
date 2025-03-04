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

-- What is the percentage of purchases for each category?
SELECT
	category,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM consumer_clean), 2) AS category_pct
FROM consumer_clean
GROUP BY category
ORDER BY category_pct DESC

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

-- What is the percentage of shipping types used?
SELECT
	shipping_type,
	COUNT(*) AS shipping_type_count,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM consumer_clean), 2) AS shipping_type_pct
FROM consumer_clean
GROUP BY shipping_type
ORDER BY shipping_type_pct DESC

-- How many purchases used a promo code?
SELECT
	promo_code_used,
	COUNT(*) AS promo_code_used_count,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM consumer_clean), 2) AS promo_code_pct
FROM consumer_clean
GROUP BY promo_code_used

-- How many purchases applied a discount?
SELECT 
	discount_applied,
	COUNT(*) AS disc_app_count,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM consumer_clean), 2) AS disc_app_pct
FROM consumer_clean
GROUP BY discount_applied

-- What is the preferred payment method?
SELECT 
	pref_payment_method,
	COUNT(*) AS payment_method_count,
	ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM consumer_clean), 2) AS payment_method_pct
FROM consumer_clean
GROUP BY pref_payment_method
ORDER BY payment_method_pct DESC
