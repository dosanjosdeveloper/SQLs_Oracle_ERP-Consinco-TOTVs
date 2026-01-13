 Select
 TO_CHAR (a.dtalancamento,'DD/MM/YYYY') as ENTRADA,
 TO_CHAR (a.dtaemissao,'DD/MM/YYYY') as EMISSAO,
 e.nomereduzido as EMPRESA,
 DECODE (p.fisicajuridica,'J','JURIDICA','F','FISICA') AS FISICA_JURIDICA, 
 
 CASE p.fisicajuridica
   WHEN 'J' THEN LPAD(p.nrocgccpf,12,0)||''||LPAD(p.digcgccpf,2,0)
   WHEN 'F' THEN LPAD(p.nrocgccpf,9,0)||''||LPAD(p.digcgccpf,2,0)
 END AS CPF_CNPJ,
  p.nrocgccpf,
   p.digcgccpf,
 a.seqpessoa as COD,
 p.nomerazao as RAZAO_SOCIAL,
 a.cgo||' - '||c.descricao as CGO,
 Decode (a.entradasaida,'E','ENTRADA','S','SAIDA') as TIPO,
 a.nronota as NOTA,
 TO_CHAR (a.vlrtotal,'FM999G999G990D00','nls_numeric_characters='',.''') as VALOR,
 a.observacao

From RF_Notamestre a, ge_pessoa p, max_codgeraloper c, max_empresa e
 Where a.seqpessoa = p.seqpessoa
   and a.cgo = c.codgeraloper
   and a.nroempresa = e.nroempresa
   and a.entradasaida = 'E'  
  --and a.seqpessoa = :NR1
   and a.dtalancamento between '01jan2020' and '31dec2020'
   and c.codgeraloper in (123,124,128,129,400)
