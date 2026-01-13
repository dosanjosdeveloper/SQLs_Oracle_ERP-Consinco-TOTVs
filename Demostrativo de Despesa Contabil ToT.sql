select (select sum(a.valor)from or_nfdespesa a 
join ge_pessoa e on a.seqpessoa = e.seqpessoa 
join ge_empresa d on a.nroempresa = d.nroempresa 
join rf_paramnatnfdesp c on a.codhistorico = c.codhistorico  where 
a.dtaentrada between to_date('01/01/2020','dd/mm/yyyy') and to_date('29/02/2020','dd/mm/yyyy')  
and c.descricao like '%Telefone%fixo%' and d.nomereduzido like '%MATRIZ%'),a.seqpessoa, e.nomerazao as NOME_PESSOA, a.observacao, c.descricao , a.valor as vlr_total_nf, d.fantasia from or_nfdespesa a 
join ge_pessoa e on a.seqpessoa = e.seqpessoa 
join ge_empresa d on a.nroempresa = d.nroempresa 
join rf_paramnatnfdesp c on a.codhistorico = c.codhistorico  where 
a.dtaentrada between to_date('01/01/2020','dd/mm/yyyy') and to_date('29/02/2020','dd/mm/yyyy')  
and c.descricao like '%Telefone%fixo%' and d.nomereduzido like '%MATRIZ%' Order by  c.descricao, a.dtaentrada

-- select codhistorico,descricao from rf_paramnatnfdesp
-- select sum(a.valor) from or_nfdespesa a where 
-- a.dtaentrada between to_date('01/01/2020','dd/mm/yyyy') and to_date('29/02/2020','dd/mm/yyyy') and a.codhistorico in ('2') and a.nroempresa = '1'
