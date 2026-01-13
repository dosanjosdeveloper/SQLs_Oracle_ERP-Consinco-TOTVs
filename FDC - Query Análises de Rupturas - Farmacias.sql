/* MRL_PRODUTOEMPRESA */
select 
   a.nroempresa,
   a.seqproduto,
--   a.statuscompra,
   a.estqloja,
    a.dtaultentrada AS ULT_ENTRADA,
   a.qtdultentrada AS QTD_ULT_ENTRADA, 
   a.dtaultmovsaida as ULT_SAIDA,
   a.dtapenultmovsaida AS PENULT_SAIDA,
--   a.dtaultcompra,
--   a.qtdpendpedcompra,
--   a.dtaultmovtacao,
--   a.dtaultmoventrada,
   TRUNC(sysdate - a.dtaultmovsaida) as DIA_S_SEM_VENDA
--   a.seqnfultentrcusto,
--   a.*
 from mrl_produtoempresa a
    where a.nroempresa in (11)
     and a.statuscompra = 'I'
     and a.estqloja > 0
--     and a.seqproduto = 1450506  

select * from map_produto where seqproduto = 1450506
    
select 
    b.numeronf, 
    b.seqpessoa, 
    b.serienf,
    b.tipnotafiscal, 
    b.nroempresa, 
    b.seqproduto, 
    b.quantidade, 
    b.dtamovtoitem,
    b.cgoremessa,
    b.dtapedido 
      from MLF_NFITEM b 
       where b.nroempresa = 11
       and b.seqproduto = 1450506
       and b.dtamovtoitem between to_date('01/01/2025','DD/MM/YYYY') and to_date('21/11/2025','DD/MM/YYYY')
       
selec

