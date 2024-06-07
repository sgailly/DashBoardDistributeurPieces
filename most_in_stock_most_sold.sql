SELECT c_agence
    ,c_art
    ,qte_en_stock AS qty_in_stock
    ,pump*qte_en_stock AS stock_value 
FROM `airy-aria-420409.****.qty_in_stock`
WHERE c_art != 'VANPK5376' AND c_art != 'VANCH 421072'
AND qte_en_stock >10
ORDER BY qty_in_stock DESC;

SELECT c_agence
    ,a.c_art
    ,COUNT(a.c_art) AS nb_transactions 
    ,SUM(prix) AS total_revenues
FROM `airy-aria-420409.****.hist_mvt_stock_clean` AS s
JOIN `airy-aria-420409.****.article_clean` AS a
ON a.c_art = s.c_art
JOIN `airy-aria-420409.****.fam_sfam_article` AS f
ON a.c_sfam_art = f.c_sfam_art
WHERE (c_origine = "VM" OR c_origine = 'V ')
AND date_mvt > '2023-01-01'
AND a.c_art != 'DIV240'
GROUP BY c_agence, a.c_art
HAVING nb_transactions >= 20;

SELECT CASE
      WHEN stock.c_agence IS NULL THEN sold.c_agence
      ELSE stock.c_agence
    END AS c_agence
    ,CASE
      WHEN stock.c_art IS NULL THEN sold.c_art
      ELSE stock.c_art
    END AS c_art
    ,IFNULL(nb_transactions,0) AS nb_transactions
    ,IFNULL(total_revenues,0) AS total_revenues
  ,IFNULL(qty_in_stock,0) AS qty_in_stock
    ,IFNULL(stock_value,0) AS stock_value
    ,IFNULL(qty_in_stock,0) - IFNULL(nb_transactions,0) AS ecart
FROM `airy-aria-420409.****.most_in_stock` AS stock
FULL OUTER JOIN `airy-aria-420409.****.most_sold` AS sold
ON stock.c_agence = sold.c_agence AND stock.c_art = sold.c_art
ORDER BY ecart DESC