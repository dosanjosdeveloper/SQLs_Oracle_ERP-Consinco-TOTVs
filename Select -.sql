
select * from tb_doctopagto d where d.nroformapagto in (8,14) and d.valor > 0.0 and 
    trunc(d.dtahoremissao) between '16aug2025' and '16aug2025' and d.nroempresa in ('&empresa');
    
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
    and f.codbandeiratef = 20002
--    and f.codbandeiratef = 1 AND f.parcvlrfim = 1 ;

