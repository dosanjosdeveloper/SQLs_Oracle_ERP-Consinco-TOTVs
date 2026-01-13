select * from map_produto where seqproduto = 1757784  --seqfamilia = 142032

select * from map_familia where seqfamilia = 142032

-- RETORNA SOMA DOS VALE CRÉDITOS UTILIDADOS

select sum(fp.valor) from consincomonitor.tb_doctopagto fp where fp.nrocreditocupom in (
       select t.nrocreditocupom from consincomonitor.tb_creditocupom t
         where t.seqtipocredito = 2
            and t.vlrcredito >= 20 
--            and trunc(dtahoremissao) between to_date('01/09/2023','DD/MM/YYYY') and to_date('31/08/2023','DD/MM/YYYY')
       )
--       and fp.nroempresa in (1)
       and trunc(fp.dtahoremissao) between to_date('01/08/2023','DD/MM/YYYY') and to_date('31/08/2023','DD/MM/YYYY')
       and fp.nroformapagto in (16,132);

-- RETORNA QUANTIDADE DOS VALE CRÉDITOS UTILIZADADOS

select count(*) from consincomonitor.tb_doctopagto fp where fp.nrocreditocupom in (
       select t.nrocreditocupom from consincomonitor.tb_creditocupom t
         where t.seqtipocredito = 2
            and t.vlrcredito >= 20
            and trunc(dtahoremissao) between to_date('01/06/2023','DD/MM/YYYY') and to_date('31/07/2023','DD/MM/YYYY')
       )
       and fp.nroformapagto in (16,132);

-- RETORNA LISTA DOS VALE CRÉDITOS UTILIZADADOS



select * from consincomonitor.tb_doctopagto fp where fp.nrocreditocupom in (
       select t.nrocreditocupom from consincomonitor.tb_creditocupom t
         where t.seqtipocredito = 2
            and t.vlrcredito >= 20
--            and trunc(t.dtahoremissao) between to_date('01/06/2023','DD/MM/YYYY') and to_date('31/07/2023','DD/MM/YYYY')
       )
       and trunc(fp.dtahoremissao) between to_date('01/08/2023','DD/MM/YYYY') and to_date('31/08/2023','DD/MM/YYYY')
       and fp.nroformapagto in (16,132);


-- RETORNA TODOS O VALES CRÉDITOS EMITIDOS A PARTIR DE DATA X E VALORES MAIOR_IGUAL A 20--


  select to_char(t.dtahoremissao,'DD/MM/YYYY') as EMITIDO_EM, t.vlrcredito as VLR_CREDITO, t.sequsuario as USER_EMISSOR from consincomonitor.tb_creditocupom t
         where t.seqtipocredito = 2
--           and t.vlrcredito >= 20
            and trunc(dtahoremissao) between to_date('01/09/2023','DD/MM/YYYY') and to_date('31/12/2023','DD/MM/YYYY')
         order by t.dtahoremissao

-- RETORNA TODOS O VALES CRÉDITOS EMITIDOS A PARTIR DE DATA X E VALORES MAIOR_IGUAL A 20--

select * from consincomonitor.tb_creditocupom t -- sum(t.vlrcredito)
         where t.seqtipocredito = 2
            and t.vlrcredito >= 50
          and trunc(dtahoremissao) between to_date('01/09/2023','DD/MM/YYYY') and to_date('31/12/2023','DD/MM/YYYY')
          
          order by t.dtahoremissao

/*         
select * from consincomonitor.tb_tipocredito order by seqtipocredito;
select * from tb_formapagto b where b.formapagto like '%PREMI%' or b.formapagto like '%TROCA%'
select (3 + 2) from dual;
select * from consincomonitor.tb_doctopagto fp where fp.nrocreditocupom in (50010100040689,50010100040467,50010100040733);
select * from consincomonitor.tb_doctopagto fp where fp.nroformapagto in (16,132) and fp.nrocreditocupom in (50010020062457);
*/
