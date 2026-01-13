select * from mrl_clientecredito where seqpessoa in (25188,21220)
-- select sysdate from dual
-- select * from mad_clienteend
-- select * from mrl_clienteseg
-- select * from mad_tabvenda
-- select * from mad_condicaopagto
--select * from mad_condicaocliente
-- select * from mrl_formapagto

 select * from mad_clienterep n where n.nrorepresentante = 13


/*
-- FUNCIONAL
 INSERT INTO 
 mrl_clientecredito 
 (seqpessoa,nroformapagto,vlrlimitecredito,statuscredito,empultcadastro,indprincipal,indreplicacao,nrobaseexportacao,dtaalteracao,usualteracao,vlrlimiteparccredito)
 ( SELECT n.seqpessoa,7 FORMA DE PAGAMENTO,0.00,'L',1,'N','S',SEQ_CARGA,SYSDATE,'TI_RAFAEL',0.00 FROM mad_clienterep n WHERE n.nrorepresentante = 13  ); -- and n.seqpessoa = 25188
 
*/


/*
 INSERT INTO 
 mrl_clientecredito 
 (seqpessoa,nroformapagto,vlrlimitecredito,statuscredito,empultcadastro,indprincipal,
 indreplicacao,nrobaseexportacao,dtaalteracao,usualteracao,vlrlimiteparccredito) 
 VALUES
 (25188,6(TERA QUE REPETIR 2X),0.00,'L',1,'N','S',VAI NAO VAI???,SYSDATE,'TI_RAFAEL',0.00 )
 ( SELECT n.seqpessoa FROM mad_clienterep n WHERE n.nrorepresentante = 13);
 
*/
