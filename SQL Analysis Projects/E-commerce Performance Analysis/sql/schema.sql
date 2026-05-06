CREATE TABLE customers (
	customer_id TEXT PRIMARY KEY,
	customer_unique_id TEXT,
	customer_city TEXT,
	customer_state TEXT
);

CREATE TABLE orders (
	order_id TEXT PRIMARY KEY,
	customer_id TEXT,
	order_status TEXT,
	order_purchase_timestamp TIMESTAMP,
	order_delivered_customer_date TIMESTAMP
);

CREATE TABLE products (
	product_id TEXT PRIMARY KEY,
	product_category TEXT
);

CREATE TABLE order_items (
	order_id TEXT,
	order_item_id INT,
	product_id TEXT,
	seller_id TEXT,
	price NUMERIC,
	freight_value NUMERIC
);
