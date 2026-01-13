-- select * from consincomonitor.tb_famdivisao where seqfamilia = 32732

select a.nroempresa, a.nrocheckout, a.numerodf, a.dtaemissao, 'R$ '||a.vlrcontabil as VALOR,a.nfechaveacesso, b.justificativa 
from Mflv_Basenf a 
join consincomonitor.tb_doctonfe b 
on a.nfechaveacesso = b.chavenf 
where a.modelodf in ('65','55') 
and a.statusnfe is null 
  and a.nroempresa in (11)
and a.statusdf != 'C' 
-- and a.dtaentrada BETWEEN (SELECT TRUNC(SYSDATE,'MM') FROM DUAL)
and a.dtaentrada between to_date('01/01/2022','DD/MM/YYYY') and to_date('31/01/2022','DD/MM/YYYY')
-- AND (SELECT TRUNC(SYSDATE) FROM DUAL)
order by a.nroempresa, a.nrocheckout, a.numerodf

-- select * from consincomonitor.tb_doctotributacaoitem
-- select * from consincomonitor.
