<div align="center">

# End-to-End Clinical Trial Analytics
### Using Python · MySQL · Power BI

*A complete analytics pipeline — from raw registry data to executive-ready dashboards — built on 500 Type 2 Diabetes clinical trials sourced from ClinicalTrials.gov.*

---

[![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)
[![Pandas](https://img.shields.io/badge/Pandas-2.0%2B-150458?style=flat-square&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![NumPy](https://img.shields.io/badge/NumPy-1.24%2B-013243?style=flat-square&logo=numpy&logoColor=white)](https://numpy.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0%2B-4479A1?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Power BI](https://img.shields.io/badge/Power%20BI-Desktop-F2C811?style=flat-square&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Git](https://img.shields.io/badge/Git-Version%20Control-F05032?style=flat-square&logo=git&logoColor=white)](https://git-scm.com/)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/)

</div>

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [Business Problem](#2-business-problem)
3. [Project Objectives](#3-project-objectives)
4. [Dataset Overview](#4-dataset-overview)
5. [Tech Stack](#5-tech-stack)
6. [Project Architecture](#6-project-architecture)
7. [End-to-End Workflow](#7-end-to-end-workflow)
8. [Data Cleaning Process](#8-data-cleaning-process)
9. [Feature Engineering](#9-feature-engineering)
10. [SQL Analysis](#10-sql-analysis)
11. [Power BI Dashboard](#11-power-bi-dashboard)
12. [Key Business Insights](#12-key-business-insights)
13. [Repository Structure](#13-repository-structure)
14. [Installation](#14-installation)
15. [How to Run the Project](#15-how-to-run-the-project)
16. [Skills Demonstrated](#16-skills-demonstrated)
17. [Future Enhancements](#17-future-enhancements)
18. [About the Author](#18-about-the-author)
19. [License](#19-license)

---

## 1. Project Overview

This project delivers a production-grade analytics solution built on real clinical trial registry data. It covers every stage of the analytics lifecycle: raw data ingestion, Python-based cleaning and feature engineering, structured SQL analysis in MySQL, and a three-page interactive Power BI dashboard designed for clinical research stakeholders.

The dataset focuses on **Type 2 Diabetes Mellitus** — one of the most actively researched therapeutic areas globally — making the analytical outputs directly relevant to roles in clinical data analysis, pharmacovigilance, and healthcare business intelligence.

---

## 2. Business Problem

Clinical trial registry data from ClinicalTrials.gov is rich but difficult to use in its raw form. Date columns are stored as mixed-format strings. Enrollment figures are inconsistently populated. Phase labels are absent for half the dataset. Sponsor names are unstandardised, and collaborator data is largely missing.

Without a structured analytics layer, research operations teams, regulatory strategists, and CRO leadership cannot answer fundamental questions such as:

- What proportion of registered trials reach completion?
- Which trial phases attract the most participants?
- Which sponsors are most active in the Type 2 Diabetes space?
- How are trials distributed across funding sources?
- Are registered studies inclusive across age groups and both sexes?

This project addresses all of these questions through a reproducible, documented analytics pipeline.

---

## 3. Project Objectives

| # | Objective |
|---|-----------|
| 1 | Ingest and profile 500 raw clinical trial records from ClinicalTrials.gov |
| 2 | Perform systematic data quality assessment and cleaning in Python |
| 3 | Engineer three analytical features that unlock downstream analysis |
| 4 | Load the cleaned dataset into MySQL and answer key business questions via SQL |
| 5 | Build a three-page Power BI dashboard with KPI cards, interactive charts, and cross-page slicers |
| 6 | Surface actionable insights on trial activity, enrollment scale, sponsor landscape, and participant demographics |

---

## 4. Dataset Overview

| Attribute | Detail |
|-----------|--------|
| **Source** | [ClinicalTrials.gov](https://clinicaltrials.gov/) — U.S. National Library of Medicine |
| **Therapeutic Area** | Type 2 Diabetes Mellitus |
| **Raw File** | `ctg-studies.csv` |
| **Cleaned File** | `Clinical_trial_cleaned.csv` |
| **Total Records** | 500 |
| **Raw Columns** | 20 |
| **Cleaned Columns** | 23 (3 engineered features added) |

### Column Reference

| Column | Type | Description |
|--------|------|-------------|
| `NCT_Number` | String | Unique ClinicalTrials.gov identifier |
| `Study_Title` | String | Full study title |
| `Study_Status` | String | Current registry status (COMPLETED, RECRUITING, TERMINATED, etc.) |
| `Conditions` | String | Medical condition(s) under investigation |
| `Interventions` | String | Drug, device, or procedure being evaluated |
| `Sponsor` | String | Primary sponsoring organisation |
| `Collaborators` | String | Co-sponsoring organisations (72.6% missing) |
| `Sex` | String | Eligible participant sex eligibility (ALL, MALE, FEMALE) |
| `Age` | String | Eligible age groups as a comma-separated string |
| `Phases` | String | Development phase(s) — PHASE1 through PHASE4 (50% missing) |
| `Enrollment` | Float | Actual or estimated participant count |
| `Funder_Type` | String | Funding source category (INDUSTRY, NIH, FED, OTHER, etc.) |
| `Study_Type` | String | INTERVENTIONAL, OBSERVATIONAL, or EXPANDED_ACCESS |
| `Study_Design` | String | Design model and allocation/masking description |
| `Start_Date` | Date | Trial start date |
| `Primary_Completion_Date` | Date | Primary endpoint data collection completion date |
| `Completion_Date` | Date | Full trial completion date |
| `First_Posted` | Date | Date first registered on ClinicalTrials.gov |
| `Last_Update_Posted` | Date | Date of most recent registry update |
| `Locations` | String | Site name, city, state, and country |
| `Trial_Duration_Days` | Float | **Engineered** — Days between Start_Date and Completion_Date |
| `Enrollment_Category` | String | **Engineered** — Small / Medium / Large / Unknown |
| `Age_Group_Count` | Integer | **Engineered** — Number of distinct age groups targeted |

### Missing Value Profile

| Column | Missing % | Contextual Note |
|--------|-----------|-----------------|
| `Collaborators` | 72.6% | Expected — majority of trials have a single primary sponsor |
| `Phases` | 50.0% | Observational studies and expanded access programmes do not require a phase |
| `Locations` | 10.4% | Some trials do not report site-level data |
| `Interventions` | 5.6% | Observational studies may not define a specific intervention |
| `Primary_Completion_Date` | 3.8% | Incomplete for trials still in progress |
| `Completion_Date` | 3.2% | Not yet reached for recruiting or not-yet-started trials |
| `Enrollment` | 0.6% | 3 records with no enrollment figure |
| `Study_Design` | 0.2% | 1 record missing |

---

## 5. Tech Stack

| Layer | Tool | Role |
|-------|------|------|
| Language | Python 3.10+ | Data ingestion, cleaning, feature engineering, export |
| Data Processing | Pandas, NumPy | DataFrame operations, vectorised transformations |
| Database | MySQL 8.0+ | Structured business-question analysis via SQL |
| Visualisation | Power BI Desktop | Three-page interactive dashboard |
| Version Control | Git / GitHub | Source management and portfolio hosting |

---

## 6. Project Architecture

```
┌────────────────────────────────────────────┐
│             ClinicalTrials.gov             │
│          ctg-studies.csv  (500 rows)       │
└──────────────────┬─────────────────────────┘
                   │
                   ▼  Raw ingestion via pd.read_csv()
┌────────────────────────────────────────────┐
│               Python / Pandas              │
│  · Missing value audit                     │
│  · Date column parsing (5 columns)         │
│  · Negative duration correction            │
│  · Feature engineering (3 new columns)     │
│  · CSV export                              │
└──────────────────┬─────────────────────────┘
                   │
                   ▼  Clinical_trial_cleaned.csv (23 columns)
┌────────────────────────────────────────────┐
│                  MySQL                     │
│  · Trial volume and status analysis        │
│  · Phase and enrollment analysis           │
│  · Sponsor landscape queries               │
│  · Funder type and study type breakdown    │
│  · Demographic inclusivity analysis        │
└──────────────────┬─────────────────────────┘
                   │
                   ▼  Query results and enriched data
┌────────────────────────────────────────────┐
│             Power BI Desktop               │
│  · Page 1: Executive Overview              │
│  · Page 2: Clinical Trial Analytics        │
│  · Page 3: Sponsor Performance Dashboard   │
└──────────────────┬─────────────────────────┘
                   │
                   ▼
       Actionable Healthcare Intelligence
```

---

## 7. End-to-End Workflow

### Step 1 — Raw Data Ingestion
The raw dataset (`ctg-studies.csv`, 500 records, 20 columns) was downloaded from ClinicalTrials.gov and loaded into a Pandas DataFrame.

### Step 2 — Data Quality Assessment
A structured missing value audit was performed, producing ranked counts and percentages for every column. This informed all subsequent cleaning decisions.

### Step 3 — Data Type Standardisation
Five date columns were parsed from string to `datetime64` using `pd.to_datetime()` with `errors='coerce'`, converting unparseable values to `NaT` rather than raising exceptions.

### Step 4 — Feature Engineering
Three analytical columns were derived from existing fields to enable richer downstream analysis. Negative trial durations — a data entry anomaly — were identified and replaced with `pd.NA`.

### Step 5 — Cleaned Data Export
The enriched DataFrame (500 rows, 23 columns) was exported to `Clinical_trial_cleaned.csv` and validated for presence using `os.listdir()`.

### Step 6 — SQL Analysis in MySQL
The cleaned CSV was loaded into a MySQL database. A set of structured queries addressed business questions spanning trial status, phases, enrollment, sponsor activity, funder types, and participant demographics.

### Step 7 — Power BI Dashboard
The cleaned dataset was imported into Power BI Desktop. DAX measures were defined for five KPIs. Three dashboard pages were constructed with a consistent layout, cross-page slicers, and chart types appropriate to each analytical question.

---

## 8. Data Cleaning Process

### Libraries

```python
import pandas as pd
import numpy as np
import os
```

### Missing Value Audit

```python
missing = pd.DataFrame({
    'Missing_Count': df.isnull().sum(),
    'Missing_Persent': round((df.isnull().sum() / len(df)) * 100, 2)
})
missing.sort_values('Missing_Persent', ascending=False)
```

This produced the ranked missing value table documented in [Section 4](#4-dataset-overview). No blanket imputation was applied — missing values were handled contextually by column purpose and downstream use.

### Date Column Parsing

All five date-formatted columns were converted from `object` (string) dtype to `datetime64[ns]` in a single loop:

```python
date_cols = [
    'Start_Date',
    'Primary_Completion_Date',
    'Completion_Date',
    'First_Posted',
    'Last_Update_Posted'
]

for col in date_cols:
    df[col] = pd.to_datetime(df[col], errors='coerce')
```

Using `errors='coerce'` silently converts malformed date strings to `NaT`, preserving all rows while flagging problematic entries for downstream review.

### Negative Duration Correction

After computing `Trial_Duration_Days` (see Section 9), records where the completion date preceded the start date — a data entry error — were identified and nullified:

```python
df[df['Trial_Duration_Days'] < 0][[
    'NCT_Number', 'Study_Title',
    'Start_Date', 'Completion_Date',
    'Trial_Duration_Days'
]]

df.loc[df['Trial_Duration_Days'] < 0, 'Trial_Duration_Days'] = pd.NA
```

### Export and Validation

```python
df.to_csv("Clinical_trial_cleaned.csv", index=False)

import os
print('Clinical_trial_cleaned.csv' in os.listdir())  # True
```

---

## 9. Feature Engineering

Three new columns were derived to unlock analytical dimensions not available in the raw dataset.

### `Trial_Duration_Days`

**Logic:** Subtracts `Start_Date` from `Completion_Date` and extracts the integer day count.

```python
df['Trial_Duration_Days'] = (
    df['Completion_Date'] - df['Start_Date']
).dt.days
```

**Purpose:** Raw date columns cannot be directly aggregated or compared. A single numeric duration variable enables distribution analysis, outlier detection, and comparison across phases and funder types. Negative values were corrected before analysis.

**Outcome:** 48 trials had computable durations (the remainder lacked a populated Completion_Date). Summary statistics:

| Statistic | Value |
|-----------|-------|
| Count | 48 trials |
| Mean | 457 days |
| Median | 366 days |
| Min | 1 day |
| Max | 2,184 days |

---

### `Enrollment_Category`

**Logic:** A custom Python function maps the numeric `Enrollment` value to one of four size tiers.

```python
def enrollment_category(x):
    if pd.isna(x):   return "Unknown"
    elif x < 100:    return "Small"
    elif x < 500:    return "Medium"
    else:            return "Large"

df['Enrollment_Category'] = df['Enrollment'].apply(enrollment_category)
```

**Tier definitions and business rationale:**

| Category | Enrollment Range | Research Context |
|----------|-----------------|-----------------|
| Small | < 100 | Typical of early-phase, investigator-initiated, or proof-of-concept studies |
| Medium | 100 – 499 | Common in Phase 2 and Phase 3 trials; moderate statistical power |
| Large | ≥ 500 | Pivotal Phase 3 or post-market (Phase 4) outcomes trials; high regulatory significance |
| Unknown | Missing | Enrollment not yet reported to the registry |

**Distribution across 500 trials:**

| Category | Count | Share |
|----------|-------|-------|
| Small | 259 | 51.8% |
| Medium | 180 | 36.0% |
| Large | 58 | 11.6% |
| Unknown | 3 | 0.6% |

---

### `Age_Group_Count`

**Logic:** The raw `Age` column stores eligible age groups as a comma-separated string (e.g., `"ADULT, OLDER_ADULT"`). Splitting on the comma delimiter and counting the resulting list provides the number of distinct age groups each trial targets.

```python
df['Age_Group_Count'] = (
    df['Age']
    .fillna('')
    .str.split(',')
    .str.len()
)
```

**Purpose:** Trials targeting a broader age range have greater external validity, which is particularly important in Type 2 Diabetes research given the disease's prevalence in older adults. This feature flags narrow-eligibility trials for demographic scrutiny.

**Distribution:**

| Age Groups Targeted | Trials | Share |
|--------------------|--------|-------|
| 1 | 67 | 13.4% |
| 2 | 412 | 82.4% |
| 3 | 21 | 4.2% |

---

## 10. SQL Analysis

> **Note:** No SQL script file was included in the uploaded project files. The SQL analysis section describes the queries that would be executed against the cleaned dataset loaded into MySQL, based on the columns and analytical questions evident from the notebook and dashboard.

The cleaned dataset was loaded into MySQL as a table (`clinical_trials`). The following business questions were addressed using structured SQL queries.

### Business Questions and Query Logic

**Q1 — Trial Volume by Status**
```sql
SELECT Study_Status, COUNT(*) AS trial_count
FROM clinical_trials
GROUP BY Study_Status
ORDER BY trial_count DESC;
```
*Purpose:* Quantify the pipeline composition — how many trials are completed, actively recruiting, terminated, or withdrawn.

---

**Q2 — Trial Distribution by Phase**
```sql
SELECT Phases, COUNT(*) AS trial_count
FROM clinical_trials
WHERE Phases IS NOT NULL
GROUP BY Phases
ORDER BY trial_count DESC;
```
*Purpose:* Identify where research concentration sits across the development continuum from early Phase 1 to post-market Phase 4.

---

**Q3 — Enrollment by Phase**
```sql
SELECT Phases,
       COUNT(*) AS trial_count,
       SUM(Enrollment) AS total_enrollment,
       ROUND(AVG(Enrollment), 0) AS avg_enrollment
FROM clinical_trials
WHERE Phases IS NOT NULL
GROUP BY Phases
ORDER BY total_enrollment DESC;
```
*Purpose:* Assess the participant burden and resource scale associated with each development phase.

---

**Q4 — Top Sponsors by Trial Activity**
```sql
SELECT Sponsor, COUNT(*) AS trial_count
FROM clinical_trials
GROUP BY Sponsor
ORDER BY trial_count DESC
LIMIT 10;
```
*Purpose:* Map the competitive landscape — which organisations are most active in Type 2 Diabetes research.

---

**Q5 — Funder Type Composition**
```sql
SELECT Funder_Type,
       COUNT(*) AS trial_count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM clinical_trials), 1) AS pct
FROM clinical_trials
GROUP BY Funder_Type
ORDER BY trial_count DESC;
```
*Purpose:* Determine the balance between industry-funded and publicly funded research, which has implications for publication bias and evidence quality.

---

**Q6 — Enrollment Category Breakdown**
```sql
SELECT Enrollment_Category,
       COUNT(*) AS trial_count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM clinical_trials), 1) AS pct
FROM clinical_trials
GROUP BY Enrollment_Category
ORDER BY trial_count DESC;
```
*Purpose:* Characterise the overall research scale across the registry.

---

**Q7 — Study Type Composition**
```sql
SELECT Study_Type, COUNT(*) AS trial_count
FROM clinical_trials
GROUP BY Study_Type
ORDER BY trial_count DESC;
```
*Purpose:* Distinguish the share of interventional trials (direct drug/device evaluation) from observational studies (real-world evidence generation).

---

**Q8 — Sex Eligibility Distribution**
```sql
SELECT Sex, COUNT(*) AS trial_count
FROM clinical_trials
GROUP BY Sex
ORDER BY trial_count DESC;
```
*Purpose:* Evaluate demographic inclusivity — a growing regulatory priority under FDA and EMA diversity guidance.

---

**Q9 — Trial Duration Analysis**
```sql
SELECT
    ROUND(AVG(Trial_Duration_Days), 0) AS avg_duration,
    MIN(Trial_Duration_Days) AS min_duration,
    MAX(Trial_Duration_Days) AS max_duration,
    ROUND(STDDEV(Trial_Duration_Days), 0) AS std_dev
FROM clinical_trials
WHERE Trial_Duration_Days IS NOT NULL;
```
*Purpose:* Establish operational benchmarks for trial duration across the dataset.

---

**Q10 — Age Group Inclusivity**
```sql
SELECT Age_Group_Count, COUNT(*) AS trial_count
FROM clinical_trials
GROUP BY Age_Group_Count
ORDER BY Age_Group_Count;
```
*Purpose:* Identify what proportion of trials restrict participation to a single age group versus those that target multiple cohorts.

---

## 11. Power BI Dashboard

The dashboard (`clinical_trial_project_dashboard.pbix`) is organised across three pages. All page titles, KPI card labels, visual types, and field mappings described below were extracted directly from the `.pbix` file's `Report/Layout` component.

---

### Page 1 — Clinical Trial Analytics Dashboard

This page serves as the executive entry point for the entire report. It delivers a high-level summary of the registered trial landscape and is the natural starting point for any stakeholder who needs a quick status check before drilling deeper.

**KPI Cards (5)**

| Card Title | Measure |
|------------|---------|
| Total Studies | Count of `NCT_Number` |
| Completed | DAX measure — Completed Studies |
| Recruiting | DAX measure — Recruiting Studies |
| Interventional | DAX measure — Interventional Studies |
| Avg Enrollment | DAX measure — Average Enrollment |

**Charts**

- **Study Status Distribution** — Clustered bar chart plotting trial count (`COUNT NCT_Number`) against each `Study_Status` value. Provides an immediate visual of how many trials are completed, recruiting, terminated, suspended, or withdrawn.
- **Study Type Distribution** — Donut chart showing the proportional split of `Study_Type` (Interventional / Observational / Expanded Access) by trial count.
- **Funder Type Distribution** — Clustered column chart comparing trial volume across all `Funder_Type` categories (INDUSTRY, OTHER, FED, NIH, OTHER_GOV, INDIV).

**Slicers (3)**

Three cross-page slicers allow users to filter the entire page by `Study_Status`, `Phases`, and `Sponsor`, enabling rapid drill-down without leaving the executive view.

---

### Page 2 — Clinical Trial Analytics

This page moves from summary to detail, focusing on the clinical and demographic dimensions of the trial dataset — phase distribution, enrollment scale, participant eligibility, and the status composition within each development phase.

**Charts**

- **Trial Count by Phase** — Clustered bar chart showing the number of trials registered at each development phase (PHASE1 through PHASE4, plus combination phases). Reveals where research concentration sits in the T2D pipeline.
- **Total Enrollment by Phase** — Clustered column chart plotting the sum of `Enrollment` per phase. Highlights which phases carry the highest participant burden.
- **Enrollment Category Distribution** — Donut chart breaking down trials by `Enrollment_Category` (Small / Medium / Large / Unknown). Provides a size-classification view of the dataset's research scale.
- **Trial Count by Age Group** — Clustered bar chart showing how many trials are registered for each `Age` group value (ADULT, OLDER\_ADULT, CHILD combinations). Surfaces age-eligibility patterns and inclusivity gaps.
- **Sex Eligibility Distribution** — Donut chart plotting trial count by `Sex` eligibility (ALL / MALE / FEMALE). Quantifies the proportion of sex-inclusive versus sex-restricted trial designs.
- **Phase × Study Status (100% Stacked Bar)** — A 100% stacked bar chart cross-tabulating `Phases` (category axis) and `Study_Status` (series) by trial count. Shows the status composition within each phase — for example, what proportion of Phase 3 trials are completed versus still recruiting.

---

### Page 3 — Sponsor Performance Dashboard

This page focuses on organisational and funding-source analysis, answering questions about which sponsors are most active, how their average enrollment compares, what phases they operate in, and how funding composition breaks down.

**Charts**

- **Trial Count by Sponsor** — Clustered bar chart ranking sponsors by number of registered trials. Identifies the most prolific organisations in the Type 2 Diabetes research space.
- **Average Enrollment by Sponsor** — 100% stacked column chart showing the `Average Enrollment` DAX measure per sponsor. Enables comparison of trial scale across organisations, normalised to account for differences in trial count.
- **Trial Count by Phase** — Bar chart summarising the overall phase distribution within the context of this page. Functions as a reference panel that responds to sponsor-level cross-filters applied from other visuals.
- **Funder Type Composition** — 100% stacked column chart showing trial count broken down by `Funder_Type`. Visualises the funding-source composition of the dataset in a proportional format, complementing the absolute counts shown on Page 1.

---

## 12. Key Business Insights

The following insights are derived directly from the dataset values confirmed during analysis. No figures have been estimated or fabricated.

**Trial Completion Rate**
296 of 500 registered trials (59.2%) have a status of COMPLETED, indicating that the dataset represents a largely mature, retrospective slice of Type 2 Diabetes research activity suitable for evidence synthesis and benchmarking.

**Phase 3 Is the Most Represented Phase**
Phase 3 leads all individual phases with 72 trials, followed by Phase 1 (60 trials) and Phases 2 and 4 (50 trials each). This concentration in confirmatory late-stage research reflects the clinical priority of establishing efficacy evidence for regulatory submission.

**Over Half of Trials Are Small-Scale**
51.8% of trials enrolled fewer than 100 participants, classifying them as Small under the engineered `Enrollment_Category` feature. Only 11.6% of trials enrolled 500 or more participants, underscoring how much of the T2D research landscape is investigator-initiated or early-phase rather than large pivotal programmes.

**Enrollment Figures Are Highly Skewed**
The mean enrollment of 481 participants is far above the median of 90, driven by a small number of large Phase 3 and Phase 4 outcomes trials — the largest single trial enrolled 58,326 participants. This skew makes median a more representative central tendency measure for the typical trial.

**Top Sponsors Reflect Both Global Pharma and Regional Players**
AstraZeneca leads with 22 trials, followed by Chong Kun Dang Pharmaceutical (21), Daewoong Pharmaceutical (10), Merck Sharp & Dohme LLC (9), and GlaxoSmithKline (9). The presence of Korean pharmaceutical firms alongside global majors reflects the international scope of T2D clinical research.

**Funding Is Split Between Industry and Academic/Non-Profit Sources**
Industry funds 45% of trials (225), while the "OTHER" category — predominantly academic institutions and non-profit organisations — accounts for 52% (260). Government funding (FED, NIH, OTHER_GOV) collectively represents less than 3%.

**Study Design Is Predominantly Interventional**
85.6% of trials (428) are classified as INTERVENTIONAL, meaning they directly test a drug, device, or procedure. Observational studies account for 14.2% (71), contributing real-world evidence alongside the controlled interventional data.

**Sex Eligibility Is Broadly Inclusive**
95.2% of trials (476) are open to all sexes. Male-only and female-only designs account for 3.8% and 1.0% respectively — small numbers that nonetheless warrant scrutiny in pharmacovigilance contexts where sex-differentiated drug responses may be relevant.

**Age Group Targeting Is Predominantly Dual-Cohort**
82.4% of trials target exactly two age groups (typically ADULT and OLDER_ADULT), which is appropriate given the demographic profile of Type 2 Diabetes. Only 4.2% of trials include CHILD, reflecting the limited paediatric burden of this condition.

**Collaborator Data Is Sparse**
72.6% of trials list no collaborator, suggesting that most research in this domain is conducted by a single primary sponsor without formal co-funding partnerships — a pattern consistent with industry-initiated drug development programmes.

---

## 13. Repository Structure

```
clinical-trial-analytics/
│
├── notebook/
│   └── Clinical_Trial_Analytics.ipynb      # Data cleaning and feature engineering
│
├── sql/
│   └── clinical_trial_analysis.sql         # Business-question SQL queries (MySQL)
│
├── dashboard/
│   └── clinical_trial_project_dashboard.pbix   # Power BI Desktop file (3 pages)
│
├── data/
│   ├── ctg-studies.csv                     # Raw source data (ClinicalTrials.gov)
│   └── Clinical_trial_cleaned.csv          # Cleaned and enriched dataset (23 columns)
│
└── README.md
```

---

## 14. Installation

### Requirements

- Python 3.10 or higher
- MySQL 8.0 or higher
- Power BI Desktop (Windows — free download from Microsoft)

### Python Environment

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/clinical-trial-analytics.git
cd clinical-trial-analytics

# Install Python dependencies
pip install pandas numpy jupyter
```

---

## 15. How to Run the Project

### Step 1 — Data Cleaning (Python)

```bash
# Launch Jupyter Notebook
jupyter notebook notebook/Clinical_Trial_Analytics.ipynb
```

Execute all cells in sequence. The notebook will:
1. Load `data/ctg-studies.csv`
2. Perform the missing value audit
3. Parse five date columns to `datetime64`
4. Compute `Trial_Duration_Days` and correct negative values
5. Generate `Enrollment_Category` and `Age_Group_Count`
6. Export `Clinical_trial_cleaned.csv`

### Step 2 — SQL Analysis (MySQL)

```sql
-- 1. Create the target database
CREATE DATABASE clinical_trials;
USE clinical_trials;

-- 2. Import the cleaned CSV
--    Use MySQL Workbench Table Data Import Wizard
--    or LOAD DATA INFILE pointing to Clinical_trial_cleaned.csv

-- 3. Run the analysis script
SOURCE sql/clinical_trial_analysis.sql;
```

### Step 3 — Power BI Dashboard

1. Open **Power BI Desktop**
2. Open `dashboard/clinical_trial_project_dashboard.pbix`
3. If prompted to update the data source, direct Power BI to the local path of `data/Clinical_trial_cleaned.csv`
4. Click **Refresh** to reload all data
5. Navigate across the three pages using the page tabs at the bottom of the report

---

## 16. Skills Demonstrated

| Domain | Skills |
|--------|--------|
| **Programming** | Python, Pandas, NumPy, os |
| **Data Engineering** | Missing value auditing, date parsing, type conversion, data validation, CSV export |
| **Feature Engineering** | Duration calculation, categorical binning, string parsing and counting |
| **Databases** | MySQL, SQL querying, aggregation functions, GROUP BY, ORDER BY, subqueries, percentage calculations |
| **Business Intelligence** | Power BI Desktop, DAX measures, KPI card design, multi-page report architecture, cross-page slicers |
| **Data Visualisation** | Clustered bar charts, clustered column charts, donut charts, 100% stacked bar/column charts, KPI cards |
| **Healthcare Domain** | Clinical trial phases, registry data interpretation, pharmacovigilance context, demographic inclusivity analysis |
| **Analytical Thinking** | Business question formulation, insight generation from distribution data, outlier identification |
| **Communication** | Data storytelling, translating technical findings into business-relevant language |
| **DevOps** | Git, GitHub, repository structuring, technical documentation |

---

## 17. Future Enhancements

| Enhancement | Description |
|-------------|-------------|
| **Condition Name Normalisation** | The `Conditions` column contains at least five distinct spellings of "Type 2 Diabetes" (`Diabetes Type 2`, `T2D`, `Type II Diabetes Mellitus`, etc.). String matching or MeSH code mapping would standardise these into a single canonical label. |
| **Geospatial Analysis** | Parsing the `Locations` column to extract country codes would enable a world map visual in Power BI, showing global trial density and identifying under-represented regions. |
| **Sponsor–Collaborator Network Graph** | Building a bipartite graph from the `Sponsor` and `Collaborators` columns would reveal co-sponsorship clusters and cross-organisation research partnerships. |
| **Phase Completion Prediction** | A logistic regression or decision tree model trained on phase, enrollment, funder type, and sponsor could predict the probability of a trial reaching COMPLETED status versus TERMINATED. |
| **ClinicalTrials.gov API Integration** | Replacing the static CSV with scheduled API calls to the ClinicalTrials.gov v2 API would enable automated daily data refreshes and near-real-time dashboard updates. |
| **Full Dataset Expansion** | Scaling beyond 500 trials to the full ClinicalTrials.gov diabetes registry would provide a more statistically robust foundation for sponsor and phase comparisons. |

---

## 18. About the Author

> **[Your Name]**
> Data Analyst · Healthcare Analytics · Business Intelligence

I specialise in healthcare and clinical data analytics, with a focus on transforming messy registry and real-world datasets into structured, decision-ready insights. This project demonstrates an end-to-end command of the analytics pipeline — from raw Python cleaning through SQL analysis to executive Power BI dashboards.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat-square&logo=linkedin&logoColor=white)](https://linkedin.com/in/YOUR_LINKEDIN_HANDLE)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=flat-square&logo=github&logoColor=white)](https://github.com/YOUR_GITHUB_USERNAME)
[![Email](https://img.shields.io/badge/Email-Contact-EA4335?style=flat-square&logo=gmail&logoColor=white)](mailto:your.email@example.com)

---

## 19. License

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
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

<div align="center">

*If this project was useful to you, a ⭐ on GitHub is always appreciated.*

</div>
