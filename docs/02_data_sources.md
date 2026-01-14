### Data Sources

This project uses a combination of **CMS Medicare** and **U.S. Census** datasets:

###### CMS Medicare Data
| Table | Source | Description |
| `raw_inpatient_data` | `bigquery-public-data.cms_medicare.inpatient_charges_2015` | Inpatient charges by DRG and provider for 2015 |
| `raw_hospital_general_info` | `bigquery-public-data.cms_medicare.hospital_general_info` | Provider reference data including ownership, location, and quality scores |

###### U.S. Census Data
| Table | Source | Description |
| `zip_code_census_data` | U.S.Census API (via `/ingestion/us_city_data_load_to_bigquery.py`) | zip code, population, and median age for classification |

All raw datasets are loaded into the warehouse as **immutable source-of-truth tables**. Transformations and cleaning occur in dbt models.
