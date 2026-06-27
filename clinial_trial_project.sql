CREATE DATABASE Clinical_trial_project;

show variables like 'local_infile';
select version();
set global local_infile = 1;

use Clinical_trial_project;

truncate table clinical_trials;

LOAD DATA LOCAL INFILE 'C:/Users/hp/Downloads/clinical_trial_data/Clinical_trial_cleaned.csv'
INTO TABLE clinical_trials
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';

use Clinical_trial_project;

LOAD DATA LOCAL INFILE 'C:/Users/hp/Downloads/clinical_trial_data/Clinical_trial_cleaned.csv'
INTO TABLE clinical_trials
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT NCT_Number, Enrollment
FROM Clinical_trials
WHERE Enrollment IS NULL OR Enrollment = 0;

SELECT COUNT(*) AS Total_studies
FROM Clinical_trials;

SELECT
	Study_Status,
    COUNT(*) AS Total_Records
FROM clinical_trials
GROUP BY Study_Status
ORDER BY Total_Records DESC;

SELECT
    Study_Type,
    COUNT(*) AS Total_Studies
FROM clinical_trials
GROUP BY Study_Type
ORDER BY Total_Studies DESC;

SELECT 
    COALESCE(Phases, 'Not Specified') AS Trial_Phase,
    COUNT(*) AS Total_Trials
FROM clinical_trials
GROUP BY Trial_Phase
ORDER BY Total_Trials DESC;

SELECT
    Sponsor,
    COUNT(*) AS Total_Trials
FROM clinical_trials
GROUP BY Sponsor
ORDER BY Total_Trials DESC
LIMIT 10;

SELECT
    COALESCE(Phases, 'Not Specified') AS Trial_Phase,
    COUNT(*) AS total_Trials,
    ROUND(AVG(Enrollment),0) AS Avg_Enrollment
FROM clinical_trials
GROUP BY Trial_Phase
ORDER BY Avg_Enrollment DESC;

SELECT
	Phases,
    COUNT(*) AS Total_Trials,
    ROUND(AVG(Enrollment),0) AS Avg_Enrollment
FROM clinical_trials
WHERE Study_Type = 'INTERVENTIONAL'
GROUP BY Phases
ORDER BY Avg_Enrollment DESC;

SELECT
    COALESCE(Phases,'Not Specified') AS Trial_Phase,
    COUNT(*) AS Total_Trials,
    ROUND(AVG(Trial_Duration_Days),0) AS Avg_Duration_Days,
    MAX(Trial_Duration_Days) AS Longest_Trial,
    MIN(Trial_Duration_Days) AS Shortest_Trial
FROM clinical_trials
WHERE Trial_Duration_Days IS NOT NULL
GROUP BY COALESCE(Phases,'Not Specified')
ORDER BY Avg_Duration_Days DESC;

SELECT
    NCT_Number,
    Start_Date,
    Completion_Date,
    Trial_Duration_Days
FROM clinical_trials
WHERE Trial_Duration_Days IS NOT NULL
LIMIT 20;

SELECT
    COUNT(*) AS Total_Studies,
    COUNT(Trial_Duration_Days) AS Studies_with_Duration,
    COUNT(*) - COUNT(Trial_Duration_Days) AS Missing_Duration
FROM clinical_trials;

select
    count(*) as zero_duration_records
from clinical_trials
where Trial_Duration_Days = 0;

SELECT
    Sponsor,
    COUNT(*) AS Total_Trials,
    ROUND(AVG(Enrollment),0) AS Avg_Enrollment,
    MAX(Enrollment) AS Max_Enrollment
FROM clinical_trials
WHERE Study_Type = 'INTERVENTIONAL'
GROUP BY Sponsor
HAVING COUNT(*) >= 2
ORDER BY Total_Trials DESC, Avg_Enrollment DESC
LIMIT 10;

SELECT
    COUNT(*) AS Total_Studies,
    SUM(CASE WHEN Collaborators IS NULL THEN 1 ELSE 0 END) AS Missing_Collaborators,
    SUM(CASE WHEN Phases IS NULL THEN 1 ELSE 0 END) AS Missing_Phases,
    SUM(CASE WHEN Locations IS NULL THEN 1 ELSE 0 END) AS Missing_Locations,
    SUM(CASE WHEN Interventions IS NULL THEN 1 ELSE 0 END) AS Missing_Interventions,
    SUM(CASE WHEN Enrollment IS NULL THEN 1 ELSE 0 END) AS Missing_Enrollment,
    SUM(CASE WHEN Trial_Duration_Days = 0 THEN 1 ELSE 0 END) Missing_Duration
FROM clinical_trials;

















