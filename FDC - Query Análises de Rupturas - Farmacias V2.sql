/* MRL_PRODUTOEMPRESA */
select 
   a.nroempresa ||' - '|| e.nomereduzido as EMPRESA,
   a.seqproduto ||' - '|| p.desccompleta as PRODUTO,
--   a.statuscompra,
   a.estqloja,
    a.dtaultentrada AS ULT_ENTRADA,
   a.qtdultentrada AS QTD_ULT_ENTRADA, 
   a.dtaultmovsaida as ULT_SAIDA,
   a.dtapenultmovsaida AS PENULT_SAIDA,
--   a.dtaultcompra,
--   a.qtdpendpedcompra,
--   a.dtaultmovtacao,
--   a.dtaultmoventrada,
   TRUNC(sysdate - a.dtaultmovsaida) as DIA_S_SEM_VENDA
--   a.seqnfultentrcusto,
--   a.*
 from mrl_produtoempresa a, map_produto p, max_empresa e
    where a.seqproduto = p.seqproduto 
     and a.nroempresa = e.nroempresa
     and a.nroempresa in (11)
     and a.statuscompra = 'A'
     and a.estqloja > 0
     
     /* Criar uma coluna de atenção para quando a ultima venda for maior que a data de ultima entrada*/
--     and a.seqproduto = 1450506  

-- select * from max_empresa
-- select * from map_produto where seqproduto = 1450506
    
select 
    b.numeronf, 
    b.seqpessoa, 
    b.serienf,
    b.tipnotafiscal, 
    b.nroempresa, 
    b.seqproduto, 
    b.quantidade, 
    b.dtamovtoitem,
    b.cgoremessa,
    b.dtapedido 
      from MLF_NFITEM b 
       where b.nroempresa = 11
       and b.seqproduto = 1450506
       and b.dtamovtoitem between to_date('01/01/2025','DD/MM/YYYY') and to_date('21/11/2025','DD/MM/YYYY')
       
selec


select 
   -- a.nroempresa ||' - '||
   e.nomereduzido as EMPRESA,
   a.seqproduto ||' - '|| p.desccompleta as PRODUTO,
   a.estqloja,
   a.dtaultentrada AS ULT_ENTRADA,
   a.qtdultentrada AS QTD_ULT_ENTRADA, 
   a.dtaultmovsaida as ULT_SAIDA,
   a.qtdultvenda as ULT_VENDA,
   a.qtdultvendaefetiva as ULT_VENDA_EFETIVA,
   a.dtapenultmovsaida AS PENULT_SAIDA,
   TRUNC(sysdate - a.dtaultmovsaida) as DIA_S_SEM_VENDA

 from mrl_produtoempresa a, map_produto p, max_empresa e
    where a.seqproduto = p.seqproduto 
     and a.nroempresa = e.nroempresa
     and e.nomereduzido in ('FM01_MATRIZ','FM02_GETAT','FM03_REPART','FM04_VILA','FM05_LIBERD','FM06_BEIRA RIO','FM07_BREU')
     and a.statuscompra = 'A'
     and a.estqloja = 0
   order by e.nomereduzido, p.desccompleta, a.dtaultmovsaida
     
     
--  select nomereduzido from max_empresa where nrodivisao = 2;

/* COMANDO PARA GERAR INSER EM OUTROS BANCOS - AJUSTE CONFORME NECESSIDADE */
SELECT 
    'INSERT INTO RUP_ENTRADA_SAIDA (EMPRESA, SEQPRODUTO, PRODUTO, ESTOQUE_LOJA, QTD_ULTIMA_ENTRADA, DTA_ULTIMA_ENTRADA, DTA_ULTIMA_SAIDA, QTD_ULTIMA_VENDA, DTA_PENULTIMA_SAIDA) VALUES (' ||
    '''' || e.nomereduzido || ''',' ||
    a.seqproduto || ',' ||
    '''' || REPLACE(p.desccompleta, '''', '''''') || ''',' ||
    NVL(a.estqloja, 0) || ',' ||
    NVL(a.qtdultentrada, 0) || ',' ||

    /* Última entrada */
    CASE WHEN a.dtaultentrada IS NULL 
         THEN 'NULL' 
         ELSE '''' || TO_CHAR(a.dtaultentrada, 'YYYY-MM-DD') || '''' 
    END || ',' ||

    /* Última saída */
    CASE WHEN a.dtaultmovsaida IS NULL 
         THEN 'NULL' 
         ELSE '''' || TO_CHAR(a.dtaultmovsaida, 'YYYY-MM-DD') || '''' 
    END || ',' ||

    NVL(a.qtdultvendaefetiva, 0) || ',' ||

    /* Penúltima saída */
    CASE WHEN a.dtapenultmovsaida IS NULL 
         THEN 'NULL' 
         ELSE '''' || TO_CHAR(a.dtapenultmovsaida, 'YYYY-MM-DD') || '''' 
    END ||

    ');' AS INSERIR_EM_MYSQL
FROM mrl_produtoempresa a
JOIN map_produto p ON a.seqproduto = p.seqproduto
JOIN max_empresa e ON a.nroempresa = e.nroempresa
WHERE e.nomereduzido IN (
    'FM01_MATRIZ','FM02_GETAT','FM03_REPART','FM04_VILA',
    'FM05_LIBERD','FM06_BEIRA RIO','FM07_BREU'
)
AND a.statuscompra = 'A'
ORDER BY e.nomereduzido, p.desccompleta, a.dtaultmovsaida;

/* COMANDO PARA INSERT EM MYSQL JÁ CONCATENADO */
select 
   'INSERT INTO RUP_ENTRADA_SAIDA (EMPRESA,SEQPRODUTO,PRODUTO,ESTOQUE_LOJA,QTD_ULTIMA_ENTRADA,DTA_ULTIMA_ENTRADA,DTA_ULTIMA_SAIDA,QTD_ULTIMA_VENDA,DTA_PENULTIMA_SAIDA) VALUES ('''||
  e.nomereduzido||''','''||
  a.seqproduto||''','''||
  p.desccompleta||''','''||
  a.estqloja||''','''||
  a.qtdultentrada||''','''||
  TO_CHAR(a.dtaultentrada, 'YYYY-MM-DD')||''','''||
  TO_CHAR(a.dtaultmovsaida,'yyyy-MM-DD')||''','''||
  a.qtdultvendaefetiva||''','''||
  TO_CHAR(a.dtapenultmovsaida,'YYYY-MM-DD')||');' as INSERIR_EM_MYSQL
 from mrl_produtoempresa a, map_produto p, max_empresa e
    where a.seqproduto = p.seqproduto 
     and a.nroempresa = e.nroempresa
     and e.nomereduzido in ('FM01_MATRIZ','FM02_GETAT','FM03_REPART','FM04_VILA','FM05_LIBERD','FM06_BEIRA RIO','FM07_BREU')
     and a.statuscompra = 'A'                                                                              
   order by e.nomereduzido, p.desccompleta, a.dtaultmovsaida 
     
