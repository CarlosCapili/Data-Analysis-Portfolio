import pandas as pd

# Remove duplicate rows for any dataset
def remove_duplicates(df):
    """
    Remove duplicate rows in given a dataframe and returns the dataframe.
    """
    before = len(df)
    df = df.drop_duplicates()
    after = len(df)
    # print(f"Removed {before - after} duplicate rows.")
    return df

def transform_customers(df):
    # Customers Transformation
    # print("Transforming Customers dataset...\n")

    # Select relevant columns
    customers = df[['customer_id', 'customer_unique_id', 'customer_city', 'customer_state']]

    # print(f"Rows before transformation: {len(customers)}.")

    # Remove duplicates
    customers = remove_duplicates(customers)

    # Handle missing values
    before_dropna = len(customers)
    customers = customers.dropna()
    after_dropna = len(customers)
    # print(f"Removed {before_dropna - after_dropna} rows with missing values.")

    # Capitalize customer_city column 
    customers['customer_city'] = customers['customer_city'].str.title()

    # print(f"Rows after transformation: {len(customers)}.")
    print("Customers transformation complete...")

    return customers

def transform_orders(df):
    # print("Transforming Orders dataset...\n")

    # Select relevant columns
    orders = df[[
        'order_id', 
        'customer_id', 
        'order_status', 
        'order_purchase_timestamp', 
        'order_delivered_customer_date'
    ]]

    # print(f"Rows before transformation: {len(orders)}.")

    # Remove duplicates
    orders = remove_duplicates(orders)

    # Drop rows with order status = delivered and no delivery date
    filter_na = orders['order_delivered_customer_date'].isna()
    filter_delivered = orders['order_status'] == 'delivered'
    indexes = orders[filter_na & filter_delivered].index
    before_dropna = len(orders)
    orders = orders.drop(indexes)
    after_dropna = len(orders)
    # print(f"Removed {before_dropna - after_dropna} rows with missing values.")

    # Standardize formats
    orders['order_status'] = orders['order_status'].str.title()

    # Convert dates to timestamps
    orders['order_purchase_timestamp'] = pd.to_datetime(orders['order_purchase_timestamp'])
    orders['order_delivered_customer_date'] = pd.to_datetime(orders['order_delivered_customer_date'])

    # print(f"Rows after transformation: {len(orders)}.")
    print("Orders transformation complete...")

    return orders

def transform_products(df):
    # print("Transforming Products dataset...\n")

    # Select relevant columns
    products = df[['product_id', 'product_category_name']]

    # print(f"Rows before transformation: {len(products)}.")

    # Rename columns
    products = products.rename(columns={"product_category_name": "product_category"})

    # Remove duplicates
    products = remove_duplicates(products)

    # Remove rows with missing product category 
    indexes = products[products['product_category'].isna()].index
    before_dropna = len(products)
    products = products.drop(indexes)
    after_dropna = len(products)
    # print(f"Removed {before_dropna - after_dropna} rows with missing values.")

    # Replace underscores in product_category with spaces
    products['product_category'] = products['product_category'].str.replace("_", " ").str.strip().str.title()

    # print(f"Rows after transformation: {len(products)}.")
    print("Products transformation complete...")

    return products

def transform_order_items(df):
    # print("Transforming Order Items dataset...\n")

    # Select relevant columns
    order_items = df[[
        'order_id',
        'order_item_id',
        'product_id',
        'seller_id',
        'price',
        'freight_value'
    ]]

    # print(f"Rows before transformation: {len(order_items)}.")

    # Remove duplicates
    order_items = remove_duplicates(order_items)

    # Drop rows with missing values
    before_dropna = len(order_items)
    order_items = order_items.dropna()
    after_dropna = len(order_items)
    # print(f"Removed {before_dropna - after_dropna} rows with missing values.")

    # Accept rows where price and freight value > 0
    order_items = order_items[order_items['price'] > 0]
    after_price_filter = len(order_items)
    # print(f"Removed {after_dropna - after_price_filter} rows with price < 0.")

    order_items = order_items[order_items['freight_value'] > 0]
    after_freight_filter = len(order_items)
    # print(f"Removed {after_price_filter - after_freight_filter} rows with freight value < 0.")

    # print(f"Rows after transformation: {len(order_items)}.")
    print("Order Items transformation complete...")

    return order_items