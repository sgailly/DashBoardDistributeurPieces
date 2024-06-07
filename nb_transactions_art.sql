SELECT nom_fam_article
    ,nom_sfam_article
    ,a.c_art, lib_art
    ,COUNT(a.c_art) AS nb_transactions 
FROM `airy-aria-420409.****.hist_mvt_stock_clean` AS s
JOIN `airy-aria-420409.****.article_clean` AS a
ON a.c_art = s.c_art
JOIN `airy-aria-420409.****.fam_sfam_article` AS f
ON a.c_sfam_art = f.c_sfam_art
WHERE (c_origine = "VM" OR c_origine = 'V ')
--AND date_mvt > '2023-01-01'
GROUP BY nom_fam_article, nom_sfam_article, a.c_art, lib_art
HAVING nb_transactions >= 20
ORDER BY nb_transactions DESC