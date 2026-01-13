 SELECT a.SEQPRODUTO, a.NROEMPRESA, a.NRODEPARTAMENTO, a.STATUSCOMPRA, a.ESTQLOJA, a.ESTQTROCA, to_char(a.DTAULTENTRADA,'DD/MM/YYYY') as DTAENTRADA,
 to_char(a.DTAULTCOMPRA,'DD/MM/YYYY') AS COMPRADOEM, to_char(a.DTAULTVENDA,'DD/MM/YYYY') as ULTVENDA,to_char(a.DTAULTVENDAEFETIVA,'DD/MM/YYYY') as VEND_EFETIVA 
 FROM mrl_produtoempresa a where nroempresa = 1 and seqproduto = '4637' ;

 SELECT b.seqproduto,b.seqfamilia, b.desccompleta FROM map_produto b WHERE b.seqproduto = '4637'
 SELECT c.seqfamilia, c.qtdembalagem, c.seqproduto, c.codacesso FROM map_prodcodigo c  WHERE c.seqproduto = '4637' ;
 SELECT d.seqproduto, d.qtdembalagem, d.nrosegmento, d.nroempresa, d.statusvenda, d.precobasenormal, d.precogernormal, d.precogerpromoc, d.precovalidnormal 
 FROM mrl_prodempseg d where d.seqproduto = 4637
 SELECT e.seqfamilia, e.qtdembalagem, e.embalagem, e.tdunidemb WHERE map_famembalagem e
 
-- select * from mrl_produtoempresa where nroempresa = 1 and seqproduto = '4637' -- (EMPRESA, ESTOQUE, ULTMA_VENDA)
-- select * from map_produto where seqproduto = 4637 -- (DESCRIÇÃO COMPLETA)
-- select * from map_prodcodigo where seqproduto = 4637 -- (CODIGO DE ACESSO) 
-- select * from mrl_prodempseg where nroempresa = 7 and seqproduto = 4637 -- (PRECO, EMPRESA, NROSEGMENTO, STATUS_VENDA)
-- select * from map_famembalagem where seqfamilia = '3895' -- (QTD_UN_EMBALAGEM)
-- SELECT * FROM ge_empresa -- (EMPRESA)

SELECT c.seqproduto, c.codacesso, b.desccompleta, d.precobasenormal, e.embalagem,to_char(a.dtaultvenda,'dd/mm/yyyy') as dtaultvenda, e.qtdunidemb, a.estqloja, a.estqtroca FROM map_prodcodigo c 
JOIN map_produto b ON c.seqproduto = b.seqproduto -- AKI OK where c.codacesso = '27916'
JOIN mrl_prodempseg d ON c.seqproduto = d.seqproduto AND c.qtdembalagem = d.qtdembalagem -- AKI OK where c.codacesso = '40070' and d.nroempresa = 7 and d.statusvenda = 'A'
JOIN map_famembalagem e ON c.seqfamilia = e.seqfamilia AND c.qtdembalagem = e.qtdunidemb -- AKI OK where c.codacesso = '40068' and d.nroempresa = 7 and d.statusvenda = 'A'
JOIN mrl_produtoempresa a ON c.seqproduto= a.seqproduto AND a.nroempresa = d.nroempresa where c.codacesso = '7891999000576' and d.nroempresa = 1 and d.statusvenda = 'A' and d.nrosegmento = (SELECT DISTINCT nrosegmento FROM consincomonitor.tb_checkout WHERE nroempresa = d.nroempresa AND nrocheckout = 1 AND ativo = 'S')

select * from consincomonitor.tb_checkout where nroempresa = 1 and nrocheckout = 1


