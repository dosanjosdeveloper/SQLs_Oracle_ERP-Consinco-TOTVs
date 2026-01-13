select a.abertoquitado ,a.seqpessoa ||' - '||(select x.nomerazao from ge_pessoa x where x.seqpessoa = a.seqpessoa) PESSOA_RAZAO, a.nrotitulo TITULO,
(select w.nomereduzido from ge_empresa w where w.nroempresa = a.nroempresa) EMPRESA, 'R$ '|| a.vlroriginal VRL_ORIGINAL, 'R$ '|| a.vlrpago VLR_PAGO, b.usualteracao USER_ATUACAO, to_char(b.dtahora,'DD/MM/YYYY HH:MM:SS') 
DIA_HORA from fi_titulo a join fi_movocor b on a.seqtitulo = b.seqidentifica where 
a.nroempresa = '13' and  a.seqpessoa = '1811' and
a.dtaemissao 
between to_date('01/01/2022','DD/MM/YYYY') and to_date('31/03/2022','DD/MM/YYYY')
 order by a.seqpessoa,a.nroempresa,a.nrotitulo, b.dtahora
 
 /*
 select a.abertoquitado ,a.seqpessoa ||' - '||(select x.nomerazao from ge_pessoa x where x.seqpessoa = a.seqpessoa) PESSOA_RAZAO, a.nrotitulo TITULO,
(select w.nomereduzido from ge_empresa w where w.nroempresa = a.nroempresa) EMPRESA, 'R$ '|| a.vlroriginal VRL_ORIGINAL, 'R$ '|| a.vlrpago VLR_PAGO, b.codocorrencia ||' - '|| 
(select y.descricao from fi_ocrfinanc y where y.codocorrencia = b.codocorrencia) 
TIPOS_OCORRENCIAS, b.observacao, b.usualteracao USER_ATUACAO, to_char(b.dtahora,'DD/MM/YYYY HH:MM:SS') 
DIA_HORA from fi_titulo a join fi_movocor b on a.seqtitulo = b.seqidentifica where 
a.nroempresa = '13' and a.abertoquitado = 'A' and
a.dtaemissao 
between to_date('01/01/2022','DD/MM/YYYY') and to_date('31/03/2022','DD/MM/YYYY')
 order by a.seqpessoa,a.nroempresa,a.nrotitulo, b.dtahora
 */
