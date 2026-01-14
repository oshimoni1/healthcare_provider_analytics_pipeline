import os
import requests
import pandas as pd
from google.cloud import bigquery
from config import BIGQUERY_SERVICE_ACCOUNT_JSON, BIGQUERY_DESTINATION_TABLE, US_CENSUS_API_KEY, CENSUS_VARIABLES


# BIGQUERY SERVICE ACCOUNT
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = BIGQUERY_SERVICE_ACCOUNT_JSON

def fetch_census_data(variables: str):
    endpoint = "https://api.census.gov/data/2023/acs/acs5"

    params = {
        "get": f"{variables}",
        "for": "zip code tabulation area:*",
        "key": US_CENSUS_API_KEY
    }

    print("Fetching data with Census API")
    response = requests.get(endpoint, params=params)
    data = response.json()
    print("Success")

    return data

def clean_census_data(data):
    # Convert output to df and clean census data
    df = pd.DataFrame(data[1:], columns=data[0])
    
    # Drop the 'NAME' column
    if "NAME" in df.columns:
        df.drop(columns=["NAME"], inplace=True)

    # Rename columns for clarity
    df.rename(columns={
        "B01003_001E": "population",
        "B01002_001E": "median_age",
        "zip code tabulation area": "zip_code"
    }, inplace=True)
    
    # Convert types
    df["population"] = df["population"].astype(int)
    df["median_age"] = df["median_age"].astype(float)
    
    # Reorder columns: zip, population, median_age
    df = df[["zip_code", "population", "median_age"]]

    return df

def load_to_bigquery(df: pd.DataFrame, table_id: str):
    """
    Load a pandas DataFrame to BigQuery
    """
    client = bigquery.Client()
    
    job_config = bigquery.LoadJobConfig(
        source_format=bigquery.SourceFormat.CSV,
        skip_leading_rows=1,
        autodetect=True
    )
    
    # Save temp CSV for BigQuery upload
    temp_csv = "temp_census_data.csv"
    df.to_csv(temp_csv, index=False)
    
    print(f"Loading {len(df)} rows into BigQuery table {table_id}...")
    with open(temp_csv, "rb") as f:
        job = client.load_table_from_file(f, table_id, job_config=job_config)
    
    job.result()  # Wait for job to finish
    print(f"Loaded {job.output_rows} rows into {table_id}.")

def main():
    # Fetch Census Data
    census_data_json = fetch_census_data(CENSUS_VARIABLES)

    df = clean_census_data(census_data_json)
    
    # Load to BigQuery
    load_to_bigquery(df, BIGQUERY_DESTINATION_TABLE)
    print("Done!")

if __name__ == "__main__":
    main()
