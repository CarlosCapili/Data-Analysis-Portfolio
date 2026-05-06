from extract import extract_csv
from transform import transform_customers, transform_orders, transform_products, transform_order_items
from load import load_to_postgres

def run_pipeline():
    """
    Performs the ETL process on Customer, Orders, Products, and Order Items datasets.
    """
    
    # Dataset paths
    customer_path = r'C:\Users\Mouth\Documents\Datasets\Local Projects\ecommerce_etl_project\datasets\customers.csv' 
    orders_path = r'C:\Users\Mouth\Documents\Datasets\Local Projects\ecommerce_etl_project\datasets\orders.csv'
    products_path = r'C:\Users\Mouth\Documents\Datasets\Local Projects\ecommerce_etl_project\datasets\products.csv'
    order_items_path = r'C:\Users\Mouth\Documents\Datasets\Local Projects\ecommerce_etl_project\datasets\order_items.csv'

    # Extract
    print("\nLoading datasets...")
    customers_raw = extract_csv(customer_path)
    orders_raw = extract_csv(orders_path)
    products_raw = extract_csv(products_path)
    order_items_raw = extract_csv(order_items_path)

    # Transform
    print("\nTranforming datasets...")
    customers = transform_customers(customers_raw)
    orders = transform_orders(orders_raw)
    products = transform_products(products_raw)
    order_items = transform_order_items(order_items_raw)

    # Load
    print("\nLoading datasets to PostgreSQL database...")
    load_to_postgres(customers, "customers")
    load_to_postgres(orders, "orders")
    load_to_postgres(products, "products")
    load_to_postgres(order_items, "order_items")

    print("\nETL pipeline complete.")

if __name__ == "__main__":
    run_pipeline()