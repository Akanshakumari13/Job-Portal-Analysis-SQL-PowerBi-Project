SELECT c.company_size,
       AVG(s.med_salary) AS avg_salary,
       AVG(ec.follower_count) AS avg_followers
FROM companies c
JOIN employee_counts ec ON c.company_id = ec.company_id
JOIN salaries s ON s.job_id IN (
    SELECT ji.job_id
    FROM job_industries ji
    WHERE ji.industry_id IS NOT NULL
)  -- adjust if jobs → company_id mapping exists
GROUP BY c.company_size
ORDER BY avg_salary DESC;