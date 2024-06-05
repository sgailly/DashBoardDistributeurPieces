WITH agences AS
(SELECT *
    , ROW_NUMBER() OVER() AS rn 
    , TRIM(CONCAT(TRIM(adr1)," ",TRIM(adr2)," ",TRIM(adr3))) AS adresse
FROM `airy-aria-420409.****.agence`)
SELECT 
    c_agence
    ,TRIM(nom_agence) AS nom_agence
    ,adresse
    ,dep
    ,bur_dis
    ,TRIM(ville) AS ville
    ,c_central
    ,REPLACE(TRIM(UPPER(contact_resp))," | "," ") AS contact_resp
    ,TRIM(contact_compta) AS contact_compta
    ,REPLACE(tel_1,".","") AS tel_1
    ,REPLACE(tel_2,".","") AS tel_2
    ,c_jn_caisse
    ,c_ste
    ,calcul_dispo
    ,TRIM(impr_reap_interne) AS impr_reap_interne
    ,c_langue
    ,depot_garantie
    ,c_banque
    ,n_siret
    ,n_tva_intra
    ,affiche_agence
    ,export_stock
    ,nb_jours_validite_devis
    ,nb_mois_validite_avoir
    ,b_plateforme
FROM  agences
WHERE rn > 2