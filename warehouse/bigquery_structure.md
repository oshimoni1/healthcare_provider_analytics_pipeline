#### Healthcare Provider Analytics Pipeline BigQuery Structure
The BigQuery warehouse is split into two datasets to separate source data from analytics-ready models:

###### healthcare_provider_analytics_pipeline_raw
Stores raw source of truth data from bigquery-public-data.cms_medicare and the U.S. Census (for zipcode metrics)

**Tables:**
- raw_inpatient_data: CMS Medicare inpatient charges (2015) by provider and DRG
- raw_hospital_general_info: CMS provider reference data (address, phone number, ownership, quality scores, etc.)
- zip_code_census_data *(generated via /ingestion/us_city_data_load_to_bigquery.py)*



###### healthcare_provider_analytics_pipeline
Stores all dbt-managed models built on top of the raw datasets. Represents cleaned, modeled, and business-ready data.

**Staging Layer (dbt views):**
- stg_inpatient_data
- stg_hospital_general_info
- stg_zipcode_data

**Intermediate Layer:**
- int_provider_zip_data: Joins providers to zip code census data for classification

**Dimension Tables:**
- dim_hospital_general_info: Hospital attribute reference table

**Fact Tables:**
- fct_provider_totals: Aggregates financial data, discharges, and number of DRGs by provider

**Analytics Marts:**
- rural_midwest_provider_metrics: Final business-facing table used by Tableau and downstream analytics.
