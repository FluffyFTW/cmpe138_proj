SELECT term, COUNT(*) as num_count
FROM `cmpe138proj.google_terms.total_terms` 
WHERE month = 4 and year = 2020
GROUP BY term
ORDER BY num_count DESC
LIMIT 10