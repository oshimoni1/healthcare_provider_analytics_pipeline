{{ config(materialized="view") }}

select
    provider_id,
    provider_name,
    provider_city,
    provider_state,
    provider_zipcode,
    drg_definition,
    cast(total_discharges as int64) as total_discharges,
    cast(average_covered_charges as float64) as average_covered_charges,
    cast(average_medicare_payments as float64) as average_medicare_payments
from {{ source("inpatient_data", "raw_inpatient_data") }}
