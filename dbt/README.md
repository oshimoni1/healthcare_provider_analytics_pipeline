# DBT Models - Healthcare Provider Analytics Pipeline

This folder contains all dbt-managed transformations for the Healthcare Provider Analytics Pipeline. 

## Overview

- Transforms raw cms_medicare and U.S. Census data from `healthcare_provider_analytics_pipeline_raw` into analytics-ready tables in `healthcare_provider_analytics_pipeline`.
- Follows standard dbt layering: **staging → intermediate → dimension/fact → marts**.
- Includes built-in tests and documentation for key business metrics.

## Layers

### Staging
- Cleans raw tables and applies consistent naming conventions.
- Tables:
  - `stg_inpatient_data`
  - `stg_hospital_general_info`
  - `stg_zipcode_data`

### Intermediate
- Joins staging tables.
- Table:
  - `int_provider_zip_data` (joins providers to zip code data for classification)

### Dimensions
- Stores reference data for providers.
- Table:
  - `dim_hospital_general_info`

### Fact Tables
- Aggregates financial metrics, discharges, and DRGs by provider.
- Table:
  - `fct_provider_totals`

### Analytics Marts
- Business-facing tables used by Tableau and downstream analytics.
- Table:
  - `rural_midwest_provider_metrics`

## Tests
- `not_null` and `unique` on key IDs
- `accepted_values` for state codes and rural classification
- Ensures data quality for business reporting

## Sources
- Declared in `sources.yml` for cms_medicare and U.S. Census raw tables
