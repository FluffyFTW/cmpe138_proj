CREATE TABLE `cmpe138proj.google_terms.total_terms`(
  term string, 
  month integer,
  year integer,
);
INSERT INTO `cmpe138proj.google_terms.total_terms`
  SELECT term, Extract(MONTH FROM week) as month, Extract(YEAR FROM week) as year
  FROM `cmpe138proj.google_terms.international_terms` 
;
INSERT INTO `cmpe138proj.google_terms.total_terms`
  SELECT term, Extract(MONTH FROM week) as month, Extract(YEAR FROM week) as year
  FROM `cmpe138proj.google_terms.us_terms` 
;
