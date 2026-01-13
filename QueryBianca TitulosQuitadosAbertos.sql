-- select * from fi_titulo

select a.codespecie, a.tipoespecie, a.seqpessoa, a.vlroriginal, a.vlrnominal, a.vlrpago from fi_titulo a where a.codespecie 
IN ('CHEQIM','CHEQUE','CHPRAZ','CHQDEV','CHQDIM','CHQIM')
and a.dtaemissao between to_date('01/01/2021','DD/MM/YYYY') and to_date('31/12/2021','DD/MM/YYYY')

select sum(a.vlroriginal) from fi_titulo a where a.codespecie 
IN ('CHEQIM','CHEQUE','CHPRAZ','CHQDEV','CHQDIM','CHQIM')
and a.obrigdireito = 'D'
and a.dtaemissao between to_date('01/01/2021','DD/MM/YYYY') and to_date('31/12/2021','DD/MM/YYYY')
