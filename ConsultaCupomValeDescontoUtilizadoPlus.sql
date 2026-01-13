select dc.seqdocto,
 cd.nrocupomdesconto,
 (select consincomonitor.tbe.nomereduzido from consincomonitor.tb_empresa tbe where tbe.nroempresa = dc.nroempresa) EMPRESA,
 lpad(dc.nrocheckout,3,'0') PDV,
-- IMPLEMENTACAO DE VALOR E DATA 

 (SELECT SUM(di.vlrtotal) FROM consincomonitor.tb_doctoitem di WHERE di.seqdocto = dc.seqdocto and di.nroempresa = dc.nroempresa and di.nrocheckout = dc.nrocheckout and di.status != 'C') VLR_PAGO,
'R$ '|| (SELECT SUM(de.vlrdesconto) FROM consincomonitor.tb_doctoitem de WHERE de.seqdocto = dc.seqdocto and de.nroempresa = dc.nroempresa and de.nrocheckout = dc.nrocheckout ) VLR_DESC,
 -- MPREMENTADO O PERCENTUAL
 to_char(
round( 100 * ((SELECT SUM(de.vlrdesconto) FROM consincomonitor.tb_doctoitem de WHERE de.seqdocto = dc.seqdocto and de.nroempresa = dc.nroempresa and de.nrocheckout = dc.nrocheckout)
  / 
  (SELECT SUM(di.vlrtotal) FROM consincomonitor.tb_doctoitem di WHERE di.seqdocto = dc.seqdocto and di.nroempresa = dc.nroempresa and di.nrocheckout = dc.nrocheckout and di.status != 'C')),2),'FM9999999999990.00')
  ||' %' DESC_PERCENTUAL,
  -- MPREMENTADO O PERCENTUAL
  
  (SELECT to_char(doc.dtamovimento,'DD/MM/YYYY') FROM consincomonitor.tb_docto doc WHERE doc.seqdocto = dc.seqdocto and doc.nroempresa = dc.nroempresa and doc.nrocheckout = dc.nrocheckout ) DTA_MOV,
 (SELECT TO_CHAR (doc.dtahoremissao,'HH24:MI:SS') FROM consincomonitor.tb_docto doc WHERE doc.seqdocto = dc.seqdocto and doc.nroempresa = dc.nroempresa and doc.nrocheckout = dc.nrocheckout ) HORA
 
-- IMPLEMENTACAO DE VALOR E DATA 

from consincomonitor.tb_cupomdesccodigo cd
join consincomonitor.tb_doctocupomdesconto dc on cd.nrocupomdesconto = dc.nrocupomdesconto
join consincomonitor.tb_docto dci on dc.seqdocto = dci.seqdocto
where cd.nrolote 
in (3714,3323)
and dci.dtamovimento between to_date('23/01/2023','DD/MM/YYYY') and to_date('31/01/2023','DD/MM/YYYY')

order by dc.nroempresa,dc.nrocheckout

-- 88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
/*
SELECT * FROM consincomonitor.tb_doctoitem di WHERE di.seqdocto = 1678422 and di.nroempresa = 1 and di.nrocheckout = 1 and di.status != 'C'
SELECT SUM(de.vlrdesconto) FROM consincomonitor.tb_doctoitem de WHERE de.seqdocto = 1678422 and de.nroempresa = 1 and de.nrocheckout = 1
*/



select * from consincomonitor.tb_cupomdesconto
