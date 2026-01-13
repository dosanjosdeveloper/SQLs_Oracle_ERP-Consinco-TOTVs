-- Busca Cliente Pessoa -- 
Select NOMERAZAO From GE_PESSOA Where SEQPESSOA = 3029

-- Busca Cliente para Forma de Pagamento Ativa Vinculada --
Select A.NROFORMAPAGTO ||  ' - ' || A.FORMAPAGTOREDUZ From MRL_FORMAPAGTO A , MRL_CLIENTECREDITO B  Where A.NROFORMAPAGTO = B.NROFORMAPAGTO And B.SEQPESSOA  = 3029 And A.STATUSFORMAPAGTO = 'A' and A.Nroformapagto = 146  

-- Busca Limite Cliente, Status do Crédito para a Forma de Pagamento Escolhida --
Select VLRLIMITECREDITO , STATUSCREDITO, VLRLIMITEPARCCREDITO From MRL_CLIENTECREDITO Where SEQPESSOA = 3029 And NROFORMAPAGTO in (72,146)

Select VLRLIMITECREDITO , STATUSCREDITO, VLRLIMITEPARCCREDITO From MRL_CLIENTECREDITO Where SEQPESSOA = 3029 And NROFORMAPAGTO in (72,146)

-- Busca Forma de Pagamento Escolhida Pela Descrição e Se Ativo --
Select  NROFORMAPAGTO, ESPECIEFORMAPAGTO, INDRESTRVISUALIZACAOLIMITE  From  MRL_FORMAPAGTO Where NROFORMAPAGTO ||  ' - ' || FORMAPAGTOREDUZ = '146 - ALIM FUNC SUPER'  And   STATUSFORMAPAGTO = 'A'

Select NROFORMAPAGTO , ESPECIEFORMAPAGTO, VLRLIMITEPADRAO, VLRLIMITEPARCPADRAO, INDRESTRVISUALIZACAOLIMITE From MRL_FORMAPAGTO Where NROFORMAPAGTO ||  ' - ' || FORMAPAGTOREDUZ  = '146 - ALIM FUNC SUPER'And STATUSFORMAPAGTO 	= 'A'

-- Busca Periodos de Convênios Cadastrados e Ativos --
select MRL_CONVENIOPERIOD.DTAINICIOPERIODO, MRL_CONVENIOPERIOD.DTAFIMPERIODO, MRL_CONVENIOPERIOD.DTAVENCTOPERIODO, MRL_CONVENIOPERIOD.DTAENCERRAPERIODO, NVL(MRL_CONVENIOPERIOD.STATUSCONVENIO, 'A')                                                                                                                                                                                                                                                
from MRL_CONVENIOPERIOD 
where NROFORMAPAGTO =146
order by DTAINICIOPERIODO Desc 

-- Função Que Retorna o Saldo Atual do Cliente Para Saldo Acumulado--
Select 	fmrl_SaldoConvenioAcumulado(3029, 146) From DUAL

-- Busca Compras para o Periodo Informado --
select MRL_CONVENIOCOMPRA.NROFORMAPAGTO, MRL_CONVENIOCOMPRA.SEQPESSOA, MRL_CONVENIOCOMPRA.SEQCONVENIOCOMPRA, MRL_CONVENIOCOMPRA.NROEMPRESA, NVL(DTABASECOBRANCA, DTACOMPRA), MRL_CONVENIOCOMPRA.DTACOMPRA, MRL_CONVENIOCOMPRA.DOCTOFISCAL, MRL_CONVENIOCOMPRA.VLRCOMPRA, MRL_CONVENIOCOMPRA.CHEQUEBANCO, MRL_CONVENIOCOMPRA.CHEQUEAGENCIA, MRL_CONVENIOCOMPRA.CHEQUECONTA, MRL_CONVENIOCOMPRA.CHEQUENUMERO, MRL_CONVENIOCOMPRA.CHEQUEVENCTO, MRL_CONVENIOCOMPRA.CHEQUEDTABAIXA, MRL_CONVENIOCOMPRA.CODIGOORCAMENTO, MRL_CONVENIOCOMPRA.NUMERODF, MRL_CONVENIOCOMPRA.seriedf, MRL_CONVENIOCOMPRA.NROSERIEECF, NROSERIEECF || to_char(dtacompra, 'yymmdd') , MRL_CONVENIOCOMPRA.NROTITULO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
from MRL_CONVENIOCOMPRA 
where NROFORMAPAGTO 	= 146
AND 	SEQPESSOA 	= 3029 AND 	NVL(DTABASECOBRANCA, DTACOMPRA) BETWEEN to_date('01/05/2023','DD/MM/YYYY') AND to_date('30/05/2023','DD/MM/YYYY')AND	DTHRCANCELAMENTO IS NULL
order by NVL(DTABASECOBRANCA, DTACOMPRA)  Desc 

select * from mrl_clientecartao where nroformapagto = 146 and nrocartao like '%1375288%'
