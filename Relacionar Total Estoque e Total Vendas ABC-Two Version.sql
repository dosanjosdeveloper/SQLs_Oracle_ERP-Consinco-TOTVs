-- select * from map_produto -- seqproduto, seqfamilia, desccompleta

select * from tb_docto a where a.nroempresa = 1 and a.nrocheckout = 8 and a.dtamovimento = '20may2025'

-- update tb_docto a set a.seqturno = 1 where a.nroempresa = 8 AND a.nrocheckout = 08 AND a.dtamovimento = '20may2025' AND a.seqturno = 3;

-- update tb_docto a set a.seqturno = 1 where a.nroempresa = 1 AND a.nrocheckout = 08 AND a.dtamovimento = '20may2025' AND a.seqturno = 3;

SELECT a.seqturno, a.*
FROM consinco.mfl_financeiro a
WHERE a.nroempresa = 1
AND a.nrocheckout = 08
AND a.dtaabertura = '20may2025'
ORDER BY a.seqdoctopdv;



update consinco.mfl_financeiro a
set a.seqturno = 1
where a.nroempresa=1
and a.nrocheckout = 08
and a.seqturno = 3
and a.dtaabertura = '20may2025'
