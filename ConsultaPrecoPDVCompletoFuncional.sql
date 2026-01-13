SELECT b.codacesso,a.seqproduto, c.desccompleta,a.preco, d.embalagem,a.qtdembalagem, a.nrosegmento FROM tb_prodpreco AS a 
 JOIN tb_prodcodigo AS b ON a.seqproduto = b.seqproduto -- ATÉ AQUI OK WHERE b.codacesso = '40068'
 JOIN tb_produto AS c ON b.seqproduto = c.seqproduto AND b.qtdembalagem = a.qtdembalagem -- ATÉ AQUI OK WHERE b.codacesso = '27916'
 JOIN tb_famembalagem AS d ON c.seqfamilia = d.seqfamilia AND b.qtdembalagem = d.qtdunembalagem AND b.seqproduto = c.seqproduto 
 WHERE b.codacesso LIKE '25252' AND a.nrosegmento = (SELECT valor FROM tb_parametro WHERE parametro = 'NroSegmento' AND grupo = 'Geral')
