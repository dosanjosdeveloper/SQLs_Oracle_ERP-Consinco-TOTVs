-- select * from map_produto where seqproduto = 1646532
-- select * from map_familia where seqfamilia= 8342



select a.seqproduto, a.seqfamilia,b.seqfamilia, a.complemento, a.desccompleta, b.familia from map_produto a -- where a.seqfamilia= 371
join map_familia b on a.seqfamilia = b.seqfamilia order by a.seqfamilia
