
select cd.nrocupomdesconto,
(select consincomonitor.tbe.nomereduzido from consincomonitor.tb_empresa tbe where tbe.nroempresa = dc.nroempresa) 
EMPRESA, lpad(dc.nrocheckout,3,'0') PDV,

'R$  '||(SELECT SUM(di.vlrtotal) FROM consincomonitor.tb_doctoitem di WHERE di.seqdocto = dc.seqdocto and di.nroempresa = dc.nroempresa and di.nrocheckout = dc.nrocheckout ) VLR_PAGO,
'R$  '||(SELECT SUM(de.vlrdesconto) FROM consincomonitor.tb_doctoitem de WHERE de.seqdocto = dc.seqdocto and de.nroempresa = dc.nroempresa and de.nrocheckout = dc.nrocheckout ) VLR_DESC_APLICAD,
(SELECT to_char(doc.dtahoremissao,'DD/MM/YY hh:MM:ss') FROM consincomonitor.tb_docto doc WHERE doc.seqdocto = dc.seqdocto and doc.nroempresa = dc.nroempresa and doc.nrocheckout = dc.nrocheckout ) DTA_HOR_EMISSAO

from consincomonitor.tb_cupomdesccodigo cd
join consincomonitor.tb_doctocupomdesconto dc on cd.nrocupomdesconto = dc.nrocupomdesconto
join consincomonitor.tb_docto dci on dc.seqdocto = dci.seqdocto
where cd.nrocupomdesconto 
in ( )
and dci.dtamovimento between to_date('24/01/2023','DD/MM/YYYY') and to_date('30/04/2023','DD/MM/YYYY')
order by dc.nroempresa,dc.nrocheckout,dta_hor_emissao

-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

/*
select * from consincomonitor.tb_docto where seqdocto = 603291 and nroempresa = 3 and nrocheckout = 4
select * from consincomonitor.tb_doctoitem where seqdocto = 603291 and nroempresa = 3 and nrocheckout = 4
select * from consincomonitor.tb_cupomdesconto
select * from consincomonitor.tb_cupomdesccodigo
select * from consincomonitor.tb_doctocupomdesconto
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

select cd.nrocupomdesconto,
(select consincomonitor.tbe.nomereduzido from consincomonitor.tb_empresa tbe where tbe.nroempresa = dc.nroempresa) 
EMPRESA, lpad(dc.nrocheckout,3,'0') PDV

-- 'R$  '||(SELECT SUM(di.vlrtotal) FROM consincomonitor.tb_doctoitem di WHERE di.seqdocto = dc.seqdocto and di.nroempresa = dc.nroempresa and di.nrocheckout = dc.nrocheckout ) VLR_PAGO,
-- 'R$  '||(SELECT SUM(de.vlrdesconto) FROM consincomonitor.tb_doctoitem de WHERE de.seqdocto = dc.seqdocto and de.nroempresa = dc.nroempresa and de.nrocheckout = dc.nrocheckout ) VLR_DESC_APLICAD,
-- (SELECT to_char(doc.dtahoremissao,'DD/MM/YY hh:MM:ss') FROM consincomonitor.tb_docto doc WHERE doc.seqdocto = dc.seqdocto and doc.nroempresa = dc.nroempresa and doc.nrocheckout = dc.nrocheckout ) DTA_HOR_EMISSAO

from consincomonitor.tb_cupomdesccodigo cd
join consincomonitor.tb_doctocupomdesconto dc on cd.nrocupomdesconto = dc.nrocupomdesconto
where cd.nrolote 
in (1306,1460,1614,1822,2024,2176)
order by dc.nroempresa,dc.nrocheckout

XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

 select * from consincomonitor.tb_cupomdesccodigo ab where ab.nrolote in (3256) 

 select ab.seqcupomdesconto, ab.nrocupomdesconto from consincomonitor.tb_cupomdesccodigo ab where ab.nrolote in (1614) 
select * from consincomonitor.tb_doctopagto

*/

