--INPATIENT DATA
CREATE TABLE `oshimoni-data.healthcare_provider_analytics_pipeline_raw.raw_inpatient_data` AS
SELECT *
FROM `bigquery-public-data.cms_medicare.inpatient_charges_2015`;