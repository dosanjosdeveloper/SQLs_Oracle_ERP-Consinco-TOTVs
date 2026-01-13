select LPAD(t.seqdocto,8,0) as SEQDOTCO, -- 156 rows
       t.nroempresa,
--       t.seqpromsurpresa,
       CASE
         WHEN a.descricao LIKE '%50,00%' THEN '50.00'
         -- Ajuste por Erro ao tentar reutilizar o mesmo Brinde Corrigindo o valor e a quantidade --
         WHEN a.descricao LIKE '%200,00%' AND TRUNC(b.dtahoremissao) = '10sep2024' AND t.nroempresa in (2,3,5,7,21,8,10,6,9,15) THEN '50.00'
         WHEN a.descricao LIKE '%100,00%' AND TRUNC(b.dtahoremissao) = '10sep2024' AND t.nroempresa in (6,7,10,15) THEN '50.00'
         WHEN a.descricao LIKE '%200,00%' AND TRUNC(b.dtahoremissao) = '10sep2024' AND t.nroempresa in (1) THEN '100.00'
         -- Ajuste por Erro ao tentar reutilizar o mesmo Brinde Corrigindo o valor e a quantidade --
         WHEN a.descricao LIKE '%200,00%' AND TRUNC(b.dtahoremissao) = '11sep2024' AND t.nroempresa in (1,2,3,5,8) THEN '100.00'
         WHEN a.descricao LIKE '%200,00%' AND TRUNC(b.dtahoremissao) = '11sep2024' AND t.nroempresa in (9,15) THEN '50.00'
         WHEN a.descricao LIKE '%100,00%' AND TRUNC(b.dtahoremissao) = '11sep2024' AND t.nroempresa in (6,15) THEN '50.00'
         -- Ajuste por Erro ao tentar reutilizar o mesmo Brinde Corrigindo o valor e a quantidade --
         WHEN a.descricao LIKE '%200,00%' AND TRUNC(b.dtahoremissao) = '12sep2024' THEN '100.00'
         -- Ajuste por Erro ao tentar reutilizar o mesmo Brinde Corrigindo o valor e a quantidade --
         -- Problema quando sorteio no caixa contemplado não foi consumido


         WHEN a.descricao LIKE '%100,00%' THEN '100.00'
         WHEN a.descricao LIKE '%200,00%' THEN '200.00'
         WHEN a.descricao LIKE '%500,00%' THEN '500.00'
       END valor_utilizado,
       p.descricao,
       a.seqbrinde,
       a.descricao, 
       t.nrocheckout,
       b.dtahoremissao 
from tb_doctobrinde t , tb_docto b, tb_promsurpresa p , tb_promsurpresaitem i, tb_brinde a
   where t.seqdocto = b.seqdocto
    and t.nroempresa = b.nroempresa
    and t.nrocheckout = b.nrocheckout
    and t.seqpromsurpresa = p.seqpromsurpresa
    and t.seqpromsurpresa = i.seqpromsurpresa
    and i.seqbrinde = a.seqbrinde
--    and t.nroempresa in (1,2,3,5,6,7,8,9,10,15,21)
    and trunc(b.dtahoremissao) between  '11sep2024' and '11sep2024'
   order by t.nroempresa, b.dtahoremissao;
  


--   SELECT * FROM TB_DOCTOBRINDE -- SEQPROMSURPRESA, SEQDOCTO,
--   SELECT * FROM TB_DOCTO -- SEQDOCTO
--   SELECT * FROM TB_PROMSURPRESA -- SEQPROMOSUPRESA, 
--   SELECT * FROM TB_BRINDE -- SEQBRINDE,
--   SELECT * FROM TB_PROMSURPRESAITEM -- SEQPROMSURPRESA, SEQBRINDE
--   SELECT * FROM TB_PROMSURPRESAPERIODO -- SEQPROMOSURPRESA
   
   

  

