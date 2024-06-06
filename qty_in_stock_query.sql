SELECT c_agence
    ,s.c_art
    ,a.lib_art
    ,f.nom_fam_article
    ,f.nom_sfam_article
    ,qte_en_stock 
    ,pump
FROM `airy-aria-420409.****.stock_clean` AS s
LEFT JOIN `****.article_clean` AS a
ON a.c_art = s.c_art
LEFT JOIN `airy-aria-420409.****.fam_sfam_article` AS f 
ON f.c_sfam_art = a.c_sfam_art
WHERE qte_en_stock > 0