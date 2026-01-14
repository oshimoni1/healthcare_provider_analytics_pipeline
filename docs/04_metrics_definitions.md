### Metrics Definition

This project calculates the following metrics:

**| Metric | Definition  | Business Purpose |**
| Reimbursement Rate | Medicare payment / total charges | Identify providers with good financial reputation |
| Total Discharges | Number of discharges per provider | Assess provider volume and patient load |
| DRG Count | Count of distinct DRGs per provider | Determine hospital service diversity |
| Discharges Per Capita | Total discharges / zip_code_population | Identify providers with high traffic in relation to the local population |
| Mortality Score | mortality_measures_better_count - mortality_measures_worse_count | Identify good quality hospitals |
| Readmission Score | readmission_measures_better_count - readmission_measures_worse_count | Identify good quality hospitals |

All metrics are computed in dbt fact and mart tables and exposed via Tableau.
