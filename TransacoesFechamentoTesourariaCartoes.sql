-- select * from fi_titulo a 
-- select * from fi_titulonsu
select t.codespecie from fi_especie t where t.codespecie in ('CARTAO','CARDEB','TICKET');

select c.seqtitulo, a.nrotitulo,a.nroparcela, a.nroempresa, c.dtamovimento, c.valor, c.rede, c.bandeira, c.qtdparcela, a.usualteracao||' - '||a.dtaalteracao as DIA_USER_LANCADOR 
from fi_titulonsu c
JOIN fi_titulo a on a.seqtitulo = c.seqtitulo
where a.nrotitulo = 20220226 and a.abertoquitado = 'A' and a.codespecie = 'CARTAO' and a.qtdparcela = '1'
order by a.nrotitulo, a.nroempresa,c.valor  -- c.seqtitulo = 395454830

select c.seqtitulo, a.nrotitulo,a.nroparcela, a.nroempresa, c.dtamovimento, c.valor, c.rede, c.bandeira, c.qtdparcela, a.usualteracao||' - '||a.dtaalteracao as DIA_USER_LANCADOR 
from fi_titulonsu c
JOIN fi_titulo a on a.seqtitulo = c.seqtitulo
where a.dtaemissao between to_date('26/02/2022','DD/MM/YYYY') and to_date('26/02/2022','DD/MM/YYYY') and a.abertoquitado = 'A' and a.codespecie = 'CARTAO' and a.nroparcela = '6'
order by a.nrotitulo, a.nroempresa,c.valor


select * from fi_titulo b 
where b.nrotitulo = '20220226' 
and b.seqpessoa = '453' 
and b.nroparcela = 1
and b.obrigdireito = 'D'
and b.dtaemissao = to_date('26/02/2022','DD/MM/YYYY')
and b.codespecie = 'CARTAO'
and b.abertoquitado = 'A'

select * from ionv_sync.ionv_vendedor_clientes where codvendedor = '1318' and codcli = '18367'
