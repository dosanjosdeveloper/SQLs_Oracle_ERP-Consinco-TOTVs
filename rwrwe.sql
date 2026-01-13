Select
 d.nomereduzido as EMPRESA,
 TO_CHAR (a.dtaentrada,'DD/MM/YYYY') as DATA,
 a.nronota as NOTA,
 a.seqpessoa,
 e.nomerazao as RAZAO,
 Upper(c.descricao)||' - COD '||a.codhistorico as Natureza,
 Upper (a.observacao) as OBSERVACAO,
 TO_CHAR (a.valor,'FM999G999G990D00','nls_numeric_characters='',.''') as VALOR

From or_nfdespesa a 
 join ge_pessoa e on a.seqpessoa = e.seqpessoa 
 join ge_empresa d on a.nroempresa = d.nroempresa 
 join rf_paramnatnfdesp c on a.codhistorico = c.codhistorico

Where d.nroempresa = 1
  and a.dtaentrada between to_date('','') and :DT2

Order by a.dtaentrada, e.nomerazao
