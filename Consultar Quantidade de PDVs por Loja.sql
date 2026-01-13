select distinct a.nroempresa, count(1) from tb_checkout a where a.ativo = 'S' and a.nrocheckout <> 100 group by a.nroempresa order by a.nroempresa;

select g.nomereduzido as empresa, lpad(g.nrocgc,12,'0')||'-'||lpad(g.digcgc,2,'0') as CNPJ from ge_empresa g 
