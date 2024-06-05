SELECT date_mvt, COUNT(*) AS nb_sales, SUM(prix) AS total_revenues FROM `airy-aria-420409.ManParts.hist_mvt_stock_clean`
WHERE (c_origine = "VM" OR c_origine = "V ") AND prix < 28000     #remove outliers
GROUP BY date_mvt
ORDER BY date_mvt