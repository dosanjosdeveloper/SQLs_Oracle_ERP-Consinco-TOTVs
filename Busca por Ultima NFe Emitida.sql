-- PDV007, PDV008 e PDV009

select 
   d.nrocheckout, 
   max(d.nronotafiscal)
      from tb_doctocupom d 
        where d.nroempresa = 1 
          and d.nrocheckout 
            in (1,2,3,4,5,6,7,8,9) 
             group by d.nrocheckout
              order by d.nrocheckout
/*
PDV007 - NF 10404
PDV008 - NF 781
PDV009 - Não Retornou
*/
