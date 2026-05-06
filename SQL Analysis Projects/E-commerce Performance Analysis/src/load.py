from sqlalchemy import create_engine
from urllib.parse import quote_plus

password = quote_plus("Digimon23$")
DATABASE_URL = f"postgresql+psycopg2://postgres:{password}@localhost:5432/ecommerce_sales"

def get_engine():
    return create_engine(DATABASE_URL)

def load_to_postgres(df, table_name):
    engine = get_engine()
    df.to_sql(table_name, con=engine, if_exists="replace", index=False)
    print(f"Loaded {len(df)} rows into '{table_name}'")


