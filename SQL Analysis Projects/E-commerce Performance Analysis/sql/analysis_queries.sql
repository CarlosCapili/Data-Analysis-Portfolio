-- ===========================================================
-- REVENUE ANALYSIS
-- ===========================================================

-- Total Revenue 
SELECT
	ROUND(SUM(price)::numeric, 2) AS total_revenue
FROM order_items;

-- Total Revenue by State (and % of revenue)
SELECT
	c.customer_state,
	ROUND(SUM(oi.price::numeric), 2) AS revenue,
	ROUND(SUM(oi.price::numeric) / (SELECT SUM(price)::numeric AS total_revenue FROM order_items)*100.0, 2) AS revenue_pct
FROM order_items AS oi
JOIN orders AS o
	ON oi.order_id = o.order_id
JOIN customers AS c
	ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY revenue DESC;

-- Total Revenue by City, State
SELECT
	c.customer_city,
	c.customer_state,
	ROUND(SUM(oi.price::numeric), 2) AS revenue,
	ROUND(SUM(oi.price::numeric) / (SELECT SUM(price)::numeric AS total_revenue FROM order_items)*100.0, 2) AS revenue_pct
FROM order_items AS oi
JOIN orders AS o
	ON oi.order_id = o.order_id
JOIN customers AS c
	ON o.customer_id = c.customer_id
GROUP BY c.customer_city, c.customer_state
ORDER BY revenue DESC;

-- Total Order Revenue (without freight)
SELECT
	order_id,
	MAX(order_item_id) AS items_in_order,
	ROUND(SUM(price)::numeric, 2) AS total_order_value
FROM order_items
GROUP BY order_id
ORDER BY total_order_value DESC;

-- Total Order Revenue (with freight)
SELECT
	order_id,
	MAX(order_item_id) AS items_in_order,
	ROUND(SUM(price * freight_value)::numeric, 2) AS total_order_value
FROM order_items
GROUP BY order_id
ORDER BY total_order_value DESC;

-- ===========================================================
-- PRODUCT ANALYSIS
-- ===========================================================

-- Product Categories By Item Count (and % of revenue)
SELECT
	p.product_category,
	COUNT(p.product_id) AS item_count,
	ROUND(SUM(oi.price::numeric), 2) AS product_revenue,
	ROUND(SUM(oi.price::numeric) / (SELECT SUM(price::numeric) FROM order_items)*100.0, 2) AS revenue_pct
FROM order_items AS oi
JOIN products AS p
	ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY product_revenue DESC, item_count DESC
LIMIT 10;

-- ===========================================================
-- SELLER ANALYSIS
-- ===========================================================

-- Top Sellers in the Market (Number of Products Sold and Revenue)
SELECT
	seller_id,
	COUNT(*) AS product_sold,
	ROUND(SUM(price)::numeric, 2) AS total_revenue
FROM order_items
GROUP BY seller_id
ORDER BY total_revenue DESC, product_sold DESC
LIMIT 10;

-- ===========================================================
-- TIME ANALYSIS
-- ===========================================================

-- Orders Per Month
SELECT 
	DATE_TRUNC('month', order_purchase_timestamp) AS month,
	COUNT(*) AS orders
FROM orders
GROUP BY month
ORDER BY month;





