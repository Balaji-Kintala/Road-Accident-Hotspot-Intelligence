# Power BI Dashboard

The Power BI dashboard analyzes road accident patterns across geography, road classification, accident severity, and time of occurrence.

## Dashboard Pages

### Page 1 — Accident Overview
- Reported Accident Cases
- Injured Persons
- Reported Deaths
- Top Accident State
- Top States
- Top Cities
- Road Classification
- Time of Day
- Day vs Night Accident Patterns

### Page 2 — Geography & Severity
- State-wise Accident Cases & Deaths
- State-wise Severity Matrix
- Cases vs Deaths Analysis
- City Fatality Rate
- Death Distribution Analysis

### Page 3 — Road & Time Risk
- Accident Severity by Road Classification
- Accident Distribution by Road Classification
- Accident Cases by Time of Day
- Peak Accident Time Period Distribution
- Road Accident Cases vs Fatality Rate

## Data Source

NCRB — Accidental Deaths & Suicides in India (ADSI), 2023.

## Important Data Note

The datasets are aggregated at different geographical and analytical grains. Therefore, the road-classification and time-occurrence datasets were analyzed as separate analytical views rather than blindly merged, avoiding double-counting caused by incompatible grains.
