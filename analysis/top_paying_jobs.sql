/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/


SELECT
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    job_schedule_type AS job_type,
    job_posted_date as job_date,
    name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title = 'Data Scientist' 
    AND
    (job_location = 'Anywhere' OR job_location = 'Brazil' )
    AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_hour_avg DESC
LIMIT 50
