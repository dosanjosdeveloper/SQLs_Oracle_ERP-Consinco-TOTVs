-- select * from map_produto a
select * from map_prodcodigo
select count(seqproduto) from mrl_produtoempresa where nroempresa = 11
select b.seqproduto, a.codacesso from mrl_produtoempresa b, map_prodcodigo a  where b.nroempresa = 11 
