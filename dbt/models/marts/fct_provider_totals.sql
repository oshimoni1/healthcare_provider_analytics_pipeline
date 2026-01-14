{{ config(materialized="table") }}

select
    provider_id,
    provider_name,
    provider_state,
    provider_city,
    provider_zipcode,
    zipcode_population,
    zipcode_median_age,
    sum(total_discharges) total_discharges,
    sum(total_discharges * average_covered_charges) total_covered_charges,
    sum(total_discharges * average_medicare_payments) total_medicare_payments,
    count(distinct drg_definition) drg_count
from {{ ref("int_provider_zip_data") }}
group by
    provider_id, provider_name, provider_state, provider_city, provider_zipcode, zipcode_population, zipcode_median_age
