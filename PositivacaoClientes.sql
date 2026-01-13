 select * from mad_pedvenda a where a.seqpessoa = 16917 and a.nroempresa = 13 and a.dtabasefaturamento between to_date('20/01/2023','DD/MM/YYYY') and to_date('20/01/2023','DD/MM/YYYY')
-- mrl_clientes
-- ge_pessoa select * from mad_pedvendaitem a where a.nroempresa = 13

select  sum(t.vlrembinformado * t.qtdatendida/ t.qtdembalagem) from mad_pedvendaitem t where t.nroempresa = 13
and t.nropedvenda in (418722,418694)
group by t.nropedvenda



-- select * from mad

Select
 r.apelido as VENDEDOR,
 TO_CHAR (a.dtainclusao,'DD/MM/YYYY HH24:MI:SS') as DATA_HORA_PEDIDO,
 a.seqpessoa||' - '||p.nomerazao||' ('||p.fantasia||')' as CLIENTE,
(select sum(t.vlrembinformado * t.qtdatendida/ t.qtdembalagem) from mad_pedvendaitem t where t.nroempresa = 13
and t.nropedvenda = a.nropedvenda) as VLR_TOTAL_PED
  
From mad_pedvenda a, ge_pessoa p, mad_representante r
Where a.seqpessoa = p.seqpessoa
  and a.nrorepresentante = r.nrorepresentante
  and a.nroempresa = 13
  and a.codgeraloper = 520
  and a.usuinclusao = 'ION'
  and a.dtabasefaturamento between to_date('20/01/2023','DD/MM/YYYY') and to_date('20/01/2023','DD/MM/YYYY')

Order by r.nrorepresentante, a.dtainclusao
