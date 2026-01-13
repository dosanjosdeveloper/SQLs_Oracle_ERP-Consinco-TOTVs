-- select * from map_produto where seqproduto in (2087804,2043106,2087251,2083043,1993526,1950401)
-- select * from map_familia where seqfamilia in (163406,168639,176661,182365,183263,183462)
-- select * from consincomonitor.tb_creditocupom where dtavalidade = to_date('31/08/2023','DD/MM/YYYY')and sequsuario = 125 and nrocreditocupom = '50010080014342'

select * from consincomonitor.tb_doctocupom where nroempresa = 8 and nrocheckout = 6 order by nronotafiscal desc
