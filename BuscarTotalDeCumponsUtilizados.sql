-- Select dcd.nroempresa, dcd.nrocheckout, dcd.seqdocto, d.dtamovimento as DATA_MOVIMENTO,dcd.nrocupomdesconto, cdc.dtahoremissao as emitido_em, 
Select gee.nomereduzido, dcd.nrocheckout, dcd.seqdocto, d.dtamovimento as DATA_MOVIMENTO,dcd.nrocupomdesconto, cdc.dtahoremissao as emitido_em, 
       (select cd.seqcupomdesconto||' - '||cd.descricao from consincomonitor.tb_cupomdesconto cd where cd.seqcupomdesconto = cdc.seqcupomdesconto) CAMPANHA_DESCRICAO,
--       (select dad.valor from consincomonitor.tb_doctoacrescdescto dad where dad.nrocupomdesconto = dcd.nrocupomdesconto and dad.seqtipoacrescdescto = 26 and dad.nroempresa = dcd.nroempresa and dad.nrocheckout = dcd.nrocheckout) AS DESCTO_APLICADO,
   cdf.vlrdesconto, cdf.percdesconto
       
from consincomonitor.tb_doctocupomdesconto dcd
join consincomonitor.tb_cupomdesccodigo cdc on dcd.nrocupomdesconto = cdc.nrocupomdesconto
join consincomonitor.tb_cupomdescfaixa cdf on cdf.seqcupomdesconto = cdc.seqcupomdesconto
join consincomonitor.tb_docto d on d.seqdocto = dcd.seqdocto
--
join ge_empresa gee on gee.nroempresa = dcd.nroempresa
--
WHERE d.nroempresa = dcd.nroempresa
and d.nrocheckout = dcd.nrocheckout
and cdc.seqcupomdesconto in (1301,1459,1305,1612,1821,2023,2175)
-- and d.dtamovimento between to_date('01/06/2023','DD/MM/YYYY') and  to_date('30/06/2023','DD/MM/YYYY')
order by dcd.nroempresa, dcd.nrocheckout, cdc.dtahoremissao


/*
SELECT * FROM consincomonitor.tb_doctoacrescdescto WHERE seqdocto IN (1215520,1215906,1217287,1217369)
 ***************** FUNCIONA MAS NÃO ELEGANTE *********************
Select dcd.nroempresa, dcd.nrocheckout, dcd.seqdocto, 
       (select d.dtamovimento from consincomonitor.tb_docto d where d.seqdocto = dcd.seqdocto and d.nroempresa = dcd.nroempresa and d.nrocheckout = dcd.nrocheckout) DATA_MOVIMENTO,  
   dcd.nrocupomdesconto, cdc.dtahoremissao as emitido_em, 
       (select cd.descricao from consincomonitor.tb_cupomdesconto cd where cd.seqcupomdesconto = cdc.seqcupomdesconto) CAMPANHA_DESCRICAO,
   cdf.vlrdesconto, cdf.percdesconto
from consincomonitor.tb_doctocupomdesconto dcd
join consincomonitor.tb_cupomdesccodigo cdc on dcd.nrocupomdesconto = cdc.nrocupomdesconto
join consincomonitor.tb_cupomdescfaixa cdf on cdf.seqcupomdesconto = cdc.seqcupomdesconto
-- join consincomonitor.tb_docto d on d.seqdocto = dcd.seqdocto
order by dcd.nroempresa, dcd.nrocheckout, cdc.dtahoremissao
*/
-- -- -- -- --
/*
Select cdc.nrocupomdesconto, cdc.seqcupomdesconto||' - '||cd.descricao,cdf.vlrdesconto, cdf.percdesconto, cdc.nrolote 
from consincomonitor.tb_cupomdesccodigo cdc 
join consincomonitor.tb_cupomdescfaixa cdf on cdf.seqcupomdesconto = cdc.seqcupomdesconto
join consincomonitor.tb_cupomdesconto cd on cd.seqcupomdesconto = cdc.seqcupomdesconto
where cdc.ativo = 'S'

*/
/*
select * from consincomonitor.tb_doctoacrescdescto dad
select * from consincomonitor.tb_tipoacrescdescto
select * from consincomonitor.tb_cupomdescfaixa
Select * from consincomonitor.tb_cupomdesconto where ativo = 'S'
Select * from consincomonitor.tb_cupomdesccodigo where ativo = 'S'
select * from consincomonitor.tb_doctocupomdesconto
select * from consincomonitor.tb_doctocupom where seqdocto = 12795
select * from consincomonitor.tb_docto where seqdocto = 12795

**************** BKP - FUNCIONANDO ATÉ O PONTO DE FILTRAR DATA DE MOVIMENTO DO CUPOM *****************

Select dcd.nroempresa, dcd.nrocheckout, dcd.seqdocto,  dcd.nrocupomdesconto, cdc.dtahoremissao as emitido_em, 
       (select cd.descricao from consincomonitor.tb_cupomdesconto cd where cd.seqcupomdesconto = cdc.seqcupomdesconto) CAMPANHA_DESCRICAO,
cdf.vlrdesconto, cdf.percdesconto
from consincomonitor.tb_doctocupomdesconto dcd
join consincomonitor.tb_cupomdesccodigo cdc on dcd.nrocupomdesconto = cdc.nrocupomdesconto
join consincomonitor.tb_cupomdescfaixa cdf on cdf.seqcupomdesconto = cdc.seqcupomdesconto
-- join consincomonitor.tb_docto d on d.seqdocto = dcd.seqdocto
order by dcd.nroempresa, dcd.nrocheckout, cdc.dtahoremissao
*/

