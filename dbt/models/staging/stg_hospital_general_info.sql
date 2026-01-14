{{ config(materialized="view") }}

select
    provider_id,
    hospital_name,
    address,
    city,
    state,
    zip_code,
    county_name,
    phone_number,
    hospital_type,
    hospital_ownership,
    emergency_services,
    hospital_overall_rating,
    --quality indicators
    mortality_measures_better_count,
    mortality_measures_worse_count,
    readmission_measures_better_count,
    readmission_measures_worse_count
from {{ source("hospital_data", "raw_hospital_general_info") }}
