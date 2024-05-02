WITH us_march_terms AS 
(
  SELECT term, COUNT(*) as num_count
  FROM `bigquery-public-data.google_trends.top_terms` 
  WHERE Extract(MONTH FROM week) = 4 and Extract(YEAR FROM week) = 2020
  GROUP BY term
),
internation_march_terms AS 
(
  SELECT term, COUNT(*) as num_count
  FROM `bigquery-public-data.google_trends.international_top_terms` 
  WHERE Extract(MONTH FROM week) = 4 and Extract(YEAR FROM week) = 2020
  GROUP BY term
)
SELECT IFNULL(us_march_terms.term, internation_march_terms.term), IFNULL(internation_march_terms.num_count, 0) + IFNULL(us_march_terms.num_count, 0) as total_search
FROM us_march_terms
FULL OUTER JOIN internation_march_terms
ON us_march_terms.term = internation_march_terms.term
ORDER BY total_search DESC
LIMIT 10