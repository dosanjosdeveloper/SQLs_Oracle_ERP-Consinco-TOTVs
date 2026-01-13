SELECT a.seqacrescdescto, a.nroempresa as NRO_LOJA , a.nrocheckout as NRO_PDV,a.seqdocto,to_char(a.dtahoremissao,'DD/MM/YYYY') DTA_OCORRENCIA, 'R$ '|| to_char((a.valor * (-1)),'FM999G999G990D00','nls_numeric_characters='',.''') as VLR_DESCONTO, 
        'R$ '||(SELECT TO_CHAR(ROUND((ABS(SUM(t.quantidade*t.vlrunitario))),2),'FM999G999G990D00','nls_numeric_characters='',.''') FROM consincomonitor.tb_doctoitem t WHERE t.status = 'V' AND t.seqdocto = a.seqdocto)as VLR_TOTAL_DOCTO,
        (SELECT to_char(ROUND((ABS(a.valor)/SUM(z.quantidade*z.vlrunitario))* 100,2),'FM999G999G990D00','nls_numeric_characters='',.''') FROM consincomonitor.tb_doctoitem z WHERE z.status = 'V' AND z.seqdocto = a.seqdocto) ||' %' as DESCTO_PERCENTUAL,
/*
           (SELECT g.nome FROM consincomonitor.tb_logsegacrescdesctopdv b
           JOIN consincomonitor.tb_logsegurancapdv e ON e.seqlogsegpdv = b.seqlogsegpdv
           JOIN consinco.ge_usuario g on g.sequsuario = e.sequsuario
             where b.seqacrescdescto = a.seqacrescdescto
             and e.seqlogsegpdv = b.seqlogsegpdv
             and e.nroempresa = a.nroempresa
             and e.nrocheckout = a.nrocheckout  ) as QUEM_APLICOU,
  */           
         a.seqtipoacrescdescto||' - '|| d.tipoacrescdescto as TIPO_DESCTO
   FROM consincomonitor.tb_doctoacrescdescto a 
  JOIN consincomonitor.tb_tipoacrescdescto d ON a.seqtipoacrescdescto = d.seqtipoacrescdescto
     WHERE 
        a.seqtipoacrescdescto IN (1,2)
        AND trunc(a.dtahoremissao) BETWEEN to_date('01/07/2024','DD/MM/YYYY') AND to_date('06/08/2024','DD/MM/YYYY')
        AND a.nroempresa in (1,2,3,5,6,7,9,10,13,15,21) --and a.nrocheckout = 16; 

     /*
 select * from tb_logsegurancapdv where nroempresa = 1 and nrocheckout = 8 AND seqlogsegpdv in ('441398','441425') -- trunc(dtahoremissao) BETWEEN to_date('01/08/2024','DD/MM/YYYY') AND to_date('01/08/2024','DD/MM/YYYY')
  select * from tb_logsegacrescdesctopdv  where nroempresa = 1 and nrocheckout = 8 AND seqacrescdescto in ('22442','22452')

  select * from tb_logsegdoctopdv
   select * from tb_logpdv where metodo like '%Cupom%'
--     select * from tb_doctocupom
--     select * from tb_doctoitem
--     select * from tb_doctoacrescdesctoitem
--     select * from tb_doctoacrescdesctocupom        
--     select * from tb_doctoacrescdescto        
--     select * from tb_totdoctopagto        
--     select * from tb_docto


*/
