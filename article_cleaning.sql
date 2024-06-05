SELECT 
   TRIM(c_art) AS c_art
  ,c_fam_art
  ,c_sfam_art
  ,TRIM(lib_art) AS lib_art
  ,TRIM(gencod) AS gencod
  ,TRIM(c_marque) AS c_marque
  ,px_achat
  ,date_creation
  ,date_dern_maj
  ,dern_px_achat
  ,px_base
  ,px_vente_ht
  ,px_vente_ttc
  ,c_arret_gamme
  ,c_art_remplacement
  ,date_maj_px
  ,marge_vente
FROM `airy-aria-420409.****.article`
WHERE c_art IS NOT NULL