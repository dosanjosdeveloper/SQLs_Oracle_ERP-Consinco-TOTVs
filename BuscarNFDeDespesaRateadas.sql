Select
 TO_CHAR (a.dtaentrada,'DD/MM/YYYY') as DATA,
 a.nronota,
 a.seqpessoa,
 e.nomerazao,
 a.observacao,
 a.codhistorico as Natureza,
 c.descricao,
 TO_CHAR (a.valor,'FM999G999G990D00','nls_numeric_characters='',.''') as vlr_total_nf,
 TO_CHAR (v.valorliq,'FM999G999G990D00','nls_numeric_characters='',.''') as VLR_LIQ_RAT,
 
 (select ge.nomereduzido from ge_empresa ge where ge.nroempresa = v.nroempresa)
   as EMP_DESPESA,  
 a.nroempresa,
 d.fantasia as EMP_LANCTO

From or_nfdespesa a 
 join ge_pessoa e on a.seqpessoa = e.seqpessoa 
 join ge_empresa d on a.nroempresa = d.nroempresa 
 join rf_paramnatnfdesp c on a.codhistorico = c.codhistorico
 join or_nfvencimento v on a.seqnota = v.seqnota

Where a.dtaentrada between to_date('01/03/2023','DD/MM/YYYY') and to_date('31/03/2023','DD/MM/YYYY')
--  and c.descricao like :LS1
and c.codhistorico = 5

Order by c.descricao, a.dtaentrada

--- select * from or_nfvencimento where conta = 42010106 and seqnota = 127382

-- select * from or_nfdespesa where nronota = 4605 and seqpessoa = 7729
-- or_centrocusto
-- select * from rf_paramnatnfdesp where descricao = 'Internet'
