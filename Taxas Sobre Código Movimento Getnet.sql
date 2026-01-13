select 
  f.tipo, 
  f.codmovimento, 
  f.descricao,
  f.nroformapagto,
  f.codredetef as COD_REDE,
  f.codbandeiratef AS COD_BANDEIRA,
  f.parcvlrfim AS NRO_MAX_PARCELA
--   F.STATUS
--  'Numero de Parcelas - '||f.parcvlrfim
    from fi_tscodmovimento f where f.codredetef = 181 
    and f.codbandeiratef = 1 AND f.parcvlrfim = 1 ;
    
-- select * from fi_tscadtippagto (Descrição do Tipo de Pagamento)
SELECT * FROM MAX_EMPRESA 

select 
   c.codmovimento,
   c.nroempresa,
   c.taxaadm,
   c.prazoreceber
        from fi_tsempcodmovimento c where c.codmovimento in (441);

SELECT 
  F.TIPO||'-'|| T.DESCRICAO AS TIPO_PAGAMENTO,
  C.CODMOVIMENTO||'-'||F.DESCRICAO AS COD_MOVIMENTO,
  M.NOMEREDUZIDO, -- C.NROEMPRESA,
  C.TAXAADM,
  C.PRAZORECEBER,
  F.PARCVLRFIM AS QTD_MAX_PARCELA
   FROM FI_TSEMPCODMOVIMENTO C, FI_TSCODMOVIMENTO F, FI_TSCADTIPPAGTO T , MAX_EMPRESA M
     WHERE 
        C.CODMOVIMENTO = F.CODMOVIMENTO
          AND C.NROEMPRESA = M.NROEMPRESA
          AND F.TIPO = T.TIPO
--        AND C.CODMOVIMENTO IN (441)
--        AND C.NROEMPRESA IN (1)
        AND F.CODREDETEF = 181
        ORDER BY C.CODMOVIMENTO;
