SELECT sf.c_fam_art
    ,TRIM(REGEXP_REPLACE(nom_fam_article,SAFE_CONVERT_BYTES_TO_STRING(b'\xc2'),'é')) AS nom_fam_article
    ,c_sfam_art
    ,TRIM(REGEXP_REPLACE(nom_sfam_article,SAFE_CONVERT_BYTES_TO_STRING(b'\xc2'),
    CASE
      WHEN nom_sfam_article LIKE '% � %' THEN "à"
      WHEN nom_sfam_article LIKE '%�tement%' THEN "ê"
      WHEN nom_sfam_article LIKE '%ynth�se%' THEN "è"
      WHEN nom_sfam_article LIKE '%�ve%' THEN "è"
      WHEN nom_sfam_article LIKE '%i�ce%' THEN "è"
      WHEN nom_sfam_article LIKE '%ompl�te%' THEN "è"
      WHEN nom_sfam_article LIKE '%�te%' THEN "ê"
      WHEN nom_sfam_article LIKE '%�le%' THEN "ô"
      WHEN nom_sfam_article LIKE '%�ble%' THEN "â"
      ELSE "é"
      END)) AS nom_sfam_article
FROM `airy-aria-420409.****.sfam_article` AS sf
JOIN `airy-aria-420409.****.fam_article` AS f
ON sf.c_fam_art = f.c_fam_art
ORDER BY c_fam_art