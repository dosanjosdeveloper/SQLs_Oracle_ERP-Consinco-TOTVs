
select * from mad_imppedvenda
select * from mad_imppedvendaitem



seLECT * from mad_pedvenda where usuinclusao = 'MF_PEDIDOS'
SELECT * FROM mad_pedvendaitem where nropedvenda = '423149'

SELECT * FROM EDI_PEDVENDA WHERE NROEMPRESA = 1  ORDER BY DTAINCLUSAO DESC 


select t.vlrtotfrete, t.usuinclusao, t.* 
   from edi_pedvenda t 
     where  t.seqpessoa in (19586,3029)

--     and t.seqpessoa = '3029' 
--     and t.usuinclusao = 'ti_rafael'
--     and trunc(t.dtainclusao) = trunc(sysdate)
-- t.usuinclusao = 'MF_PEDIDOS' and
select * --m.nropedvenda, m.usuinclusao,m.dtainclusao, m.dtapedidoafv,m.seqpessoa, m.nrorepresentante, m.codsistemaafv, m.nropedcliente, m.vlrfreteped
  from mad_pedvenda m 
    where -- m.nroempresa in (1,2,3,5,6,7,8,9,10,15) 
--    m.situacaoped not in ('F','C') and
    trunc(m.dtainclusao) between to_date('01/01/2022','DD/MM/YYYY') 
     and to_date('14/05/2024','DD/MM/YYYY') 
     and m.usuinclusao = 'MF_PEDIDOS' 
-- and m.nroempresa = 3
       order by m.dtainclusao desc 
       
-- select m.vlrfreteped , m.* from mad_pedvenda m where m.nroempresa = 3 and m.usuinclusao in ('INTEGRACAO')
-- select * from Max_parametro where valor = '720'


 -- ATUALIZA LISTA DE ITENS PARA PLATAFORMA WEB --

SELECT 
CAST(ESTOQUE AS FLOAT) AS ESTOQUE,
CAST(ESTOQUE_MINIMO AS FLOAT) AS ESTOQUE_MINIMO,
CAST(PRECO AS FLOAT) AS PRECO,


ID,
GTIN,
NOME,
DEPARTAMENTO_PAI,
DEPARTAMENTO,
MARCA,
CAST(ESTOQUE AS FLOAT) AS ESTOQUE,
CAST(ESTOQUE_MINIMO AS FLOAT) AS ESTOQUE_MINIMO,
CAST(PRECO AS FLOAT) AS PRECO,
CAST(PRECO_COM_DESCONTO AS FLOAT) AS PRECO_COM_DESCONTO,
ATIVO from consinco.tisuper_mercashop where ID_LOJA IN ('1') and gtin in ('7898909348049','7898018160099','7898910779023')



   select * from consinco.tisuper_mercashop where ID_LOJA = '1'

-- select * from tb_docto

