SELECT 
    LPAD(g.nroempresa,4,0) CODIGO,
    LPAD(g.nroempresa,4,0)||'_'||g.nomereduzido DESCRICAO,
    DECODE(g.nrodivisao, 
    1,'Supernorte',
    2,'Farmacia Popular ',
    4,'Logistica'
       ) 
       AS BANDEIRA,
    g.uf UF,
    g.cidade CIDADE,
    g.bairro BAIRRO,
    NULL as GRUPO_5,
    NULL as GRUPO_6,
    NULL as OBSERVACAO
  FROM MAX_EMPRESA g


/*
SELECT 
    LPAD(g.nroempresa,4,0) CODIGO,
    LPAD(g.nroempresa,4,0)||'_'||g.nomereduzido DESCRICAO,
    NULL AS BANDEIRA,
    
    g.estado UF,
    g.cidade CIDADE,
    g.bairro BAIRRO,
    NULL as GRUPO_5,
    NULL as GRUPO_6,
    NULL as OBSERVACAO
  FROM GE_EMPRESA g
*/
--  WHERE g.dtaalteracao = TRUNC(sysdate - 30) -- Para qaundo houver alteração ou inclução de uma Nova Empresa.

-- select * from max_empresa a 

/* Tabela Usada */
-- MAX_EMPRESA
-- GE_EMPRESA
