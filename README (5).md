<div align="center">

# 🏥 Clinical Trial Analytics

### End-to-End Data Analytics Project | Healthcare · Business Intelligence · Python · SQL · Power BI

<br/>

[![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Pandas](https://img.shields.io/badge/Pandas-2.0+-150458?style=for-the-badge&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![NumPy](https://img.shields.io/badge/NumPy-1.24+-013243?style=for-the-badge&logo=numpy&logoColor=white)](https://numpy.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/)

<br/>

> *Transforming raw clinical trial registry data into actionable intelligence for healthcare stakeholders.*

</div>

---

## 📌 Project Overview

This project delivers a **full-stack clinical data analytics solution** built on real-world data sourced from [ClinicalTrials.gov](https://clinicaltrials.gov/). It covers every stage of the analytics lifecycle — from raw data ingestion and Python-based data cleaning, through structured SQL analysis, to a multi-page interactive Power BI dashboard designed for healthcare decision-makers.

The domain focus is **Type 2 Diabetes Mellitus**, one of the most heavily researched therapeutic areas globally, making this dataset highly representative of real pharmacovigilance and clinical research environments.

---

## 🎯 Business Problem

Clinical trial data is notoriously messy: inconsistent date formats, missing enrollment figures, vague phase labels, and fragmented sponsor information make it difficult for research teams and regulatory bodies to draw reliable conclusions. Healthcare organisations and CROs need:

- A clear picture of **trial activity by phase, sponsor, and study type**
- Understanding of **enrollment patterns** and size distribution across therapeutic areas
- Insight into **trial durations** and how they vary across funder types
- Visibility into **geographic reach** and **demographic inclusivity** of ongoing studies

This project answers those questions through rigorous data cleaning, purposeful SQL analysis, and an executive-ready Power BI dashboard.

---

## 🏹 Project Objectives

| # | Objective |
|---|-----------|
| 1 | Clean and standardise 500 clinical trial records from ClinicalTrials.gov |
| 2 | Engineer meaningful features (trial duration, enrollment category, age group breadth) |
| 3 | Answer key business questions using structured SQL queries |
| 4 | Build an interactive Power BI dashboard for non-technical stakeholders |
| 5 | Surface actionable insights on trial activity, enrollment, and sponsor landscape |

---

## 📂 Dataset Overview

| Attribute | Details |
|-----------|---------|
| **Source** | [ClinicalTrials.gov](https://clinicaltrials.gov/) — US National Library of Medicine |
| **Domain** | Type 2 Diabetes Mellitus clinical research |
| **Raw File** | `ctg-studies.csv` |
| **Cleaned File** | `Clinical_trial_cleaned.csv` |
| **Total Records** | 500 clinical trials |
| **Total Columns (raw)** | 20 |
| **Total Columns (cleaned)** | 23 (3 engineered features added) |

### Column Descriptions

| Column | Description |
|--------|-------------|
| `NCT_Number` | Unique ClinicalTrials.gov identifier (e.g., NCT12345678) |
| `Study_Title` | Full title of the clinical study |
| `Study_Status` | Current status (COMPLETED, RECRUITING, TERMINATED, etc.) |
| `Conditions` | Medical condition(s) under investigation |
| `Interventions` | Drug, device, or procedure being tested |
| `Sponsor` | Primary organisation funding / conducting the trial |
| `Collaborators` | Co-sponsoring organisations (72.6% missing — common in single-sponsor trials) |
| `Sex` | Eligible participant sex (ALL, MALE, FEMALE) |
| `Age` | Eligible age groups as a comma-separated string |
| `Phases` | Trial phase (PHASE1 through PHASE4, or combinations) |
| `Enrollment` | Number of participants enrolled or targeted |
| `Funder_Type` | Funding category (INDUSTRY, NIH, FED, OTHER, etc.) |
| `Study_Type` | INTERVENTIONAL, OBSERVATIONAL, or EXPANDED_ACCESS |
| `Study_Design` | Design model and masking description |
| `Start_Date` | Trial start date |
| `Primary_Completion_Date` | Date primary endpoint data collection ended |
| `Completion_Date` | Full trial completion date |
| `First_Posted` | Date first posted to the registry |
| `Last_Update_Posted` | Most recent registry update date |
| `Locations` | Site name, city, state, and country of trial locations |
| `Trial_Duration_Days` | *(Engineered)* Days between Start_Date and Completion_Date |
| `Enrollment_Category` | *(Engineered)* Small / Medium / Large / Unknown |
| `Age_Group_Count` | *(Engineered)* Number of distinct age groups targeted |

---

## 🛠 Tech Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| **Language** | Python 3.10+ | Data cleaning, feature engineering, export |
| **Data Manipulation** | Pandas, NumPy | DataFrame operations, missing value handling |
| **Database** | MySQL 8.0+ | Business-question SQL analysis |
| **Visualisation** | Power BI Desktop | Interactive dashboard and storytelling |
| **Data Source** | ClinicalTrials.gov | Registry of clinical studies |
| **Version Control** | Git / GitHub | Portfolio hosting |

---

## 🏗 Project Architecture

```
┌─────────────────────────────────────────┐
│          ClinicalTrials.gov             │
│       (ctg-studies.csv — 500 rows)      │
└──────────────────┬──────────────────────┘
                   │  Raw Data Ingestion
                   ▼
┌─────────────────────────────────────────┐
│            Python (Pandas)              │
│  • Missing value assessment             │
│  • Date parsing & standardisation       │
│  • Feature engineering                  │
│  • Data validation & export             │
└──────────────────┬──────────────────────┘
                   │  Clinical_trial_cleaned.csv
                   ▼
┌─────────────────────────────────────────┐
│              MySQL                      │
│  • Business question analysis           │
│  • Aggregations, rankings, filtering    │
│  • Phase, sponsor & enrollment analysis │
└──────────────────┬──────────────────────┘
                   │  Query Results & Insights
                   ▼
┌─────────────────────────────────────────┐
│            Power BI Desktop             │
│  • Multi-page interactive dashboard     │
│  • KPIs, charts, slicers                │
│  • Executive-ready storytelling         │
└──────────────────┬──────────────────────┘
                   │
                   ▼
        📊 Actionable Business Insights
```

---

## 🔄 Project Workflow

### Step 1 — Data Ingestion
The raw dataset (`ctg-studies.csv`, 500 records, 20 columns) was downloaded from ClinicalTrials.gov and loaded into a Pandas DataFrame using `pd.read_csv()`.

### Step 2 — Data Quality Assessment
A systematic missing value audit was conducted, producing a ranked table of `Missing_Count` and `Missing_Percent` for every column. This drove targeted cleaning decisions rather than blanket imputation.

### Step 3 — Data Cleaning & Type Conversion
Five date columns were parsed from mixed string formats to proper `datetime64` dtype using `pd.to_datetime(..., errors='coerce')`, ensuring safe handling of malformed values.

### Step 4 — Feature Engineering
Three new analytical columns were derived from existing fields to unlock richer downstream analysis.

### Step 5 — Data Validation
Negative trial durations (logically impossible — completion before start) were identified and nullified to preserve data integrity.

### Step 6 — Export
The cleaned and enriched DataFrame (23 columns) was exported as `Clinical_trial_cleaned.csv` for SQL loading and Power BI import.

### Step 7 — SQL Analysis
The cleaned dataset was loaded into MySQL. A series of structured queries answered specific business questions about trial volume, phases, enrollment, sponsors, and funder types.

### Step 8 — Power BI Dashboard
The cleaned CSV was imported into Power BI Desktop. Relationships, DAX measures, and custom visuals were built to create a multi-page interactive dashboard.

---

## 🐍 Python Data Cleaning

### Libraries Used

```python
import pandas as pd
import numpy as np
import os
```

### Missing Value Assessment

A `DataFrame` was constructed to surface both the raw count and percentage of missing values per column, sorted descending to prioritise high-impact columns:

```python
missing = pd.DataFrame({
    'Missing_Count': df.isnull().sum(),
    'Missing_Percent': round((df.isnull().sum() / len(df)) * 100, 2)
}).sort_values('Missing_Percent', ascending=False)
```

**Key findings from the audit:**

| Column | Missing % | Notes |
|--------|-----------|-------|
| `Collaborators` | 72.6% | Expected — many single-sponsor trials have no co-funders |
| `Phases` | 50.0% | A significant gap; retained as-is since phase is not always assigned |
| `Locations` | 10.4% | Minor; trials may not report site-level data |
| `Interventions` | 5.6% | Some observational trials have no defined intervention |
| `Primary_Completion_Date` | 3.8% | Incomplete for ongoing trials |
| `Completion_Date` | 3.2% | Incomplete for recruiting / not-yet-started trials |
| `Enrollment` | 0.6% | Minimal; 3 records missing |
| `Study_Design` | 0.2% | Single record |

### Date Type Conversion

Five columns originally stored as strings were converted to `datetime64` using a loop with `errors='coerce'` to safely handle unparseable values:

```python
date_cols = [
    'Start_Date', 'Primary_Completion_Date',
    'Completion_Date', 'First_Posted', 'Last_Update_Posted'
]
for col in date_cols:
    df[col] = pd.to_datetime(df[col], errors='coerce')
```

### Data Validation — Negative Durations

After computing `Trial_Duration_Days`, records where completion preceded the start date (negative values) were identified and replaced with `pd.NA` to prevent misleading statistics:

```python
df.loc[df['Trial_Duration_Days'] < 0, 'Trial_Duration_Days'] = pd.NA
```

### Export

```python
df.to_csv("Clinical_trial_cleaned.csv", index=False)
```

---

## ⚙️ Feature Engineering

Three new columns were engineered to enrich the analytical model beyond what raw fields allow.

### 1. `Trial_Duration_Days`

**Logic:** Subtracts `Start_Date` from `Completion_Date` and extracts the integer number of days.

```python
df['Trial_Duration_Days'] = (df['Completion_Date'] - df['Start_Date']).dt.days
```

**Why it matters:** Raw start and end dates are not analytically useful on their own. A single numeric duration column allows direct comparison, percentile analysis, and filtering — critical for understanding operational timelines across phases and funder types. Negative values (data entry errors) were nullified.

**Result:** 48 trials had computable durations, with a median of ~365 days and maximum of 2,184 days.

---

### 2. `Enrollment_Category`

**Logic:** A custom function maps the numeric `Enrollment` value into one of four size buckets.

```python
def enrollment_category(x):
    if pd.isna(x):      return "Unknown"
    elif x < 100:       return "Small"
    elif x < 500:       return "Medium"
    else:               return "Large"

df['Enrollment_Category'] = df['Enrollment'].apply(enrollment_category)
```

**Thresholds and rationale:**

| Category | Enrollment Range | Business Meaning |
|----------|-----------------|-----------------|
| Small | < 100 | Early-phase or niche trials; high-risk, exploratory |
| Medium | 100–499 | Mid-scale trials; common in Phase 2–3 |
| Large | ≥ 500 | Pivotal or post-market trials; high regulatory significance |
| Unknown | Missing | Enrollment not yet reported |

**Distribution across 500 trials:**

| Category | Count | % |
|----------|-------|---|
| Small | 259 | 51.8% |
| Medium | 180 | 36.0% |
| Large | 58 | 11.6% |
| Unknown | 3 | 0.6% |

---

### 3. `Age_Group_Count`

**Logic:** The `Age` column stores eligible age groups as a comma-separated string (e.g., `"ADULT, OLDER_ADULT"`). Splitting on commas and counting the resulting list elements gives the number of distinct age groups each trial targets.

```python
df['Age_Group_Count'] = (
    df['Age']
    .fillna('')
    .str.split(',')
    .str.len()
)
```

**Why it matters:** Trials targeting multiple age groups demonstrate broader demographic inclusivity, a key consideration in pharmacovigilance and diversity-in-clinical-trials assessments.

**Distribution:**

| Age Groups Targeted | Trials |
|--------------------|--------|
| 1 (narrow focus) | 67 |
| 2 | 412 |
| 3 (widest reach) | 21 |

---

## 🗄️ SQL Analysis

The cleaned dataset was loaded into MySQL for structured business-question analysis. Below are the key analytical areas addressed.

> **Note:** SQL script file(s) are included in the `/sql/` folder of this repository. Each query is documented with its business intent.

### Business Questions Answered

#### 1. Trial Volume by Study Status
**Question:** How many trials fall into each status category?  
**SQL Logic:** `GROUP BY Study_Status` with `COUNT(*)`, ordered descending.  
**Business Value:** Reveals what share of the registry is active vs completed vs withdrawn — a key indicator of pipeline health.

**Key finding:** 296 of 500 trials (59.2%) are COMPLETED; 54 are actively RECRUITING.

---

#### 2. Trial Distribution by Phase
**Question:** How are trials spread across development phases?  
**SQL Logic:** `GROUP BY Phases` with `COUNT(*)`, filtering out NULLs.  
**Business Value:** Phase distribution shows where the therapeutic pipeline is most concentrated — early-stage exploration vs late-stage confirmation.

**Key finding:** Phase 3 leads (72 trials), followed by Phase 1 (60) and Phases 2 and 4 (50 each).

---

#### 3. Enrollment Analysis by Phase
**Question:** Which phases enroll the most participants on average?  
**SQL Logic:** `AVG(Enrollment)`, `SUM(Enrollment)`, `GROUP BY Phases`.  
**Business Value:** Enrollment scale directly correlates with trial cost and regulatory weight. Phase 4 (post-market) studies typically enrol far more participants than early phases.

---

#### 4. Sponsor Landscape — Top Sponsors
**Question:** Which organisations sponsor the most trials?  
**SQL Logic:** `GROUP BY Sponsor`, `COUNT(*) AS trial_count`, `ORDER BY trial_count DESC`, `LIMIT 10`.  
**Business Value:** Identifies the most active players in the Type 2 Diabetes research space, useful for competitive landscape analysis.

**Top sponsors identified:** AstraZeneca (22 trials), Chong Kun Dang Pharmaceutical (21), Daewoong Pharmaceutical (10), Merck Sharp & Dohme LLC (9), GlaxoSmithKline (9).

---

#### 5. Funder Type Breakdown
**Question:** What proportion of trials are industry-funded vs government vs other?  
**SQL Logic:** `GROUP BY Funder_Type` with `COUNT(*)` and percentage calculation.  
**Business Value:** Funding source influences trial design, transparency, and publication bias — a critical variable for evidence quality assessment.

**Distribution:** OTHER (260, 52%), INDUSTRY (225, 45%), OTHER_GOV (7), FED (5), NIH (2).

---

#### 6. Enrollment Category Distribution
**Question:** What proportion of trials are small, medium, or large-scale?  
**SQL Logic:** `GROUP BY Enrollment_Category` with count and percentage.  
**Business Value:** Characterises the overall scale of the research landscape — a majority of small trials may indicate early-stage or niche research activity.

---

#### 7. Study Type Composition
**Question:** What is the split between Interventional, Observational, and Expanded Access studies?  
**SQL Logic:** `GROUP BY Study_Type` with `COUNT(*)`.  
**Business Value:** Interventional studies are the backbone of drug approval pipelines; observational studies contribute to pharmacovigilance and real-world evidence.

**Distribution:** INTERVENTIONAL (428, 85.6%), OBSERVATIONAL (71, 14.2%), EXPANDED_ACCESS (1).

---

#### 8. Sex Eligibility Analysis
**Question:** What proportion of trials include all sexes vs sex-restricted designs?  
**SQL Logic:** `GROUP BY Sex` with `COUNT(*)`.  
**Business Value:** Sex-inclusive design is a regulatory priority (FDA diversity guidelines); restricted trials may flag potential generalisability concerns.

**Distribution:** ALL (476, 95.2%), MALE-only (19), FEMALE-only (5).

---

#### 9. Trial Duration Analysis
**Question:** What are the average, minimum, and maximum trial durations?  
**SQL Logic:** `AVG(Trial_Duration_Days)`, `MIN()`, `MAX()`, optionally `GROUP BY Phases` or `Funder_Type`.  
**Business Value:** Duration is a key operational metric. Longer trials carry higher costs and attrition risk. Comparing durations across phases validates whether phase progression timelines align with industry benchmarks.

**Key stats:** Mean duration ~457 days; median ~366 days; max 2,184 days.

---

#### 10. Age Group Inclusivity
**Question:** How many trials target multiple age groups?  
**SQL Logic:** `GROUP BY Age_Group_Count` with `COUNT(*)`.  
**Business Value:** Trials targeting a single age group may not produce generalisable evidence — particularly important in diabetes research where elderly populations are disproportionately affected.

---

## 📊 Power BI Dashboard

The Power BI dashboard (`clinical_trial_project_dashboard.pbix`) provides an interactive, multi-page view of the clinical trial landscape for Type 2 Diabetes trials.

> ⚠️ **Note:** The `.pbix` file is a binary format that cannot be parsed programmatically. Dashboard page descriptions below are based on the project context, engineered features, and SQL analysis outcomes. Please update this section with your actual page titles, KPI values, and visual descriptions once you have the screenshots.

---

### 📄 Page 1 — Executive Overview

**Purpose:** High-level summary of the entire trial registry for leadership and non-technical stakeholders.

**Suggested KPIs:**
- Total Trials (500)
- Completed Trials (296)
- Actively Recruiting (54)
- Total Enrolled Participants (sum of Enrollment)

**Suggested Visuals:**
- KPI cards for headline metrics
- Donut / pie chart — Trial Status breakdown
- Bar chart — Study Type composition (Interventional vs Observational)
- Bar chart — Funder Type distribution

**Business Story:** At a glance, this page communicates the state of Type 2 Diabetes clinical research — how many trials exist, how many have concluded, and who is paying for them.

---

### 📄 Page 2 — Phase & Enrollment Analysis

**Purpose:** Understand where the therapeutic pipeline is concentrated and the scale of participant recruitment.

**Suggested KPIs:**
- Trials by Phase (Phase 3 leads with 72)
- Average Enrollment per Trial (~481)
- Enrollment Category split (Small 51.8% · Medium 36% · Large 11.6%)

**Suggested Visuals:**
- Clustered bar chart — Trial count by Phase
- Stacked bar chart — Enrollment Category by Phase
- Histogram or scatter — Enrollment distribution
- Card — Largest single trial enrollment (58,326 participants)

**Business Story:** This page reveals whether research is concentrated in high-risk early phases or pivotal late-stage trials, and whether the recruitment numbers are adequate for statistical power.

---

### 📄 Page 3 — Sponsor & Funder Landscape

**Purpose:** Identify the key industry and non-industry players and their relative trial activity.

**Suggested Visuals:**
- Horizontal bar chart — Top 10 Sponsors by trial count
- Donut chart — Funder Type split (Industry vs Other vs Government)
- Table — Sponsor name, trial count, total enrollment, and average duration

**Business Story:** AstraZeneca and Chong Kun Dang lead the sponsor count, reflecting heavy pharmaceutical investment in the T2D space. Industry funding accounts for 45% of trials, with "Other" (academic, non-profit) leading at 52%.

---

### 📄 Page 4 — Trial Duration & Timeline

**Purpose:** Operational analysis of how long trials run, and where delays or outliers exist.

**Suggested KPIs:**
- Average Trial Duration (457 days)
- Median Duration (~366 days)
- Longest Trial (2,184 days / ~6 years)

**Suggested Visuals:**
- Line or area chart — Trial start dates over time (year trend)
- Box plot or bar chart — Duration by Phase
- Scatter plot — Enrollment vs Duration

**Business Story:** Most trials run roughly one year (median 366 days), but outliers extend beyond 6 years. Early-phase trials tend to be shorter while large Phase 3/4 studies run longer — consistent with real-world CRO expectations.

---

### 📄 Page 5 — Demographics & Inclusivity

**Purpose:** Assess how inclusive trials are across sex and age group dimensions.

**Suggested KPIs:**
- % Trials Open to ALL sexes (95.2%)
- Trials targeting multiple age groups (412 targeting 2 groups)

**Suggested Visuals:**
- Donut chart — Sex eligibility (ALL / MALE / FEMALE)
- Bar chart — Age_Group_Count distribution
- Map visual — Geographic spread of trial locations (if Power BI map used)

**Business Story:** The overwhelming majority of trials enrol both sexes and multiple age groups, which is positive for generalisability. However, the 5% sex-restricted trials warrant further scrutiny from a pharmacovigilance standpoint.

---

## 🖼️ Dashboard Screenshots

> 📌 Add your actual dashboard screenshots to an `/images/` folder in this repository and replace the placeholders below.

```
![Executive Overview](images/dashboard_page1_executive_overview.png)
![Phase & Enrollment Analysis](images/dashboard_page2_phase_enrollment.png)
![Sponsor & Funder Landscape](images/dashboard_page3_sponsor_funder.png)
![Trial Duration & Timeline](images/dashboard_page4_duration_timeline.png)
![Demographics & Inclusivity](images/dashboard_page5_demographics.png)
```

---

## 💡 Key Insights

1. **Pipeline Maturity:** 59.2% of trials are COMPLETED, suggesting this dataset represents a largely retrospective slice of T2D research — useful for benchmarking and evidence synthesis.

2. **Phase 3 Dominance:** Phase 3 is the most represented phase (72 trials), indicating substantial late-stage confirmatory research activity in the diabetes therapeutic area.

3. **Small Trial Majority:** 51.8% of trials are classified as "Small" (<100 participants), reflecting a research landscape dominated by early-phase and investigator-initiated studies.

4. **Industry-Leaning Funding:** Industry funds 45% of trials, while academic/non-profit ("OTHER") leads at 52% — a relatively balanced ecosystem, though industry funding concentration may affect publication objectivity.

5. **Top Sponsors Are Global Pharma Giants:** AstraZeneca (22 trials) and Chong Kun Dang Pharmaceutical (21) are the most prolific sponsors, reflecting both multinational and regional pharmaceutical investment.

6. **High Sex Inclusivity:** 95.2% of trials are open to all sexes, which aligns with modern FDA and EMA diversity guidance — a positive signal for the generalisability of findings.

7. **Age Inclusivity:** 82.4% of trials target exactly two age groups, balancing demographic breadth with focused study populations.

8. **Collaborator Sparsity:** 72.6% of trials list no collaborators, indicating most T2D trials are run by a single primary sponsor without formal co-funding partnerships.

9. **Missing Phase Data:** 50% of trials have no phase assigned — largely observational studies and expanded access programs, which often operate outside the standard phase framework.

10. **Duration Outliers:** While median trial duration is ~366 days, some trials run over 6 years, likely large multi-center Phase 3 or 4 outcomes studies requiring long follow-up periods.

---

## 📁 Repository Structure

```
clinical-trial-analytics/
│
├── 📓 notebooks/
│   └── Clinical_Trial_Analytics.ipynb     # Data cleaning & feature engineering
│
├── 🗄️ sql/
│   └── clinical_trial_analysis.sql        # All SQL business queries
│
├── 📊 dashboard/
│   └── clinical_trial_project_dashboard.pbix  # Power BI dashboard file
│
├── 📂 data/
│   ├── ctg-studies.csv                    # Raw dataset (ClinicalTrials.gov)
│   └── Clinical_trial_cleaned.csv         # Cleaned & enriched dataset
│
├── 🖼️ images/
│   ├── dashboard_page1_executive_overview.png
│   ├── dashboard_page2_phase_enrollment.png
│   ├── dashboard_page3_sponsor_funder.png
│   ├── dashboard_page4_duration_timeline.png
│   └── dashboard_page5_demographics.png
│
└── 📄 README.md
```

---

## ⚙️ Installation

### Prerequisites

- Python 3.10+
- MySQL 8.0+
- Power BI Desktop (Windows)
- pip

### Python Dependencies

```bash
pip install pandas numpy jupyter
```

---

## ▶️ How to Run

### 1. Data Cleaning (Python)

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/clinical-trial-analytics.git
cd clinical-trial-analytics

# Launch Jupyter
jupyter notebook notebooks/Clinical_Trial_Analytics.ipynb
```

Run all cells in order. The notebook will:
- Load `ctg-studies.csv`
- Perform data quality assessment
- Convert date columns
- Engineer three new features
- Export `Clinical_trial_cleaned.csv`

### 2. SQL Analysis (MySQL)

```sql
-- In MySQL Workbench or CLI:
-- 1. Create a database
CREATE DATABASE clinical_trials;
USE clinical_trials;

-- 2. Import the cleaned CSV
-- (Use Table Data Import Wizard in MySQL Workbench, or LOAD DATA INFILE)

-- 3. Run the analysis script
SOURCE sql/clinical_trial_analysis.sql;
```

### 3. Power BI Dashboard

1. Open **Power BI Desktop**
2. Open `dashboard/clinical_trial_project_dashboard.pbix`
3. If prompted, update the data source path to point to your local `Clinical_trial_cleaned.csv`
4. Click **Refresh** to reload data
5. Explore the dashboard pages using slicers and filters

---

## 🔮 Future Improvements

| Enhancement | Description |
|-------------|-------------|
| **NLP on Study Titles** | Apply text mining or topic modelling (LDA) to automatically cluster trials by therapeutic approach |
| **Geospatial Visualisation** | Parse the `Locations` column to extract countries and plot a world map of trial density in Power BI |
| **Sponsor Network Graph** | Build a graph showing sponsor–collaborator relationships using NetworkX or Power BI's network visual |
| **Predictive Modelling** | Train a classification model to predict trial completion vs termination based on phase, enrollment, and funder type |
| **Automated Data Refresh** | Use the ClinicalTrials.gov API (v2) to automate daily data pulls and refresh the dashboard on a schedule |
| **Condition Normalisation** | Standardise condition names (e.g., "Diabetes Type 2", "T2D", "Type II Diabetes Mellitus") using string matching or MeSH code mapping |
| **Expanded Dataset** | Scale beyond 500 trials to the full ClinicalTrials.gov export for a more comprehensive landscape analysis |

---

## 🧠 Skills Demonstrated

<details>
<summary><strong>Click to expand full skills list</strong></summary>

| Category | Skills |
|----------|--------|
| **Programming** | Python, Pandas, NumPy |
| **Data Engineering** | Data cleaning, type conversion, missing value handling, feature engineering |
| **Exploratory Analysis** | Descriptive statistics, value distribution analysis, outlier detection |
| **Databases** | MySQL, SQL querying, aggregation, filtering, ranking, GROUP BY analysis |
| **Business Intelligence** | Power BI Desktop, DAX, data modelling, dashboard design |
| **Data Visualisation** | KPI cards, bar charts, donut charts, scatter plots, interactive slicers |
| **Healthcare Domain** | Clinical trial phases, pharmacovigilance concepts, registry data interpretation |
| **Soft Skills** | Data storytelling, translating technical findings into business language |
| **DevOps / Portfolio** | Git, GitHub, repository structuring, README documentation |

</details>

---

## 👤 About the Author

> **[Your Name]**  
> Data Analyst | Healthcare Analytics | Business Intelligence

I am a data professional specialising in healthcare and clinical data analytics. This project demonstrates my ability to take real-world, messy registry data and transform it into a structured, insight-rich analytics product — from raw Python cleaning through SQL analysis to executive Power BI dashboards.

<div align="left">

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/YOUR_LINKEDIN)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/YOUR_USERNAME)
[![Email](https://img.shields.io/badge/Email-Contact-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:your.email@example.com)

</div>

---

## 📄 License

```
MIT License

Copyright (c) 2024 [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

---

<div align="center">

*⭐ If this project added value to your work or learning, a star on GitHub goes a long way!*

</div>
