Select
 a.seqproduto, 
 p.desccompleta as PRODUTO,
 a.codacesso as EAN,
 e.EMBALAGEM as EMB,
 a.qtdembalagem as QUANT_EMB

From map_produto p, map_prodcodigo a, map_familia b, MAP_FAMEMBALAGEM e
 where p.seqproduto = a.seqproduto
   and p.seqfamilia = b.seqfamilia
   and p.seqfamilia = e.seqfamilia
   and a.seqfamilia = b.seqfamilia
   and e.seqFamilia = b.seqfamilia
   and e.qtdEmbalagem = a.qtdEmbalagem
   and a.tipcodigo in ('E','D')
 
Order by 4 desc, 2
