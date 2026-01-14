#### Data Ingestion Scripts

This folder contains scripts used to ingest raw source data into BigQuery.

**Scripts**

`us_city_data_load_to_bigquery.py`
- Pulls U.S. Census population and demographic data via API
- Cleans and formats data for warehouse storage
- Loads results into `healthcare_provider_analytics_pipeline_raw.zip_code_census_data`

**Usage**
1. Install dependencies: `pip install -r requirements.txt`
2. Run the script: `python us_city_data_load_to_bigquery.py`
3. Verify table in BigQuery: `SELECT * FROM healthcare_provider_analytics_pipeline_raw.zip_code_census_data`
