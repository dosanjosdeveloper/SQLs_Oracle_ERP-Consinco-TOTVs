-- SELECT *  FROM    MRLV_NFEIMPORTACAOSEMFORNEC A
select * from mrlv_nfeimportacao a 
  where -- a.NROEMPRESA = 11 
    -- and
    a.SEQPESSOA = 18312 
    and to_date(a.DTAEMISSAO,'DD/MM/YYYY') >= to_date('23/05/2024','DD/MM/YYYY')
   order by a.dtaemissao
