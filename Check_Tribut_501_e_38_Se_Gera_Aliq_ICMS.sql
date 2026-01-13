SELECT 
    f.seqfamilia,
    p.familia,
    f.indcalcdifaliq AS uti_calc_dif_aliq,
    f.nrotributacao,
    f.nrodivisao
FROM map_famdivisao f
JOIN map_familia p ON p.seqfamilia = f.seqfamilia
WHERE f.nrotributacao IN (501, 38) 
 AND f.nrodivisao in (1,2)
 AND (f.indcalcdifaliq NOT IN ('S') OR f.indcalcdifaliq IS NULL OR f.indcalcdifaliq = '');
