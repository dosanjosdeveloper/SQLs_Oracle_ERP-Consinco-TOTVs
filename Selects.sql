select * from consincomonitor.tb_doctopagto a where a.nroempresa = 5 and a.nrocheckout = 3 and trunc(a.dtahoremissao) = to_date('02/12/2023','DD/MM/YYYY') and a.valor > 0.00

select * from consinco.mrl_formapagto m where m.nroformapagto in ('77');

select a.seqdocto, a.coo from consincomonitor.tb_docto a where a.nroempresa = 2 and a.nrocheckout = 5 and a.dtamovimento >= to_date('10/12/2023','DD/MM/YYYY') order by a.dtahoremissao desc
select * from consincomonitor.tb_doctocupom w where w.nroempresa = 2 and w.nrocheckout = 5 and w.seqdocto in (
       select a.seqdocto from consincomonitor.tb_docto a where a.nroempresa = 2 and a.nrocheckout = 5 and a.dtamovimento >= to_date('10/12/2023','DD/MM/YYYY')
) order by w.nronotafiscal desc
