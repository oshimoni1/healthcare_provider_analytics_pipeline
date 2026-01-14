--HOSPITAL GENERAL INFO
CREATE TABLE `oshimoni-data.healthcare_provider_analytics_pipeline_raw.raw_hospital_general_info` AS
SELECT *
FROM `bigquery-public-data.cms_medicare.hospital_general_info`;