### Source Mapping: Raw Warehouse to dbt Models

This document defines how raw BigQuery tables in 
`healthcare_provider_analytics_pipeline_raw` 
are mapped into dbt sources and used to build analytics-ready models.

dbt sources provide a stable contract between the data warehouse and the
transformation layer, ensuring raw data remains immutable and all downstream
models have a consistent interface.

---

##### Overview

| Raw BigQuery Table | dbt Source | dbt Source Table | Description |
| `raw_inpatient_data` | `inpatient_data` | `raw_inpatient_data` | Medicare inpatient charges by provider and DRG |
| `raw_hospital_general_info` | `hospital_data` | `raw_hospital_general_info` | Hospital reference data (address, ownership, quality, etc.) |
| `zip_code_census_data` | `census_data` | `zip_code_cesnsus_data` | U.S. Census population data by zip code used for classification |

---

##### dbt Source Usage

**cms_medicare Sources**

The cms_medicare source tables are defined in dbt as:

- `source('inpatient_data', 'raw_inpatient_data')`
- `source('hospital_data', 'raw_hospital_general_info')`

These raw tables are transformed into staging models:

- `stg_inpatient_data`
- `stg_hospital_general_info`

Which are then used to build analytics tables such as:

- `fct_provider_totals`
- `dim_hospital_general_info`


**U.S. Census Sources**

The Census ZIP code data is defined in dbt as:

- `source('census_data', 'zip_code_cesnsus_data')`

This source feeds:

- `stg_zipcode_data`
- `int_provider_zip_data`

Which is used to classify providers and generate:

- `rural_midwest_provider_metrics`


