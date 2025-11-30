SELECT i.industry_name,
       MIN(s.min_salary) AS min_salary,
       AVG(s.med_salary) AS avg_salary,
       MAX(s.max_salary) AS max_salary
FROM salaries s
JOIN job_industries ji ON s.job_id = ji.job_id
JOIN industries i ON ji.industry_id = i.industry_id
GROUP BY i.industry_name
ORDER BY avg_salary DESC;