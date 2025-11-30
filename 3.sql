SELECT i.industry_name, COUNT(ji.job_id) AS job_count
FROM job_industries ji
JOIN industries i ON ji.industry_id = i.industry_id
GROUP BY i.industry_name
ORDER BY job_count DESC
LIMIT 10;