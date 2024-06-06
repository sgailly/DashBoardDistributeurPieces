SELECT 
    c_agence
    ,TRIM(c_art) AS c_art
    ,qte_mini
    ,qte_maxi
    ,c_reappro
    ,pump
    ,CAST(
      CASE
        WHEN qte_en_stock = 'NULL' then NULL
        ELSE qte_en_stock
      END 
    AS FLOAT64) AS qte_en_stock
FROM `airy-aria-420409.****.stock`