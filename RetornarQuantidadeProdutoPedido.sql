select pi.seqproduto||' - '||(select pr.descreduzida from map_produto pr where pr.seqproduto =  pi.seqproduto) as PRODUTO,
 sum (pi.qtdpedida/pi.qtdembalagem) as QTD_PEDIDA
       from mad_pedvenda pv
       join mad_pedvendaitem pi on pi.nropedvenda = pv.nropedvenda
       where pv.dtabasefaturamento between to_date('03/04/2023','DD/MM/YYYY') and to_date('11/04/2023','DD/MM/YYYY')   and pv.situacaoped = 'S'
       and pv.nrorepresentante in (1331,1329,1322)
	
      group by pi.seqproduto
-- order by pv.dtainclusao


/*
select pi.nropedvenda,
 pi.seqproduto||' - '||(select pr.descreduzida from map_produto pr where pr.seqproduto =  pi.seqproduto) as PRODUTO,
 pi.qtdpedida/pi.qtdembalagem as QTD_PEDIDA, pi.qtdatendida/pi.qtdembalagem QTD_SEPARADA, pi.qtdembalagem, pi.vlrembtabpreco, pi.vlrembinformado, to_char(pv.dtainclusao,'DD/MM/YYYY') as DTA_INCLUSAO, 
   decode(pv.situacaoped,'D','DIGITAÇÃO','C','CANCELADO',
   'A','ANALISE FINANCEIRA','F','FATURADO','L','LIBERADO','S','EM SEPARAÇÃO') as SITUACAO_PEDIDO, pv.nroempresa,
    pv.nrorepresentante||' - '||(Select rp.apelido from mad_representante rp where rp.nrorepresentante = pv.nrorepresentante) as REPRESENTANTE, 
    pv.seqpessoa||' - '||(select gp.nomerazao from ge_pessoa gp where gp.seqpessoa = pv.seqpessoa) as CLIENTE, pv.usuinclusao, pv.codgeraloper,
pv.nroformapagto||' - '||(select fp.formapagto from mrl_formapagto fp where fp.nroformapagto = pv.nroformapagto) as FORMA_PAGTO
,  pi.nrocondicaopagto||' - '||(select cp.desccondicaopagto from mad_condicaopagto cp where cp.nrocondicaopagto = pi.nrocondicaopagto) as COND_PAGTO
       from mad_pedvenda pv
       join mad_pedvendaitem pi on pi.nropedvenda = pv.nropedvenda
       where pv.dtabasefaturamento between to_date('03/04/2023','DD/MM/YYYY') and to_date('13/04/2023','DD/MM/YYYY')   and pv.situacaoped = 'L'
       and pv.nrorepresentante in (1331,1329,1322)
-- group by pi.qtdpedida
 order by pv.dtainclusao
 */
