SELECT 
   d.nroempresa EMPRESA, 
   d.nrocheckout PDV, 
   d.seqdocto DOCUMENTO,
   c.dtahoremissao,
   sum (p.vlrunitario * p.quantidade) TOTAL_BRUTO,
   sum (p.vlrdesconto) TOTAL_DESCONTO_DIVERSOS, 
   sum(p.vlrtotal) TOTAL_PAGO,
     d.seqpromsurpresa||'-'||s.descricao COD_BRINDE_UTILIZADO
     
     FROM 
       tb_doctobrinde d,
       tb_doctoitem  p,
       tb_docto c,
       tb_promsurpresa s
         where 
             d.seqdocto = p.seqdocto
         and d.nroempresa = p.nroempresa
         and d.nrocheckout = p.nrocheckout
         and d.seqdocto = c.seqdocto
         and d.nroempresa = c.nroempresa
         and d.nrocheckout = c.nrocheckout
         and d.seqpromsurpresa = s.seqpromsurpresa
         and d.seqpromsurpresa >= 501 
         and p.vlrtotal > 0.0
--         and s.descricao like '%Prêmio%'
--         and  trunc(c.dtahoremissao) >= '24sep2025'
          and trunc(c.dtahoremissao) >= '06oct2025'
     group by d.seqdocto, d.nroempresa, d.nrocheckout, d.seqpromsurpresa, s.descricao, c.dtahoremissao
order by C.DTAHOREMISSAO
