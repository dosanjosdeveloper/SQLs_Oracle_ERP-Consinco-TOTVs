select * from fi_titulo a 
where a.codespecie in ('TICKET','CARDEB','CARTIM','CARTAO') 
and a.nroempresa = 3 
and a.seqpessoa in ('12739','15716','451') --and a.nroparcela = '1' --and a.nrotitulo = '20211211' 
and a.dtaemissao 
between to_date('09/12/2021','DD/MM/YYYY') 
and to_date('09/01/2022','DD/MM/YYYY') and a.abertoquitado = 'A'and a.vlrnominal = '528.62'
-- group by a.nrotitulo

-- select * from fi_tscodmovimento b where b.codmovimento in ('41','155','134','234','410','456') and b.tipo = 'TCK'
select * from fi_tsmovtoopedetprocess c where c.codmovimento in ('41','155','134','234','410','456') and c.tipo = 'TCK' and c.dtamovimento
between to_date('09/12/2021','DD/MM/YYYY') 
and to_date('09/01/2022','DD/MM/YYYY')
and c.nroempresa = '3'
