select p.nroempresa,
       decode(p.status,
              'L','Liberado',
              'D','Digitacao',
              'C','Cancelado',
              'F','Faturado') as STATUS,
               i.nrovendedor,
       p.nrocomanda,
       p.nroprevenda,
       i.seqproduto||'-'||(select c.desccompleta from tb_produto c where c.seqproduto = i.seqproduto) as produto ,
       i.quantidade,
             CASE
                    WHEN EXISTS (select di.seqdocto from consincomonitor.tb_doctoitem di where di.nroempresa in (11) and di.nroprevenda = P.NROPREVENDA)
                    THEN 'Faturado no PDV'
                    ELSE 'Nao Faturado no PDV'
              END AS SE_FATURADO,
       p.dtahoremissao
  from tb_prevenda p, tb_prevendaitem i
    where p.nroempresa = i.nroempresa
          and p.nroprevenda = i.nroprevenda
      and p.nroempresa = '11'
      and trunc(p.dtahoremissao) between to_date('01/08/2025','DD/MM/YYYY') and to_date(sysdate,'DD/MM/YYYY')
      and p.status not in ('C','F','D');      

/*
 VERSAO 1.1
SELECT DISTINCT p.nroempresa,
       DECODE(p.status, 'L','Liberado', 'D','Digitacao', 'C','Cancelado', 'F','Faturado') AS STATUS,
       i.nrovendedor,
       p.nrocomanda,
       p.nroprevenda,
       i.seqproduto || '-' || (SELECT c.desccompleta FROM tb_produto c WHERE c.seqproduto = i.seqproduto) AS produto,
       i.quantidade,
       p.dtahoremissao
FROM tb_prevenda p
JOIN tb_prevendaitem i ON p.nroempresa = i.nroempresa AND p.nroprevenda = i.nroprevenda
JOIN tb_doctoitem d ON i.seqproduto = d.seqproduto AND i.nroempresa = d.nroempresa AND i.nrovendedor = d.nrovendedor
WHERE p.nroempresa = '11' 
AND TRUNC(p.dtahoremissao) = TO_DATE('10/08/2025','DD/MM/YYYY');
      
      
      

      
 VERSAO 1.0
select p.nroempresa,
       decode(p.status,
              'L','Liberado',
              'D','Digitacao',
              'C','Cancelado',
              'F','Faturado') as STATUS,
       i.nrovendedor,
       p.nrocomanda,
       p.nroprevenda,
       i.seqproduto||'-'||(select c.desccompleta from tb_produto c where c.seqproduto = i.seqproduto) as produto ,
       i.quantidade,
       p.dtahoremissao
  from tb_prevenda p, tb_prevendaitem i
    where p.nroempresa = i.nroempresa
          and p.nroprevenda = i.nroprevenda
      and p.nroempresa = '11' 
      and trunc(p.dtahoremissao) = to_date('10/08/2025','DD/MM/YYYY')
      and p.status not in ('C','F','D') 
/*
