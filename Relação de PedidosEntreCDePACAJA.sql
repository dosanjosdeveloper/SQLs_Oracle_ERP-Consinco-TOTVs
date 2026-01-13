select pv.nrorepresentante, pv.nropedvenda,pv.nroempresa, pv.nrosegmento, pv.seqpessoa, decode (pv.situacaoped,'D','DIGITAÇÃO','C','CANCELADO',
'A','ANALISE FINANCEIRA','F','FATURADO','L','LIBERADO','S','EM SEPARAÇÃO','R','ROTEIRIZACAO') as SITUACAO_PEDIDO, to_char(pv.dtainclusao,'DD/MM/YY') as INCLUSO_EM, pv.dtaroteirizacao 
from mad_pedvenda pv 
where pv.nroempresa in (13) 
 and pv.situacaoped not in ('F','C')
and pv.codgeraloper in (520)
and pv.dtabasefaturamento between to_date('01/01/2023','DD/MM/YYYY') and to_date('17/05/2023','DD/MM/YYYY')
order by pv.dtainclusao

-- select a.situacaoped, a.* from mad_pedvenda a

/*
select sum((qtdatendida/qtdembalagem) * vlrembinformado) from mad_pedvendaitem where nropedvenda in (440071)
/*XXXXXXXXXXXXXXXXXXXXXXXXXXX  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
/*
select pi.seqproduto||' - '||(select pr.descreduzida from map_produto pr where pr.seqproduto =  pi.seqproduto) as PRODUTO,
 sum (pi.qtdpedida/pi.qtdembalagem) as QTD_PEDIDA
       from mad_pedvenda pv
       join mad_pedvendaitem pi on pi.nropedvenda = pv.nropedvenda
       where pv.dtabasefaturamento between to_date('03/04/2023','DD/MM/YYYY') and to_date('11/04/2023','DD/MM/YYYY')  -- and pv.situacaoped = 'S'
       and pv.nrorepresentante in (1322,1329,13,900,901,902,903)
	
      group by pi.seqproduto
      
select * from mad_pedvenda where nropedvenda in (440071)
select * from mad_pedvendaitem where nropedvenda = 440071
**/

-- ETAPA 1: REALIZAR UPDATE NA TABELA MAD_PEDVENDA
Update MAD_PEDVENDA a
     
-- Set a.SITUACAOPED = 'C', 
    a.DTACANCELAMENTO = SYSDATE,
    a.USUCANCELAMENTO = 'TI_RAFAEL',     
    a.MOTCANCELAMENTO = 'PEDIDO REPLICADO IN LOJA CD',   
    a.OBSCANCELAMENTO = 'PEDIDO REPLICADO IN LOJA CD'       

Where a.NROEMPRESA = 9
  and a.situacaoped in ('A','L')  --CANCELADOS E FATURADOS
   and a.codgeraloper = 520  --VERIFICAR CGO
  and a.nropedvenda in (440071,440083,440130,440232,
440431,440440,440479,440618,
440702,440722,440724,440740,
440744,440768,440875,440970,
440988,440990,440992,440994,
441008,441043,441045,441047,
441255,441283,441286,441299,
441363,441373,441415,441454,
441462,441468,441470,441542,
441544,441569,441608,441612,
441614,441767,441774,441791,
441804,441806,441931,441968,
442005)

-------------------------------------------------  
************ ## TRAVA DE SEGURANÇA ## ************ 
-------------------------------------------------

-- ETAPA 2: REALIZAR UPDATE NA TABELA MAD_PEDVENDAITEM
-- Update MAD_PEDVENDAITEM b

Set b.QTDATENDIDA = 0, 
    b.QTDATENDIDAFISC = 0,
    b.USUCANCELAMENTO = 'TI_RAFAEL',
    b.DTACANCELAMENTO = SYSDATE,
    b.MOTCANCELAMENTO = 'PEDIDO REPLICADO IN LOJA PACAJA'
     
Where b.NROEMPRESA = 9     
  and b.numerodf is null       
  and b.nropedvenda in (440071,440083,440130,440232,
440431,440440,440479,440618,
440702,440722,440724,440740,
440744,440768,440875,440970,
440988,440990,440992,440994,
441008,441043,441045,441047,
441255,441283,441286,441299,
441363,441373,441415,441454,
441462,441468,441470,441542,
441544,441569,441608,441612,
441614,441767,441774,441791,
441804,441806,441931,441968,
442005)
  
  
  /*
             (Select a.nropedvenda
               From MAD_PEDVENDA a
             	  Where 1=1 
                  and a.nroempresa = 13
                  and a.situacaoped = 'C'  --CANCELADO
                  and a.codgeraloper = 520 --VERIFICAR CGO
                  --and a.usuinclusao = 'INTEGRACAO'
                  and a.dtacancelamento > To_Date('15-apri-2023 10:40:00','DD/MM/YYYY HH24:MI:SS')
                  and a.dtacancelamento < To_Date('15-apri-2023 10:40:00','DD/MM/YYYY HH24:MI:SS')
                 
                  and a.nropedvenda in (

))
