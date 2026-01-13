select to_char(ctb.dtacontabiliza,'DD/MM/YYYY') DIA,ctb.ctacontabil CONTA_CONTAB,'R$: '||ctb.valor VALOR, ctb.codespecie ESPECIE ,ctb.nroempresa EMPRESA, ctb.filial FILIAL ,ctb.Historico HISTORICO, ctb.codoperacao, decode(ctb.debcred,'C','CREDITO','D','DEBITO') CRED_DEB
from fi_contabilizacao ctb 
where ctb.ctacontabil IN  ( 33010104, 11010201, 43010113, 11020101, 32010106, 33010103, 91010108, 11020103,
33010101, 45010102, 11020198, 91010102, 91010116, 11020102, 11070301, 21010811, 91010101, 91010117, 21010101, 11010101, 11020104 )
and ctb.dtacontabiliza 
between to_date('01/03/2022','DD/MM/YYYY') 
and to_date('31/03/2022','DD/MM/YYYY')


select sum(ctb.valor) 
from fi_contabilizacao ctb 
where  ctb.ctacontabil IN  ( 33010104, 11010201, 43010113, 11020101, 32010106, 33010103, 91010108, 11020103,
33010101, 45010102, 11020198, 91010102, 91010116, 11020102, 11070301, 21010811, 91010101, 91010117, 21010101, 11010101, 11020104 )
and 
ctb.dtacontabiliza 
between to_date('01/03/2022','DD/MM/YYYY') 
and to_date('31/03/2022','DD/MM/YYYY')

/*
********************************* ATÉ AQUI O NEGOCIO FUNCIONA *******************************************

select to_char(ctb.dtacontabiliza,'DD/MM/YYYY') DIA,ctb.ctacontabil CONTA_CONTAB,'R$: '||ctb.valor VALOR, ctb.codespecie ESPECIE ,ctb.nroempresa EMPRESA, ctb.filial FILIAL ,ctb.Historico HISTORICO, ctb.codoperacao, decode(ctb.debcred,'C','CREDITO','D','DEBITO') CRED_DEB
from fi_contabilizacao ctb 
where ctb.ctacontabil IN (33010104,21010203)
and ctb.dtacontabiliza 
between to_date('01/03/2022','DD/MM/YYYY') 
and to_date('31/03/2022','DD/MM/YYYY')

select * from fi_contabilizacao ctb where ctb.dtacontabiliza between to_date('01/03/2022','DD/MM/YYYY') and to_date('31/03/2022','DD/MM/YYYY') and ctb.ctacontabil IN (33010104,21010203)
select * from fi_titulo a where a.nrodocumento in  (1032022,10320221,123456,222,322,1503,131032022,131032022,310320221)

select * from fi_titulo a where a.nrodocumento <> a.nrotitulo order by a.dtaemissao

************************* Montado a Query com Este ********************************
select (select ctv.CONTA||' - ('||ctv.NROREDCONTA||') - '||ctv.DESCRICAO as CONTA_DETAILS from ctv_planoconta ctv where ctv.conta = ctb.ctacontabil) as CONTA_DETAILS, to_char(ctb.dtacontabiliza,'DD/MM/YYYY') DTA_CONTABILIZA, a.nrotitulo ||'-/'|| a.nroparcela as TITU_PARCEL, (select p.seqpessoa||'-'||p.nomerazao from ge_pessoa p where p.seqpessoa = a.seqpessoa) PESSOA,
(select e.nomereduzido from ge_empresa e where e.nroempresa = a.nroempresa) EMPRESA,'R$ '|| a.vlroriginal VALOR, a.codespecie,top.codoperacao||'-'||top.observacao as OPERACAO, ctb.debcred-- a.obrigdireito
from fi_titulo a 
JOIN fi_titoperacao top on a.seqtitulo = top.seqtitulo
JOIN fi_contabilizacao ctb on top.nroprocesso = ctb.nroprocesso
where  top.dtacontabiliza between to_date('01/03/2022','DD/MM/YYYY') and to_date('01/03/2022','DD/MM/YYYY') 
and ctb.ctacontabil IN  ( 33010104, 11010201, 43010113, 11020101, 32010106, 33010103, 91010108, 11020103,
33010101, 45010102, 11020198, 91010102, 91010116, 11020102, 11070301, 21010811, 91010101, 91010117, 21010101, 11010101, 11020104 ) 
order by ctb.ctacontabil, ctb.dtacontabiliza
************************** Fim de Instrução  *************************** 
select * from fi_titulo e where e.nroempresa = '1' and e.codespecie = 'REALUG' and e.dtaemissao between to_date('01/03/2022','DD/MM/YYYY') and to_date('31/03/2022','DD/MM/YYYY') 
select sum(e.vlroriginal) from fi_titulo e where e.nroempresa = '1' and e.codespecie = 'REALUG' and e.dtaemissao between to_date('01/03/2022','DD/MM/YYYY') and to_date('31/03/2022','DD/MM/YYYY')
select * from fi_parametroctb
select * from fi_ctacorrente
select * from fi_contabilizacao c where c.filial = 1  and c.dtacontabiliza between to_date('01/03/2022','DD/MM/YYYY') and to_date('31/03/2022','DD/MM/YYYY') and c.debcred = 'C' and c.ctacontabil IN ('33010104') 
select * from fi_operacao
select * from fi_titoperacao where seqtitulo = '403155638'
--select* from fi_especie
and c.codespecie = 'REALUG'

-- and top.codoperacao = 16
 -- select ctv.CONTA||' - ('||ctv.NROREDCONTA||') - '||ctv.DESCRICAO as CONTA_DETAILS from ctv_planoconta ctv where conta IN ( 33010104, 11010201, 43010113, 11020101, 32010106, 33010103, 91010108, 11020103, 33010101, 45010102, 11020198, 91010102, 91010116, 11020102, 11070301, 21010811, 91010101, 91010117, 21010101, 11010101, 11020104 )

*/



