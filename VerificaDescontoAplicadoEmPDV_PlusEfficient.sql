
-- tb_doctoitem (NroEmpresa, NroCheckOut, SeqDocto, SeqItem,NroSegmento, DtaHorEmissao,SeqProduto,Codaceasso,Quantyidade,VlrUnitario,VlrDesconto,VlrTotal)
-- tb_doctoacrescdesctocupom (NroEmpresa, NroCheckOut, SeqDocto, SeqAcrescDescto)
-- tb_doctoacrescdesctoitem (NroEmpresa, NroCheckOut, SeqDocto,SeqItem,SeqAcrescDescto)
-- tb_doctoacrescdescto (NroEmpresa, NroCheckOut, SeqDocto, SeqAcrescDescto, SeqTipoAcrescDescto, DtaHorEmissao, Valor,) 
-- tb_tb_tipoacrescdescto (SeqTipoAcrescDescto, TipoAcrescDescto-Nome)
-- tb_logsegacrescdesctopdv (NroEmpresa, NroCheckOut, SeqLogSegPDV, SeqAcresxDescto)
-- tb_logsegurancapdv (NroEmpresa, NroCheckOut, SeqLogSegPDV, Metodo, SeqUsuario)
-- ge_usuario (SeqUsuario, NomeUsuario)
-- select * from tb_doctocupom (NroEmpresa, NroCheckOut, SeqDocto,SeqPessoa, )

Select
 a.nroempresa,
 a.nrocheckout,
 a.seqlogsegpdv,
 a.sequsuario,
 u.nome,
 b.serie,
 b.coo,
 c.seqdocto,
 b.dtamovimento
 
From tb_logsegurancapdv a, tb_logsegdoctopdv b,tb_docto c,
     consinco.ge_usuario u
     
Where a.nroempresa = b.nroempresa
  and a.nrocheckout = b.nrocheckout
  and a.seqlogsegpdv = b.seqlogsegpdv
  and u.sequsuario = a.sequsuario
  and c.nroempresa = a.nroempresa
  and c.nrocheckout = a.nrocheckout
  and c.dtamovimento = c.dtamovimento
  and c.coo = b.coo 
  --------
  
  
  and a.metodo like '%DescontoCupom%' 
  
  and a.nroempresa = 1
  and a.nrocheckout = 8
  and b.dtamovimento >= '01-aug-24'
