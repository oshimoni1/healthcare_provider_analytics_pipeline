{{ config(materialized="view") }}

select
    safe_cast(zip_code as string) as zip,
    cast(population as int64) as population,
    cast(median_age as float64) as median_age
from {{ source("census_data", "zip_code_census_data") }}
where length(safe_cast(zip_code as string)) = 5 and safe_cast(zip_code as int64) is not null
