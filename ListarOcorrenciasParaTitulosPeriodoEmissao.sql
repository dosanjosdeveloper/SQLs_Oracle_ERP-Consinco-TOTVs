select * from fi_titulo

select a.codespecie, a.tipoespecie, a.seqpessoa, a.vlroriginal, a.vlrnominal, a.vlrpago from fi_titulo a where a.codespecie 
IN ('CHEQIM','CHEQUE','CHPRAZ','CHQDEV','CHQDIM','CHQIM')
and a.dtaemissao between to_date('01/01/2021','DD/MM/YYYY') and to_date('31/12/2021','DD/MM/YYYY')
-- select * from fi_titulo where codespecie = 'CHEQUE' ||abertoquitado not in ('Q',
-- select * from fi_titoperacao where seqtitulo = '388365044'
-- select * from fi_operacao
-- select * from fi_titulo a where a.nrotitulo = '75802' and a.seqpessoa = '18620' -- a.seqtitulo = '388365044'
-- select * from fi_movocor where seqpessoa = '18620' and seqidentifica =  '388365044'
-- select * from fi_ocrfinanc
/*
select a.seqpessoa ||' - '||(select x.nomerazao from ge_pessoa x where x.seqpessoa = a.seqpessoa) PESSOA_RAZAO, 
a.nrotitulo TITULO,
(select w.nomereduzido from ge_empresa w where w.nroempresa = a.nroempresa) EMPRESA, 'R$ '|| a.vlroriginal VRL_ORIGINAL, 'R$ '|| a.vlrpago VLR_PAGO,
b.codocorrencia ||' - '|| (select y.descricao from fi_ocrfinanc y  where y.codocorrencia = b.codocorrencia) TIPOS_OCORRENCIAS, 
b.observacao, b.usualteracao USER_ATUACAO, to_char(b.dtahora,'DD/MM/YYYY HH:MM:SS') DIA_HORA
from fi_titulo a
join fi_movocor b
on a.seqtitulo = b.seqidentifica 
where a.seqpessoa in ('18620','22224','16') and 
a.dtaemissao 
between to_date('26/01/2022','DD/MM/YYYY') and to_date('26/01/2022','DD/MM/YYYY')
order by a.seqpessoa,a.nroempresa,a.nrotitulo, b.dtahora
*/

