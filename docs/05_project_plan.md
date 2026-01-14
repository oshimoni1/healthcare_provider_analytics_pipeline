# Project Plan

This project was developed using a structured analytics workflow. 

Jira Card: https://oshimoni.atlassian.net/jira/software/projects/KAN/list?jql=project+%3D+KAN+ORDER+BY+created+DESC&selectedIssue=KAN-4&atlOrigin=eyJpIjoiMGRjODAxNTNmZmM0NDc1NzhiMWQ1YTI5NzU0ODdjMzciLCJwIjoiaiJ9

## Milestones

| Task | Description | Status |
| Data Ingestion | Load cms_medicare & U.S. Census data into raw BigQuery tables | Completed |
| Staging Layer | Standardize raw tables in dbt | Completed |
| Intermediate Layer | Join providers to zipcode census data | Completed |
| Dimension / Fact Tables | Build reference and aggregated tables | Completed |
| Analytics Marts | Create business-facing tables for dashboards | Completed |
| Dashboard | Visualize key metrics | Completed |

## Design Decisions
- **Filters:** Filter to `Midwest` states with `zipcode_population between 1000 and 30,000`
- **Layered dbt Modeling:** Staging → Intermediate → Dimension/Fact → Marts
- **Testing:** dbt tests applied for `not_null`, `unique`, and `accepted_values` on key columns
