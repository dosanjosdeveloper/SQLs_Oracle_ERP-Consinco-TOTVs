--- SELECT PARA VER SE ESTÁ ATIVO A REFORMA TRIBUTÁRIA NO FRENTE DE CAIXA -----
select *
from consincomonitor.tb_parampdvvalor a
where a.parampdvgrupo like '%ReformaTributaria%'
AND TO_CHAR(A.VALOR) = 'S'

--- PARA SABER SE ESTÃO USANDO A FÓRMULA DA REFORMA TRIBUTÁRIA---

SELECT distinct a.nroempresa,
a.nrocheckout
FROM CONSINCOMONITOR.TB_DOCTOTRIBUTACAOITEM a
inner join CONSINCOMONITOR.tb_docto b
on b.nroempresa = a.nroempresa
and b.nrocheckout = a.nrocheckout
and b.seqdocto = a.seqdocto

WHERE b.dtamovimento = '24-dec-2025' 99984-6643
and a.seqcenario is not null
and a.formula is not null