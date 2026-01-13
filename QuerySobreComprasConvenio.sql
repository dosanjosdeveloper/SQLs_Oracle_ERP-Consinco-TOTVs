--- QUERY FINALIZADA ---

select p.seqpessoa||'-'||p.nomerazao CLIENTE, 
       (select 'R$ '||l.vlrlimitecredito 
       from MRL_CLIENTECREDITO l 
       where l.seqpessoa in (13752) 
       and l.nroformapagto = 126) LIMIT_CLIENT,
           (select 'R$ '||sum(c.vlrcompra)  
           from mrl_conveniocompra c
           where c.seqpessoa=13752 and c.nroformapagto = 126 
           and c.dtacompra 
           BETWEEN to_date('03/06/2022','DD/MM/YYYY') 
           AND to_date('02/07/2022','DD/MM/YYYY')) as UTILIZADO
from ge_pessoa p where p.seqpessoa = 13752

-- ******************************************************* --
-- ******************************************************* --
-- ******************************************************* --

select MRL_CONVENIOCOMPRA.NROFORMAPAGTO, MRL_CONVENIOCOMPRA.SEQPESSOA, MRL_CONVENIOCOMPRA.SEQCONVENIOCOMPRA, MRL_CONVENIOCOMPRA.NROEMPRESA, NVL(DTABASECOBRANCA, DTACOMPRA), MRL_CONVENIOCOMPRA.DTACOMPRA, MRL_CONVENIOCOMPRA.DOCTOFISCAL, MRL_CONVENIOCOMPRA.VLRCOMPRA, MRL_CONVENIOCOMPRA.CHEQUEBANCO, MRL_CONVENIOCOMPRA.CHEQUEAGENCIA, MRL_CONVENIOCOMPRA.CHEQUECONTA, MRL_CONVENIOCOMPRA.CHEQUENUMERO, MRL_CONVENIOCOMPRA.CHEQUEVENCTO, MRL_CONVENIOCOMPRA.CHEQUEDTABAIXA, MRL_CONVENIOCOMPRA.CODIGOORCAMENTO, MRL_CONVENIOCOMPRA.NUMERODF, MRL_CONVENIOCOMPRA.seriedf, MRL_CONVENIOCOMPRA.NROSERIEECF, NROSERIEECF || to_char(dtacompra, 'yymmdd') , MRL_CONVENIOCOMPRA.NROTITULO                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
from MRL_CONVENIOCOMPRA where NROFORMAPAGTO   =126                               
AND   SEQPESSOA   =13752                                  
AND   NVL(DTABASECOBRANCA, DTACOMPRA) BETWEEN to_date('03/06/2022','DD/MM/YYYY') AND to_date('02/07/2022','DD/MM/YYYY')
AND  DTHRCANCELAMENTO IS NULL 
order by NVL(DTABASECOBRANCA, DTACOMPRA)  Desc
/*****************************************************/
select  sum(MRL_CONVENIOCOMPRA.VLRCOMPRA)
from MRL_CONVENIOCOMPRA where NROFORMAPAGTO   =126                               
AND   SEQPESSOA   =13752                                  
AND   NVL(DTABASECOBRANCA, DTACOMPRA) BETWEEN to_date('03/06/2022','DD/MM/YYYY') AND to_date('02/07/2022','DD/MM/YYYY')
AND  DTHRCANCELAMENTO IS NULL 
order by NVL(DTABASECOBRANCA, DTACOMPRA)  Desc
/********************************************************/
Select 	Sum (VLRCOMPRA) 
From 	MRL_CONVENIOCOMPRA 
Where 	NROFORMAPAGTO =126                                  
And 	SEQPESSOA =13752                           
And 	NVL(DTABASECOBRANCA, DTACOMPRA) BETWEEN to_date('03/06/2022','DD/MM/YYYY') AND to_date('02/07/2022','DD/MM/YYYY')                                     
And 	DTHRCANCELAMENTO IS NULL 

-- select a.nroformapagto||'-'||a.formapagtoreduz from mrl_formapagto a, mrl_clientecredito b where a.nroformapagto = b.nroformapagto and b.seqpessoa = 13752 and b.nroformapagto = 126
-- Select VLRLIMITECREDITO , STATUSCREDITO, VLRLIMITEPARCCREDITO From MRL_CLIENTECREDITO Where SEQPESSOA =13752 And NROFORMAPAGTO =126


--- TABELAM CONVENIO PERIODO ---
select * from MRL_CONVENIOPERIOD where NROFORMAPAGTO =126 and statusconvenio is null
select max(seqconvenioperiod) from MRL_CONVENIOPERIOD
select MRL_CONVENIOPERIOD.DTAINICIOPERIODO, MRL_CONVENIOPERIOD.DTAFIMPERIODO, MRL_CONVENIOPERIOD.DTAVENCTOPERIODO, MRL_CONVENIOPERIOD.DTAENCERRAPERIODO, NVL(MRL_CONVENIOPERIOD.STATUSCONVENIO, 'A')                                                                                               
from MRL_CONVENIOPERIOD 
where NROFORMAPAGTO =126
