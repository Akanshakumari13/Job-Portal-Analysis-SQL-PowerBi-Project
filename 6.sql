SELECT sk.skill_name,
       AVG(s.med_salary) AS avg_salary,
       COUNT(DISTINCT s.job_id) AS job_count
FROM salaries s
JOIN job_skills js ON s.job_id = js.job_id
JOIN skills sk ON js.skill_abr = sk.skill_abr
GROUP BY sk.skill_name
ORDER BY avg_salary DESC
LIMIT 10;