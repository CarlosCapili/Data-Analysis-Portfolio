import pandas as pd

def extract_csv(file_path):
    print(f"Extracting csv: {file_path}")
    return pd.read_csv(file_path)
    

