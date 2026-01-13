/* * * * * * * Tabela NFe Modelo 55 * * * * * * */
select * from mlf_notafiscal t where t.numeronf in (50758,331291,143907,57820) and t.nroempresa = 2

/* * * * * * * Tabela NFCe Modelo 65 * * * * * * */
select  e.statusnfe,e.* from mfl_doctofiscal e where e.numerodf in (57820) and e.nroempresa = 2 and e. seriedf in ('108')

/* * * * * * * View NFe Modelo 55/NFCe Modelo 65 * * * * * * */
select * from mlfv_basenfe

/*XXXXXXXXX- CUIDADO - Update em Tabela mfl_doctofiscal -XXXXXXXXXX*/
/* 
 update mfl_doctofiscal b
set b.statusnfe = 7
where b.nroempresa = 2
and b.numerodf = 57820
and b.seriedf = '108'
and b.nfechaveacesso = '15190705327241000325651080000578201000578208'
*/
