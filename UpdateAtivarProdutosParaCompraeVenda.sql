-- select a.seqproduto, a.statuscompra from mrl_produtoempresa a 
-- select b.seqproduto, b.statusvenda from mrl_prodempseg b

/* Update para Ativar produtos para Compra */
Update mrl_produtoempresa a
Set a.statuscompra = 'A',
    a.usualteracao = 'TI_RAFAEL',
    a.dtaalteracao = sysdate

Where a.nroempresa = 23
  and a.seqproduto in (
    
  )
  

/* Update para Ativar produtos para Venda */  
  Update mrl_prodempseg b
Set b.statusvenda = 'A',
    b.usualteracao = 'TI_RAFAEL',
    b.dtahoraltstatusvda = sysdate

Where b.nroempresa = 23
  and b.nrosegmento = 1
  and b.qtdembalagem = 1
  and b.seqproduto in (
      
)
