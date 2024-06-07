SELECT nom_fam_article
    ,COUNT(DISTINCT nom_sfam_article) AS nb_sfam
    ,COUNT(c_art) as nb_art
    ,SUM(qte_en_stock) AS qty_in_stock
    ,SUM(pump*qte_en_stock) AS stock_value 
FROM `airy-aria-420409.****.qty_in_stock`
WHERE nom_fam_article IS NOT NULL
AND c_art != 'VANPK5376' #outlier value on qty in stock (40 millions)
GROUP BY nom_fam_article
ORDER BY nb_art DESC