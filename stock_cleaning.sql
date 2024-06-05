SELECT 
    c_agence
    ,TRIM(c_art) AS c_art
    ,qte_mini
    ,qte_maxi
    ,c_reappro
    ,pump
    ,REGEXP_REPLACE(qte_en_stock,'NULL',NULL) AS qte_en_stock
FROM `airy-aria-420409.****.stock`