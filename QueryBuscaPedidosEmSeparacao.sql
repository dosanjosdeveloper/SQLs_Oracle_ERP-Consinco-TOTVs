select pi.nropedvenda,
 pi.seqproduto||' - '||(select pr.descreduzida from map_produto pr where pr.seqproduto =  pi.seqproduto) as PRODUTO,
 pi.qtdpedida/pi.qtdembalagem as QTD_PEDIDA, pi.qtdatendida/pi.qtdembalagem QTD_SEPARADA, pi.qtdembalagem, pi.vlrembtabpreco, pi.vlrembinformado, pv.dtainclusao, 
   decode(pv.situacaoped,'D','DIGITAÇÃO','C','CANCELADO',
   'A','ANALISE FINANCEIRA','F','FATURADO','L','LIBERADO','S','EM SEPARAÇÃO') as SITUACAO_PEDIDO, pv.nroempresa,
    pv.nrorepresentante||' - '||(Select rp.apelido from mad_representante rp where rp.nrorepresentante = pv.nrorepresentante), 
    pv.seqpessoa||' - '||(select gp.nomerazao from ge_pessoa gp where gp.seqpessoa = pv.seqpessoa), pv.usuinclusao, pv.codgeraloper, pv.nroformapagto||' - '||(select fp.formapagto from mrl_formapagto fp where fp.nroformapagto = pv.nroformapagto), 
    pi.nrocondicaopagto||' - '||(select cp.desccondicaopagto from mad_condicaopagto cp where cp.nrocondicaopagto = pi.nrocondicaopagto)
       from mad_pedvenda pv
       join mad_pedvendaitem pi on pi.nropedvenda = pv.nropedvenda
       where pv.dtabasefaturamento between to_date('13/03/2023','DD/MM/YYYY')and to_date('16/03/2023','DD/MM/YYYY')
--        and pv.situacaoped = 'S'
         and pv.nrorepresentante in (1331,1329,1322)
order by pv.dtainclusao

-- select * from mad_pedvendaitem tt where tt.nropedvenda = 429834

-- select * from mad_representante
-- select * from map_produto
-- select a.situacaoped, a.dtainclusao, a.* from mad_pedvenda a where  a.dtabasefaturamento between to_date('09/03/2023','DD/MM/YYYY')and to_date('10/03/2023','DD/MM/YYYY') and a.nrorepresentante in (1331,1329,1322) and a.situacaoped = 'F' -- and a.nrorepresentante in (1331,1329,1322)
-- select b.nropedvenda,b.nroempresa,b.seqproduto, b.qtdpedida, b.qtdatendida, b.qtdembalagem, b.vlrembtabpreco,b.vlrembinformado,b.vlrembprecomin
-- from mad_pedvendaitem b where b.nropedvenda = 429753 --430136
-- select * from mrl_cliente 1331,1329,1322

-- select * from MAD_PEDVENDAITEM where nropedvenda = 430563
-- select * from MAD_BONIFPROD
-- select * from MAD_CONDICAOPAGTO WHERE NROCONDICAOPAGTO = 50

select * from mrl_formapagto
 
/*
select pi.nropedvenda,pi.seqproduto,pi.qtdpedida, pi.qtdatendida, pi.qtdembalagem, pi.vlrembtabpreco, pi.vlrembinformado, pv.dtainclusao, pv.situacaoped, pv.nroempresa, pv.nrorepresentante, pv.seqpessoa, pv.usuinclusao, pv.codgeraloper, pv.nroformapagto
from mad_pedvenda pv
join mad_pedvendaitem pi on pi.nropedvenda = pv.nropedvenda
where pv.dtabasefaturamento between to_date('09/03/2023','DD/MM/YYYY')and to_date('10/03/2023','DD/MM/YYYY')
 and pv.situacaoped = 'F'
 and pv.nrorepresentante in (1331,1329,1322)
 order by pv.dtainclusao
*/
