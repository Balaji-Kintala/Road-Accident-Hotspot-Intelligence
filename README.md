# 🚗 Road Accident Hotspot Intelligence

## India Road Accident Analysis — 2023

An end-to-end Data Analytics project analyzing road accident patterns across Indian States/UTs and cities using official NCRB 2023 data. The project focuses on accident cases, injuries, deaths, road classifications, time-of-occurrence patterns, and severity indicators to identify accident-risk patterns and areas requiring further road-safety investigation.

## 📌 Business Problem

Authorities need to identify accident-prone cities, road classifications, locations, causes, and time periods so that road-safety interventions can be prioritized.

### Business Question

Which cities, road classifications, locations, causes, and time periods show higher accident and fatality patterns, and where should road-safety interventions be prioritized?

## 🎯 Objectives

- Analyze road accident patterns across Indian States/UTs and cities.
- Compare accident cases across different road classifications.
- Analyze accident occurrence across different time periods.
- Compare reported accidents, injuries, and deaths.
- Identify geographies with higher accident and fatality patterns.
- Analyze road-classification severity indicators.
- Identify peak accident time periods.
- Perform SQL-based analytical analysis.
- Build an interactive 3-page Power BI dashboard.
- Generate business-oriented insights from the available accident data.

## 📊 Data Source

The project uses official 2023 road accident statistics published by the National Crime Records Bureau (NCRB) under the Accidental Deaths & Suicides in India (ADSI) 2023 data.

The datasets contain aggregated accident statistics for States/UTs and cities.

## 🗂️ Data Used

### Road Classification Dataset

The road classification dataset contains accident information across:

- National Highways
- State Highways
- Expressways
- Other Roads

It includes:

- Accident Cases
- Injured Persons
- Deaths
- State/UT and city-level geography

### Time of Occurrence Dataset

The time-of-occurrence dataset contains reported road accident cases across eight time periods:

- 00:00–03:00
- 03:00–06:00
- 06:00–09:00
- 09:00–12:00
- 12:00–15:00
- 15:00–18:00
- 18:00–21:00
- 21:00–24:00

Additional analytical fields were created for:

- Day Accidents
- Night Accidents
- Day Accident Share
- Night Accident Share
- Peak Time Period
- Peak Time Accidents

## 🧹 Data Cleaning

Python and Pandas were used for data preparation and validation.

The data preparation process included:

- Dataset structure inspection
- Data type validation
- Missing-value checks
- Duplicate checks
- Geography-level validation
- Identification of aggregate records
- Removal of aggregate rows where required
- Numerical consistency validation
- Road-classification total validation
- Day and Night accident total validation
- Index reset after cleaning

Final analytical datasets:

- Road Classification: 89 records × 20 columns
- Time of Occurrence: 89 records × 17 columns

## ⚙️ Feature Engineering

### Road Classification

Created:

- Accident Share (%)
- Injury Rate (%)
- Fatality Rate (%)

### Time of Occurrence

Created:

- Day Accidents
- Night Accidents
- Day Accident Share (%)
- Night Accident Share (%)
- Peak Time Period
- Peak Time Accidents

## 🗄️ SQL Analysis

MySQL was used to perform structured analytical queries on the cleaned datasets.

The analysis included:

- Top States/UTs by accident cases
- Top cities by accident cases
- Top States/UTs by deaths
- Top States/UTs by injured persons
- Accident distribution by road classification
- Death distribution by road classification
- Road-classification severity indicators
- Day vs Night accident distribution
- Accident distribution by time period
- Peak accident time by geography
- City-level fatality indicators
- State-level severity comparisons

SQL queries are available in:

`SQL/road_accident_analysis.sql`

## 📈 Key Findings

### State/UT Accident Cases

The highest reported accident-case counts in the State/UT data included:

- Tamil Nadu — 67,213
- Madhya Pradesh — 54,763
- Kerala — 45,981
- Karnataka — 43,439
- Uttar Pradesh — 37,764
- Maharashtra — 31,347
- Rajasthan — 24,861
- Telangana — 22,903
- Andhra Pradesh — 19,949
- Gujarat — 16,349

### City Accident Cases

Examples of cities with high reported accident cases included:

- Delhi — 5,715
- Bengaluru — 4,980
- Chennai — 3,653
- Indore — 3,566
- Hyderabad — 2,943
- Jaipur — 2,914
- Bhopal — 2,906
- Kochi — 2,585
- Thrissur — 2,444
- Jabalpur — 2,319

### Time Pattern

The 18:00–21:00 time period recorded the highest number of accident cases in the analyzed time-of-occurrence dataset.

It was also the peak accident period for 53 of the 89 geographic records.

### Road Classification

The analysis compared accident cases, injured persons, and deaths across:

- Other Roads
- National Highways
- State Highways
- Expressways

Other Roads represented the largest number of reported accident cases within the combined analytical records.

## 📊 Power BI Dashboard

The project includes a **3-page interactive Power BI dashboard**.

### Dashboard Page 1 — Overview

Provides an overall view of:

- Total Reported Accident Cases
- Total Injured Persons
- Total Reported Deaths
- Top Accident State
- Top States by Accident Cases
- Top Cities by Accident Cases
- Road Classification Distribution
- Accident Cases by Time Period
- Day vs Night Accident Patterns

### Dashboard Page 2 — Geography & Severity

Focuses on:

- State-wise Accident Cases and Deaths
- State-wise Severity Analysis
- Accident Cases vs Deaths
- City-level Fatality Rate
- Death Distribution by State/UT

### Dashboard Page 3 — Road & Time Risk

Focuses on:

- Accident Severity by Road Classification
- Accident Distribution by Road Classification
- Accident Cases by Time of Day
- Peak Accident Time Period Distribution
- Accident Cases vs Fatality Rate

The three dashboard screenshots are available in:

`Images/dashboard1.png`

`Images/dashboard2.png`

`Images/dashboard3.png`

The complete Power BI file containing all three dashboard pages is available in:

`PowerBI/Road_Accident_Hotspot_Intelligence.pbix`

## 🛠️ Tools & Technologies

- Python
- Pandas
- NumPy
- MySQL
- Microsoft Power BI
- Jupyter Notebook
- Git
- GitHub

## 🔄 End-to-End Project Workflow

Business Problem
→ Data Collection
→ Data Understanding
→ Data Quality Checks
→ Data Cleaning
→ Data Consistency Validation
→ Feature Engineering
→ SQL Analysis
→ Power BI Visualization
→ Pattern Identification
→ Insights
→ Road-Safety Investigation Areas

## 🔍 Analytical Approach

The project uses two complementary analytical views of the same road-accident problem.

The road-classification dataset was used to analyze accident patterns across different road types, while the time-of-occurrence dataset was used to analyze accident concentration across different time periods.

The datasets were not blindly merged because they represent different analytical grains. Keeping them as separate analytical views avoids inappropriate joins and potential double-counting.

## ⚠️ Data Limitation

The NCRB datasets used in this project are aggregated official statistics and are not individual accident-level GPS records.

Therefore, this project identifies accident-risk patterns and indicators rather than predicting exact physical accident hotspots or establishing causal relationships.

The results should be interpreted as analytical indicators that can support further investigation and road-safety planning.

## 📁 Repository Structure

Road-Accident-Hotspot-Intelligence/
│
├── Images/
│   ├── dashboard1.png
│   ├── dashboard2.png
│   └── dashboard3.png
│
├── PowerBI/
│   └── Road_Accident_Hotspot_Intelligence.pbix
│
├── SQL/
│   └── road_accident_analysis.sql
│
├── data/
│   ├── README.md
│   ├── road_classification_cleaned.csv
│   └── time_occurrence_cleaned.csv
│
└── Road_Accident_Hotspot_Intelligence.ipynb

## 💡 Business Value

The project provides a structured analytical view of road accident patterns across geography, road classification, and time.

The analysis can help identify:

- High-accident geographies
- Road-classification patterns
- Peak accident periods
- Areas with higher reported deaths
- Severity indicators
- Areas requiring further road-safety investigation

## 👨‍💻 Skills Demonstrated

- Data Cleaning
- Data Quality Validation
- Exploratory Data Analysis
- Feature Engineering
- Python
- Pandas
- NumPy
- SQL
- MySQL
- Power BI
- Data Visualization
- Dashboard Development
- Business Intelligence
- Data Storytelling
- Insight Generation
- Git & GitHub

## 📌 Project Status
This project demonstrates an end-to-end data analytics workflow from official data preparation and validation to SQL analysis, business insights, and a 3-page interactive Power BI dashboard.
**Completed**

This project demonstrates an end-to-end data analytics workflow from official data preparation and validation to SQL analysis, business insights, and a 3-page interactive Power BI dashboard.
