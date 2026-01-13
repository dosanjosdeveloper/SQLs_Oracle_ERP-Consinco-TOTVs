select a.nroempresa,
       count(*) as QTDE_TOTAL_TRANSACOES,
       sum (a.vlrtotal) as TRANSACAO_TOTAL_VLRS
    from tb_doctopagto a 
     where a.nroformapagto in (8,14) -- POS 8,14  TEF/PDV 6,7,13
       and trunc(a.dtahoremissao) between '26apr2025'  and '28apr2025'
       and a.vlrtotal > 0.0
       group by a.nroempresa
       order by a.nroempresa
       
       
       
--       select * from ge_empresa
       

