SELECT s.skill_name, COUNT(js.job_id) AS demand_count
FROM job_skills js
JOIN skills s ON js.skill_abr = s.skill_abr
GROUP BY s.skill_name
ORDER BY demand_count DESC
LIMIT 10;