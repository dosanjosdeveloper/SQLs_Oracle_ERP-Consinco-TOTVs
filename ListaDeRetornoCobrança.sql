SELECT a.nrotitulo TITULO,(select descricao from fi_resultado where seqresultado = c.seqresultado) OCORRENCIA,
a.seqpessoa ||' - '||(select nomerazao from ge_pessoa where seqpessoa = a.seqpessoa) PESSOA,
a.vlroriginal, a.vlrnominal, a.vlrpago, t.nrorepresentante || ' - ' || r.apelido as REPRESENTANTE,
c.observacao, b.seqagenda, a.seqtitulo, a.nroempresa, a.qtdcobranca, a.nrodocumento,
 a.observacao, a.obrigdireito,to_char(c.dtaalteracao,'dd/mm/yyyy hh:mm:ss') ,a.usucobranca
FROM fi_titulo a
JOIN fi_agendatitulo b 
on b.seqtitulo = a.seqtitulo
JOIN fi_ageresult c
on c.seqagenda = b.seqagenda
JOIN fi_titrepres t
on t.seqtitulo=a.seqtitulo
join mad_representante r
on t.nrorepresentante=r.nrorepresentante
where a.codespecie = 'DUPR'
and a.abertoquitado = 'A'
order by a.seqpessoa

-- select * from fi_titulo
-- select * from fi_agenda
-- select * from fi_agendatitulo
-- select * from fi_ageresult
