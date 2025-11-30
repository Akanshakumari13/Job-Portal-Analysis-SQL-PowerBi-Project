SELECT typen AS benefit, count(job_id) AS count
FROM benefits
GROUP BY typen
ORDER BY count DESC
LIMIT 10;
