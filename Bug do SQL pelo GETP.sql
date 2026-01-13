-- SELECT * from tb_doctopagto where nroformapagto = 1 and dtabasecobranca = '2025-11-21' and vlrtotal > 0.0
-- select * from tb_docto where seqturno = 1 and dtamovimento = '2025-11-21'
-- select seqdocto from tb_doctocupom  where status = 'V' and seqdocto in (SELECT seqdocto FROM tb_docto WHERE seqturno = 1 AND dtamovimento = '2025-11-21')

SELECT 
seqdocto,
CASE WHEN 

 FROM tb_doctopagto 
  WHERE nroformapagto = 1 
  AND dtabasecobranca = '2025-11-21'
  AND seqitem > 2 ;




/*
SELECT 
  a.seqdocto,
  IFNULL(SUM(CASE WHEN a.seqitem = 1 THEN a.vlrtotal END), 0) AS PAGTO,
  IFNULL(SUM(CASE WHEN a.seqitem = 2 THEN a.vlrtotal END), 0) AS TROCO,
  (
    IFNULL(SUM(CASE WHEN a.seqitem = 1 THEN a.vlrtotal END), 0) +  IFNULL(SUM(CASE WHEN a.seqitem = 2 THEN a.vlrtotal END), 0)
  ) AS VALOR_PAGO
FROM TB_DOCTOPAGTO a
where a.dtabasecobranca = '2025-11-21'
GROUP BY a.seqdocto;  

*/
SELECT
  seqdocto,
  SUM(IF(seqitem = 1, vlrtotal, 0)) AS PAGTO,
  SUM(IF(seqitem = 2, vlrtotal, 0)) AS TROCO,
  SUM(IF(seqitem = 1, vlrtotal, 0)) + SUM(IF(seqitem = 2, vlrtotal, 0)) AS VALOR_PAGO
FROM TB_DOCTOPAGTO
WHERE dtabasecobranca = '2025-11-21'
AND nroformapagto = 1
AND seqdocto BETWEEN 197678 AND 197699
GROUP BY seqdocto;