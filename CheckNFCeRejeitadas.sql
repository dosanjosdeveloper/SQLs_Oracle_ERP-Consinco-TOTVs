select a.nroempresa, a.nrocheckout, a.numerodf, a.dtaemissao, 'R$ '||a.vlrcontabil as VALOR, a.nfechaveacesso, b.justificativa 
from Mflv_Basenf a 
join consincomonitor.tb_doctonfe b 
on a.nfechaveacesso = b.chavenf 
where a.modelodf = '65' 
and a.statusnfe is null 
and a.statusdf != 'C' 
and a.dtaentrada BETWEEN to_date('01/06/2022','DD/MM/YYYY') 
AND to_date('30/06/2022','DD/MM/YYYY')
order by a.nroempresa, a.nrocheckout, a.numerodf

-- select * from consincomonitor.tb_doctonfe a where a.justificativa like 'Rejeicao: Informado NCM inexistente%'
-- select * from consincomonitor.tb_doctonfe a where a.justificativa like 'Rejeicao: Informado NCM inexistente%'
