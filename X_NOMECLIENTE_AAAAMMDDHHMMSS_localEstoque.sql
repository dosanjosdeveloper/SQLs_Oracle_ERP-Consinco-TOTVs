-- select * from mrl_local order by seqlocal

SELECT 
   LPAD(l.seqlocal,3,0) as COD_LOCALESTOQUE,
   LPAD(l.seqlocal,2,0)||'_'||l.local||'-'||e.nomereduzido as DESC_LOCAL,
    DECODE(e.nrodivisao, 
    1,'DIVISAO SUPERMERCADO',
    2,'DIVISAO FARMACIA',
    4,'Logistica'
       ) as BANDEIRA_LE,
   e.uf as UF,
   e.cidade as CIDADE,
   e.bairro as BAIRRO,
   0        as VASO_COMUNICANTE,
   1        as FREQ_PADRAO,
   0        as CAPAC_MAX,
   NULL     as OBSERVACAO,
   0        as CALC_DBM,
   NULL     as COD_TIPO,
    DECODE (l.tiplocal,
            'O','OUTROS',
            'L','LOJA',
            'D','DEPOSITO',
            'T','TROCAS') as TIPO_LOCAL,
   NULL     as GRUPO_6,
   NULL     as GRUPO_7
     FROM MRL_LOCAL l
       JOIN max_empresa e ON l.nroempresa = e.nroempresa
         WHERE l.status = 'A'
--         and l.nroempresa = 2
--          AND trunc(l.dtaalteracao) = trunc(sysdate - 3) ;
        


/* Tabelas Usadas */
-- select * from mrl_local where status = 'A';
-- MRL_LOCAL
-- GE_EMPRESA
