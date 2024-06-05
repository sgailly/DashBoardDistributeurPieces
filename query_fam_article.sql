WITH joined AS
(SELECT mvt.n_mvt
    ,mvt.c_art
    ,mvt.date_mvt
    ,mvt.qte
    ,mvt.prix
    ,mvt.c_origine
    ,mvt.commentaire
    ,mvt.c_sens
    ,mvt.c_agence
    ,art.c_fam_art
    ,art.c_sfam_art
    ,art.lib_art
    ,art.px_base
    ,art.px_vente_ht
    ,art.px_vente_ttc
    ,art.marge_vente
FROM `airy-aria-420409.****.hist_mvt_stock_clean` AS mvt
LEFT JOIN `airy-aria-420409.****.article_clean` AS art
ON mvt.c_art = art.c_art)
SELECT c_fam_art
    ,COUNT(*) AS nb_vente
    ,SUM(prix) AS total_revenue_1
    ,SUM(px_vente_ht) AS total_revenue_2_HT
    ,SUM(px_vente_ttc) AS total_revenue_2_TTC
FROM joined
WHERE c_origine = 'VM' OR c_origine = "V "
GROUP BY c_fam_art
ORDER BY c_fam_art