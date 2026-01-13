select * from fi_titulo a where a.seqpessoa = '1811'  and a.codespecie = 'DUPR' 
-- and a.abertoquitado = 'A' -- Aberto Quitado
and a.situacao = 'N' -- Normal Cancelado
and a.dtaemissao 
between to_date('01/01/2005','DD/MM/YYYY') and to_date('31/03/2022','DD/MM/YYYY')
order by a.dtaemissao desc

-- select * from fi_relpostitabert
-- select * from fiv_relpostitabegeral


