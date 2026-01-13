select * from mrl_clientecredito 
select DATEADD( year ,50, sysdate ) from dual
select * from mrl_clientecartao c where c.seqpessoatitular=25430
select * from ge_pessoa p where p.seqpessoa=25430


select count(*) from mrl_clientecredito c 
where c.nroformapagto='72' and c.statuscredito='L';


select count(*) from mrl_clientecredito c 
where c.nroformapagto='146' and c.statuscredito='L';
/*
****************** Gerar/Inserir Código Cartão Clientes em Forma de Pagamento *******************
INSERT INTO 
mrl_clientecartao a
(a.NROCARTAO,a.NROFORMAPAGTO,a.SEQPESSOATITULAR,a.seqpessoaportador,a.indemissaocartao,a.statuscartao, a.empultcadastro, a.indreplicacao,a.dtageracao,a.usugeracao,a.dtavalidade,
a.indcompoerenda)  VALUES ((SELECT FMRL_GERANROCARTAO('12')
	FROM   DUAL), 146,15213,15213,'N','A','1','S',SYSDATE,'TI_RAFAEL',to_date('30/12/2060','DD/MM/YYYY'),'N' )
/*


****************** Inserir Clientes em Forma de Pagamento *******************
 INSERT INTO 
 mrl_clientecredito 
 (seqpessoa,nroformapagto,vlrlimitecredito,statuscredito,empultcadastro,indprincipal,indreplicacao,dtaalteracao,usualteracao,vlrlimiteparccredito) values
(15213,146,0.00,'L',1,'N','S',SYSDATE,'TI_RAFAEL',0.00)


 Insert into mrl_clientecredito (seqpessoa,nroformapagto,vlrlimitecredito,statuscredito,empultcadastro,indprincipal,indreplicacao,dtaalteracao,usualteracao,vlrlimiteparccredito) values 
 (8263,146,0.00,'L',1,'N','S',SYSDATE,'TI_MICHEL',0.00);

******* Consulta Clientes BaseAnalise - SO CAPRICHO MEU MESMO *********
Select  p.seqpessoa,146,0.00,'L',1,'N','S',686765624,SYSDATE,'TI_RAFAEL',0.00
 
From ge_pessoa p, mad_clienterep c, mad_representante r,
     mad_clienteend ce, mad_praca mp, mad_rota mr, mrl_cliente a
     
Where p.seqpessoa = c.seqpessoa
  and c.nrorepresentante = r.nrorepresentante
  and ce.seqpessoa = p.seqpessoa
  and ce.seqpraca = mp.seqpraca
  and mp.seqrota = mr.seqrota
  and a.seqpessoa = p.seqpessoa
  
  and c.nrorepresentante  = 13
  and a.statuscliente = 'A'
  and p.seqpessoa not in (7635,9609,16623,16701,
17365,18075,21220,22945,
24928,25188,25997,26014,
26021,26036,26044,26046,
26061,26062,26063,26070,
26094,26102,26106,26109,
26110,26112,26115,26118,
26127,26147,26159,26164,
26165,26166)
*/

