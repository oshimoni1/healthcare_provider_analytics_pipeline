# Path to Google Cloud service account JSON
BIGQUERY_SERVICE_ACCOUNT_JSON = "/credentials/oshimoni_data_service_account.json"

# BigQuery destination table (full path: project.dataset.table)
BIGQUERY_DESTINATION_TABLE = "oshimoni-data.healthcare_provider_analytics_pipeline_raw.zip_code_census_data"

# US Census API key
US_CENSUS_API_KEY = "hidden"

# Census variables to fetch: B01003_001E (total population), B01002_001E (median age)
CENSUS_VARIABLES = "NAME,B01003_001E,B01002_001E"
