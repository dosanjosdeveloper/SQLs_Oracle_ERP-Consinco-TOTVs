-- select * from tb_creditocupom a where a.sequsuario = 125 and a.seqtipocredito = 2 and a.vlrcredito < 50
select sum(b.vlrcredito) from tb_creditocupom b 
  where b.sequsuario = 125 
    and b.seqtipocredito = 2 
    and b.vlrcredito >= 20 
    and trunc(b.dtahoremissao) 
     between to_date('01/01/2023','DD/MM/YYYY') and to_date('05/07/2023','DD/MM/YYYY')
order by b.dtahoremissao;
