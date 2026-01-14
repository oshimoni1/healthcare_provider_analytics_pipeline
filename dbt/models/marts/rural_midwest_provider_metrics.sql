{{ config(materialized="table") }}

select
    provider_id,
    provider_name,
    provider_city,
    provider_zipcode,
    zipcode_population,
    zipcode_median_age,
    total_discharges,
    total_covered_charges,
    total_medicare_payments,
    drg_count,
    -- Reimbursement rate (across all DRGs)
    total_medicare_payments/total_covered_charges as reimbursement_rate,
    -- Discharges per capita
    total_discharges / zipcode_population as discharges_per_capita
from {{ ref("fct_provider_totals") }}
where
    provider_state
    in ('IL', 'IN', 'IA', 'KS', 'MI', 'MN', 'MO', 'NE', 'ND', 'OH', 'SD', 'WI')  -- Midwest
    and zipcode_population between 1000 and 30000  -- rural
    and drg_count > 5  -- Exclude providers with few DRGs
    and total_discharges > 0
