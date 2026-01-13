-- select a.vlrtotfrete, a.* from edi_pedvenda a where a.seqpessoa = 26568
-- select * from consincomonitor.tb_docto

select a.vlrtotfrete, a.nropedvenda, a.* from edi_pedvenda a where a.nropedidoafv in (2023292400449,2023292400280)
