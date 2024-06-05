SELECT 
    n_mvt
    ,TRIM(c_art) AS c_art
    ,date_mvt
    ,qte
    ,prix
    ,c_origine
    ,TRIM(REGEXP_REPLACE(commentaire,SAFE_CONVERT_BYTES_TO_STRING(b'\xc2'),
    CASE
      WHEN commentaire LIKE '% � %' THEN "à"
      WHEN commentaire LIKE '%� %' THEN "um"
      ELSE "é"
    END)) AS commentaire
    ,c_sens
    ,c_agence
    ,pump_avant
 FROM `airy-aria-420409.****.hist_mvt_stock`
 WHERE n_mvt IS NOT NULL AND c_art IS NOT NULL