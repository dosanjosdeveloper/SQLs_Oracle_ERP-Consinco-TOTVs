 select * from tb_prodempresa where nroempresa = 14 and estqloja > 0
 select * from tb_prodpreco where nroempresa = 14 and nrosegmento = 6 and preco = 0 and ativo = 'S' and 

select p.nroempresa, p.seqproduto, p.preco , p.qtdembalagem, pr.estqloja from tb_prodpreco p 
join tb_prodempresa pr on p.seqproduto = pr.seqproduto
where p.nroempresa = 14 and p.nrosegmento = 6 and p.ativo='S' and p.preco = 0 and pr.estqloja > 0

