SELECT
 sysdate as DATA,
 e.nomereduzido AS empresa,
(Select Count (x.seqproduto) from mrl_produtoempresa x Where x.nroempresa = e.nroempresa and x.statuscompra = 'A') SKUs_ATIVO,
(Select Count (x.seqproduto) from mrl_produtoempresa x Where x.nroempresa = e.nroempresa and x.statuscompra = 'A' and x.estqloja > 0) SKUs_COM_ESTOQUE,
(Select Count (x.seqproduto) from mrl_produtoempresa x Where x.nroempresa = e.nroempresa and x.statuscompra = 'A' and x.estqloja <= 0) SKUs_SEM_ESTOQUE,
Trunc(
((Select Count (x.seqproduto) from mrl_produtoempresa x Where x.nroempresa = e.nroempresa and x.statuscompra = 'A' and x.estqloja <= 0) / (Select Count (x.seqproduto) from mrl_produtoempresa x Where x.nroempresa = e.nroempresa and x.statuscompra = 'A')*100 )
)||'%' as RUPTURA
FROM max_empresa e 
 WHERE e.nrodivisao = 2
Group by e.nomereduzido, e.nroempresa 
Order by e.nomereduzido;

-- select * from max_empresa;
