### Architecture Overview

This project implements a structured healthcare analytics pipeline, separating raw data from analytics-ready transformations.  

The architecture is designed for clarity, reproducibility, and maintainability.

###### Data Flow

1. **Raw Warehouse (BigQuery)**
- cms_medicare inpatient & hospital reference tables
- zipcode level U.S. Census data

2. **Staging Layer (dbt views)**
- stg_inpatient_data
- tg_hospital_general_info
- stg_zipcode_data

3. **Intermediate Layer (dbt views)**
- int_provider_zip_data  (joins providers to census data for classification)

4. **Dimension/Fact Tables**
- dim_hospital_general_info
- fct_provider_totals

5. **Analytics Marts**
- rural_midwest_provider_metrics (business-facing table)

6. **Dashboard/BI Layer**
- Tableau dashboard