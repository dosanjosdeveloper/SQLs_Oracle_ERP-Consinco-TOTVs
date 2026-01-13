-- select * from map_famembalagem //Embalagem Familia
-- select * from map_produto where seqproduto = '1756249' //Produto Familia
-- select * from map_prodcodigovencimento --Produtos com código vencimento e dia inclusao
-- select * from mrl_prodempvencimento
-- select * from Mrl_Prodempvenchist

-- select sysdate from dual

select a.seqproduto, a.codacesso, b.nroempresa, b.vlrpreco,b.qtdembalagem, b.dtavalidade from map_prodcodigovencimento a, mrl_prodempvencimento b 
where b.dtavalidade > sysdate

/*
SELECT A.EMBALAGEM || ' ' || A.QTDEMBALAGEM 
  FROM MAP_FAMEMBALAGEM A, MAP_PRODUTO B 
 WHERE A.SEQFAMILIA = B.SEQFAMILIA 
   AND A.STATUS = 'A' 
   AND B.SEQPRODUTO = :1                         
   AND EXISTS (SELECT 1  
                FROM  MRL_PRODEMPSEG C 
               WHERE C.SEQPRODUTO = B.SEQPRODUTO 
                 AND C.NROEMPRESA = :2                                    
                 AND C.STATUSVENDA = 'A' 
                 AND C.QTDEMBALAGEM = A.QTDEMBALAGEM) 
ORDER BY A.QTDEMBALAGEM  
*/
