select * from mad_pedvenda i 
where i.usuinclusao = 'ION' 
and i.dtabasefaturamento 
between to_date('08/02/2022','DD/MM/YYYY') 
and to_date('07/08/2022','DD/MM/YYYY')

/*
select sum(i.nropedvenda) from mad_pedvenda i 
where i.usuinclusao = 'ION' 
and i.dtabasefaturamento 
between to_date('07/02/2022','DD/MM/YYYY') 
and to_date('07/02/2022','DD/MM/YYYY')
*/
