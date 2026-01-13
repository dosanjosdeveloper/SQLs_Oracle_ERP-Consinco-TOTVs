Update mrl_produtoempresa a
Set a.statuscompra = 'A',
    a.usualteracao = 'TI_RAFAEL',
    a.dtaalteracao = sysdate

Where 1=1
  and a.nroempresa in (1)
  and a.statuscompra in ('I','S')
  and a.seqproduto in (

32845 

);

-- select * from ge_empresa

-- select * from tisuper_com_vestcasa
