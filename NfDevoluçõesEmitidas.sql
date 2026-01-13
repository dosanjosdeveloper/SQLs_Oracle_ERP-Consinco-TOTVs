-- select * from Mlfv_Basenfe where dtaemissao between  to_date('01/03/2020','dd/mm/yyyy') and to_date('31/03/2020','dd/mm/yyyy') and tipnotafiscal = 'E' and codgeraloper in ('542','537') and nroempresa = 13 order by numeronf

 select * from MLF_NOTAFISCAL where  nroempresa = 13 and dtaemissao between  to_date('01/03/2020','dd/mm/yyyy') and to_date('31/03/2020','dd/mm/yyyy') and tipnotafiscal = 'E'
 and codgeraloper in ('542','537')

SELECT b.numeronf, a.seqpessoa||' - '|| a.nomerazao AS pessoa, b.usuemitiu, a.vlrtotal as VALOR_TOTAL,b.observacao,to_char(b.dtaemissao,'DD/MM/YYYY') AS EMISSAO, 
to_char(b.dtasaida,'DD/MM/YYYY') AS SAIDA,
to_char(b.dtarecebimento,'DD/MM/YYYY') AS RECEBEU, b.uforigemdestino AS UFDESTINO, b.nfreferencianro AS REFERENCIA FROM  MLF_NOTAFISCAL b 
JOIN MLFV_BASENFE a ON a.numeronf = b.numeronf
WHERE b.dtaemissao BETWEEN to_date('01/03/2020','dd/mm/yyyy') and to_date('31/03/2020','dd/mm/yyyy') 
AND b.codgeraloper IN ('542','537') AND a.tipnotafiscal = 'E' AND b.nroempresa = '13' order by b.dtaemissao,b.numeronf

