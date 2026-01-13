--Select * from consincomonitor.tb_cupomdesconto
-- select * from consincomonitor.tb_cupomdesccodigo b 
select * from consincomonitor.tb_doctocupomdesconto

-- select * from consincomonitor.tb_cupomdesccodigo
--  select * from consincomonitor.TB_DOCTOCUPOMDESCONTO t where t.nrocupomdesconto = 1000000000011348
 
 select * from consincomonitor.tb_docto d where d.seqdocto = 483888 and d.nroempresa = 5 and d.nrocheckout = 4
-- select * from consincomonitor.tb_cupomdesccodigo where seqcupomdesconto in (1121)
-- select * from tb_empresa
/*
select cd.nrocupomdesconto, (select consincomonitor.tbe.nomereduzido from consincomonitor.tb_empresa tbe where tbe.nroempresa = dc.nroempresa) EMPRESA, lpad(dc.nrocheckout,3,'0') PDV from consincomonitor.tb_cupomdesccodigo cd
join consincomonitor.tb_doctocupomdesconto dc on cd.nrocupomdesconto = dc.nrocupomdesconto
where cd.seqcupomdesconto 
in (651,855,753,1041)
order by dc.nroempresa, dc.nrocheckout

-- select * from consincomonitor.tb_cupomdesccodigo where seqcupomdesconto in (651,855,753,1041)
*/

Select
 e.nomereduzido as EMPRESA,
 a.periodo,
 a.funcionario as COLABORADOR,
 a.nrocupomdesconto as CUPOM_DESCONTO

From SUPERNORTE.TISUPER_FUNC_PREMIOMETA a, max_empresa e, consincomonitor.tb_cupomdesccodigo c
 Where e.nroempresa = a.nroempresa
   and a.nrocupomdesconto = c.nrocupomdesconto
   
   and a.periodo like 'DEZ/2022'
   and c.seqcupomdesconto in (1121)
   
Order by a.nroempresa, a.funcionario


/*TEBELA NUMERO DE LOTE E CÓDIGO DE DESCONTO*/
