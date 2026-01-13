
select a.nroempresa, a.nrocheckout, a.numerodf, a.dtaemissao, 'R$ '||a.vlrcontabil as VALOR,a.nfechaveacesso, b.justificativa 
from Mflv_Basenf a 
join consincomonitor.tb_doctonfe b 
on a.nfechaveacesso = b.chavenf 
where a.modelodf = '65' 
and a.statusnfe is null 
and a.statusdf != 'C' 
and a.dtaentrada BETWEEN (SELECT TRUNC(SYSDATE,'MM') FROM DUAL)
AND (SELECT TRUNC(SYSDATE) FROM DUAL)
order by a.nroempresa, a.nrocheckout, a.numerodf

-- select * from mflv_basenf z where z.nroempresa = 11 and z.dtaemissao = (SELECT TRUNC(SYSDATE) FROM DUAL)




