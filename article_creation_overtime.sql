SELECT 
  CONCAT(EXTRACT(YEAR FROM date_creation),"-",LPAD(CAST(EXTRACT(MONTH FROM date_creation) AS STRING),2,'0')) as Year_Month
  ,COUNT(c_art) nb_article
FROM `airy-aria-420409.****.article_clean`
GROUP BY Year_Month
ORDER BY Year_Month