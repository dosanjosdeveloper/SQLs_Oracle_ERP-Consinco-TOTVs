-- SELECT * FROM tb_prodpreco where seqproduto IN ('4637','4648')
-- SELECT * FROM tb_prodcodigo where seqproduto  IN ('6978','6980','7012','163479','1687220') and qtdembalagem = '1'
-- SELECT * FROM tb_prodcodigo where codacesso IN ('27916','40068','40070')
-- SELECT * FROM tb_produto where seqproduto IN ('21978','1865234','1316001','4648','21913','21992')
-- select * from tb_famembalagem  where seqfamilia = '3895'
-- SELECT valor FROM tb_parametro WHERE parametro = 'NroSegmento' AND grupo = 'Geral'
-- ************************************************************************************************************* --
-- SELECT b.codacesso,a.seqproduto, c.desccompleta,a.preco,a.qtdembalagem, a.nrosegmento FROM tb_prodpreco AS a 
-- JOIN tb_prodcodigo AS b ON a.seqproduto = b.seqproduto -- ATÉ AQUI OK WHERE b.codacesso = '40068'
-- JOIN tb_produto AS c ON b.seqproduto = c.seqproduto AND b.qtdembalagem = a.qtdembalagem WHERE b.codacesso = '27916'
-- ************************************************************************************************************* --

SELECT b.codacesso,a.seqproduto, c.desccompleta,a.preco, d.embalagem,a.qtdembalagem FROM tb_prodpreco AS a 
JOIN tb_prodcodigo AS b ON a.seqproduto = b.seqproduto -- ATÉ AQUI OK WHERE b.codacesso = '40068'
JOIN tb_produto AS c ON b.seqproduto = c.seqproduto AND b.qtdembalagem = a.qtdembalagem -- ATÉ AQUI OK WHERE b.codacesso = '27916'
JOIN tb_famembalagem AS d ON c.seqfamilia = d.seqfamilia AND b.qtdembalagem = d.qtdunembalagem AND b.seqproduto = c.seqproduto 
WHERE b.codacesso LIKE '7891999000576' AND a.nrosegmento = (SELECT valor FROM tb_parametro WHERE parametro = 'NroSegmento' AND grupo = 'Geral') AND a.preco > 0

SELECT b.codacesso,a.seqproduto, c.desccompleta,a.preco, d.embalagem,a.qtdembalagem, a.nrosegmento FROM tb_prodpreco AS a 
JOIN tb_prodcodigo AS b ON a.seqproduto = b.seqproduto -- ATÉ AQUI OK WHERE b.codacesso = '40068'
JOIN tb_produto AS c ON b.seqproduto = c.seqproduto AND b.qtdembalagem = a.qtdembalagem -- ATÉ AQUI OK WHERE b.codacesso = '27916'
JOIN tb_famembalagem AS d ON c.seqfamilia = d.seqfamilia AND b.qtdembalagem = d.qtdunembalagem AND b.seqproduto = c.seqproduto 
WHERE b.codacesso LIKE '27916' AND a.nrosegmento = (SELECT valor FROM tb_parametro WHERE parametro = 'NroSegmento' AND grupo = 'Geral')


-- select a.embalagem from tb_famembalagem AS a WHERE a.qtdembalagem = '1.000'
-- join tb_produto as b On a.seqfamilia = b.seqfamilia where b.seqproduto IN ('4637')


