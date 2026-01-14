{{ config(materialized="table") }}

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
    --quality indicators' derived scores
    coalesce(
        cast(
            safe_cast(nullif(mortality_measures_better_count, 'Not available') as int64) -
            safe_cast(nullif(mortality_measures_worse_count, 'Not available') as int64)
            as string
        ),
        'Not available'
    ) as mortality_score,
    
    coalesce(
        cast(
            safe_cast(nullif(readmission_measures_better_count, 'Not available') as int64) -
            safe_cast(nullif(readmission_measures_worse_count, 'Not available') as int64)
            as string
        ),
        'Not available'
    ) as readmission_score
from {{ ref('stg_hospital_general_info') }}