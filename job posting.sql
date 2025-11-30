SELECT c.city, c.state, 
       COUNT(s.job_id) AS job_count,
       AVG(CAST(s.med_salary AS DECIMAL(15,2))) AS avg_salary
FROM companies c
JOIN salaries s ON s.job_id IN (
    SELECT ji.job_id
    FROM job_industries ji
)
GROUP BY c.city, c.state
ORDER BY job_count DESC
LIMIT 10;
