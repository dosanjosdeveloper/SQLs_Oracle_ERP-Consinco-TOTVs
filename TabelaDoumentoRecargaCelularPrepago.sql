select  sum(a.valor) from tb_doctoprepago a where a.nroempresa = 12 and a.dtahoremissao 
between TO_DATE ('18/06/2020','DD/MM/YYYY') and TO_DATE ('31/08/2020','DD/MM/YYYY')