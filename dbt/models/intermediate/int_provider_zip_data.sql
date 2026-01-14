{{ config(materialized="view") }}

select
    inpatient.*,
    zip.population as zipcode_population,
    zip.median_age as zipcode_median_age
from {{ ref("stg_inpatient_data") }} inpatient
left join {{ ref("stg_zipcode_data") }} zip on inpatient.provider_zipcode = zip.zip
