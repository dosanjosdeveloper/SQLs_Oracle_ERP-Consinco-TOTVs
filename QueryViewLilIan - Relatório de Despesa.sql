-- select * from or_nfdespesa a where a.valor = '3743.79'
-- select a.nroempresa,a.seqpessoa, a.nronota, a.valor, a.cgo, a.dtaemissao, a.dtainclusao, a.dtavenctoir, a.codrecdarfpisret from or_nfdespesa a where a.valor = '3670.27'
 select lpad(a.nroempresa,2,'0') ||' - '|| c.fantasia as EMPRESA,lpad(b.nrocgccpf,12,'0')||'-'||b.digcgccpf ||' | '||a.seqpessoa ||' - '|| b.nomerazao as PESSOA , a.nronota,'R$ '|| a.valor VALOR_NF,'R$ '|| (a.vlrpis+a.vlrcofins + a.vlrcssll) as VALOR_DARF,'R$ '||  a.vlrir as VALOR_IRRF,a.dtavenctopis,
 a.dtaemissao, a.dtainclusao, a.dtavenctoir 
 from or_nfdespesa a
 join ge_pessoa b on b.seqpessoa = a.seqpessoa
 join ge_empresa c on c.nroempresa = a.nroempresa
 where a.dtavenctopis 
 between to_date('01/01/2020','DD/MM/YYYY') 
 and to_date('31/12/2023','DD/MM/YYYY') 
 and a.seqpessoa  = 7729
-- 5341
--  and a.valor = '3036.00'
-- select * from rf_paramnatnfdesp b
-- select a.valor, (a.vlrpis+a.vlrcofins + a.vlrcssll) as VALOR_DARF, a.vlrir,a.dtavenctopis, a.dtavenctocofins, a.dtavenctocssll from or_nfdespesa a where a.dtavenctopis between to_date('01/01/2020','DD/MM/YYYY') and to_date('31/12/2020','DD/MM/YYYY') and a.seqpessoa  = '5341'

-- Select * from or_recimposto NADA TALVE TB TEMP
-- select * from or_parametro
-- select * from ge_pessoa

