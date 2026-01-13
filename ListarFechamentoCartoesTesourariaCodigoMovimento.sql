/*
select b.codoperador,
       (select a.descricao from fi_tscodmovimento a where a.codmovimento = b.codmovimento) as COD_MOVIMENTO,
 b.nroempresa, b.nropdv, b.valor,b.dtamovimento,b.dtavencimento  
from fiv_tsnacertooperador b 
where b.codmovimento in (40,141,111,418,428,464,470)
and b.dtamovimento between to_date('01/04/2022','DD/MM/YYYY') and to_date('30/04/2022','DD/MM/YYYY')
order by b.dtamovimento
*/
select  sum(b.valor) as TOT_PERIODO
from fiv_tsnacertooperador b 
where b.codmovimento in (40,141,111,418,428,464,470)
and b.dtamovimento between to_date('01/04/2022','DD/MM/YYYY') and to_date('30/04/2022','DD/MM/YYYY')
order by b.dtamovimento
