-- view mflv_basenf

select a.seqnotafiscal, a.numerodf,a.seriedf,a.nroempresa, a.nrocheckout, a.nroecf, a.statusdf, a.statusnfe, a.modelodf, a.dtahoremissao, a.usucancelou, a.nfechaveacesso,a.observacao
from mfl_doctofiscal a 
where a.seriedf 
in ('101','102','103','104','105','106','107','108','109','110','111','112','113','114','115','116','117','118','119','120','121','122') 
and a.nroempresa in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16)
-- and a.statusdf = 'C' 
and a.statusnfe is null 
order by a.nroempresa,a.nrocheckout,a.seriedf, a.numerodf 


select * from mlfv_basenfe v 
where v.descstatusnfe = 'Nota não enviada' 
and v.modelo in (55,65)
-- and v.codgeraloper = 317   
-- and v.statusnf = 'C'
and v.dtaemissao between to_date('01/01/2013','DD/MM/YYYY') 
and to_date('30/09/2022','DD/MM/YYYY')--vnfe.seqnotafiscal = 9227799 order by v.dtaemissao

-- select * from mfl_dffinanceiro



































-- a.numerodf between 331291 and 331299
-- statusnfe >> 7 = Cancelada || IS NULL = Não Enviada || 4 = Autorizada | (137187,331291,50192,52450)
/*
select a.numerodf,a.seriedf,a.nroempresa, a.nrocheckout, a.nroecf, a.statusdf, a.statusnfe, a.modelodf, a.dtahoremissao, a.usucancelou, a.nfechaveacesso,a.observacao
 from mfl_doctofiscal a 
 where a.seriedf in ('101','102','103','104','105','106','107','108') 
 and a.nroempresa = 2 and a.dtamovimento between to_date('01/06/2019','DD/MM/YYYY') and to_date('30/06/2019','DD/MM/YYYY')-- between 331291 and 331299
 order by a.nroempresa,a.nrocheckout,a.seriedf, a.numerodf
 */
 
--  select * from mlf_notafiscal b where b.statusnf = 'C' and b.nroempresa = 2 and b.modelonf = '65'
 /*
 select a.numerodf,a.seriedf,a.nroempresa, a.nrocheckout, a.nroecf, a.statusdf, a.statusnfe, a.modelodf, a.dtahoremissao, a.usucancelou, a.nfechaveacesso,a.observacao
 from mfl_doctofiscal a 
 where a.seriedf in ('103','108') 
 and a.nroempresa = 2 and a.numerodf in (137187,331291,50192,52450)-- between to_date('01/06/2019','DD/MM/YYYY') and to_date('30/06/2019','DD/MM/YYYY')-- between 331291 and 331299
 order by a.nroempresa,a.nrocheckout,a.seriedf, a.numerodf
*/
