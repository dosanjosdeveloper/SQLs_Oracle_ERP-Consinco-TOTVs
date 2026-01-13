select m.usuinclusao,m.* 
  from mad_pedvenda m 
    where -- m.nroempresa in (1,2,3,5,6,7,8,9,10,15) and
      trunc(m.dtainclusao) between to_date('01/01/2023','DD/MM/YYYY') 
     and to_date('31/12/2023','DD/MM/YYYY') 
     and m.usuinclusao = 'MF_PEDIDOS' 
       order by m.dtainclusao desc
       
       
select * from Max_parametro where valor = '720'
